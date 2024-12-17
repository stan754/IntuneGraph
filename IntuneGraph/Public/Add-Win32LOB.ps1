function Add-Win32Lob() {
    <#
    .SYNOPSIS
        This function is used to upload a Win32 Application to Microsoft Intune
    .DESCRIPTION
        This function is used to upload a Win32 Application to Microsoft Intune using the Microsoft Graph API with the only dependency being the Microsoft.Graph.Authentication Module
    .EXAMPLE
        Add-Win32Lob -SourceFile "C:\Packages\package.intunewin" `
            -Publisher "Microsoft" `
            -Description "Package description" `
            -DetectionRules @($fileRule) `
            -ReturnCodes $defaultCodes
        # Adds a package to Microsoft Intune with just the required parameters, for anything that's not an MSI the installcmd and uninstallcmd
    .EXAMPLE
        Add-Win32Lob -SourceFile "C:\Packages\package.intunewin" `
            -Publisher "Microsoft" `
            -Description "Package description" `
            -DetectionRules @($fileRule) `
            -ReturnCodes $defaultCodes `
            -InstallCmdLine "setup.exe" `
            -UninstallCmdLine "uninstall.exe"
        # Adds a package to Microsoft Intune with just the required parameters for an exe installer
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs the application body received from the Graph API as an object
    .NOTES
        NAME: Add-Win32LOB
    #>
    [cmdletbinding()]
    param (
        # The intunewin sourcefile created with the IntuneWinAppUtil.exe
        [parameter(Mandatory = $true, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [string] $SourceFile,
        # The DisplayName for the application in Microsoft Intune
        # This parameter is optional and will be filled with information from the detection.xml otherwise
        [parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string] $DisplayName,
        # The Publisher for the application in Microsoft Intune
        [parameter(Mandatory = $true, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [string] $Publisher,
        # The Description for the application in Microsoft Intune
        [parameter(Mandatory = $true, Position = 3)]
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        # An array of detection rules for the application needs a minimum of 1
        [parameter(Mandatory = $true, Position = 4)]
        [ValidateNotNullOrEmpty()]
        [array] $DetectionRules,
        # The returncodes for the application in Microsoft Intune
        # To use the default returncodes you can get these with Get-DefaultReturnCodes
        [parameter(Mandatory = $true, Position = 5)]
        [ValidateNotNullOrEmpty()]
        [array] $ReturnCodes,
        # The install command to install the application
        [parameter(Mandatory = $false, Position = 6)]
        [ValidateNotNullOrEmpty()]
        [string] $InstallCmdLine,
        # The uninstall command to uninstall the application
        [parameter(Mandatory = $false, Position = 7)]
        [ValidateNotNullOrEmpty()]
        [string] $UninstallCmdLine,
        # The installscope for the application this can be either system or user
        # By default this is set to system
        [parameter(Mandatory = $false, Position = 8)]
        [ValidateSet('system', 'user')]
        [string] $installExperience = "system",
        # The time the function sleeps after creating and uploading the application to make sure it's available
        # By default this is 30 seconds
        [parameter(Mandatory = $false)]
        [int] $Sleep = 30
    )

    try	{
        $LOBType = "microsoft.graph.win32LobApp"

        Write-Verbose "Testing if SourceFile '$SourceFile' Path is valid..."
        Test-SourceFile "$SourceFile"

        Write-Verbose
        Write-Verbose "Creating JSON data to pass to the service..."

        $DetectionXML = Get-IntuneWinXML "$SourceFile" -fileName "detection.xml"

        if ($DisplayName) { $DisplayName = $DisplayName }
        else { $DisplayName = $DetectionXML.ApplicationInfo.Name }
      
        $FileName = $DetectionXML.ApplicationInfo.FileName

        $SetupFileName = $DetectionXML.ApplicationInfo.SetupFile

        $SourceFileName = [System.IO.Path]::GetFileName($SourceFile)

        $Ext = [System.IO.Path]::GetExtension($SetupFileName)

        if ((($Ext).contains("msi") -or ($Ext).contains("Msi")) -and (!$InstallCmdLine -or !$UninstallCmdLine)) {
            $MsiExecutionContext = $DetectionXML.ApplicationInfo.MsiInfo.MsiExecutionContext
            $MsiPackageType = "DualPurpose"
            if ($MsiExecutionContext -eq "System") { $MsiPackageType = "PerMachine" }
            elseif ($MsiExecutionContext -eq "User") { $MsiPackageType = "PerUser" }

            $MsiProductCode = $DetectionXML.ApplicationInfo.MsiInfo.MsiProductCode
            $MsiProductVersion = $DetectionXML.ApplicationInfo.MsiInfo.MsiProductVersion
            $MsiPublisher = $DetectionXML.ApplicationInfo.MsiInfo.MsiPublisher
            $MsiRequiresReboot = $DetectionXML.ApplicationInfo.MsiInfo.MsiRequiresReboot
            $MsiUpgradeCode = $DetectionXML.ApplicationInfo.MsiInfo.MsiUpgradeCode
          
            if ($MsiRequiresReboot -eq "false") { $MsiRequiresReboot = $false }
            elseif ($MsiRequiresReboot -eq "true") { $MsiRequiresReboot = $true }

            $mobileAppBody = Get-Win32AppBody `
                -MSI `
                -DisplayName "$DisplayName" `
                -Publisher "$Publisher" `
                -Description $Description `
                -Filename $SourceFileName `
                -SetupFileName "$SetupFileName" `
                -InstallExperience $installExperience `
                -MSIPackageType $MsiPackageType `
                -MSIProductCode $MsiProductCode `
                -MSIProductName $DisplayName `
                -MSIProductVersion $MsiProductVersion `
                -MSIPublisher $MsiPublisher `
                -MSIRequiresReboot $MsiRequiresReboot `
                -MSIUpgradeCode $MsiUpgradeCode
        }
        else {
            $mobileAppBody = Get-Win32AppBody `
                -EXE `
                -DisplayName "$DisplayName" `
                -Publisher "$Publisher" `
                -Description $Description `
                -Filename $SourceFileName `
                -SetupFileName "$SetupFileName" `
                -InstallExperience $installExperience `
                -InstallCommandLine $InstallCmdLine `
                -UninstallCommandLine $uninstallcmdline
        }

        if ($DetectionRules.'@odata.type' -contains "#microsoft.graph.win32LobAppPowerShellScriptDetection" -and @($DetectionRules).'@odata.type'.Count -gt 1) {
            throw "A Detection Rule can either be 'Manually configure detection rules' or 'Use a custom detection script'"
        }
        else {
            $mobileAppBody | Add-Member -MemberType NoteProperty -Name 'DetectionRules' -Value $DetectionRules
        }


        if ($ReturnCodes) {
            $mobileAppBody | Add-Member -MemberType NoteProperty -Name 'ReturnCodes' -Value @($ReturnCodes)
        }
        else {
            throw "Intunewin file requires ReturnCodes to be specified, If you want to use the default ReturnCode run 'Get-DefaultReturnCodes'"
        }

        Write-Verbose "Creating application in Intune..."
        $mobileApp = Invoke-PostRequest "mobileApps" ($mobileAppBody | ConvertTo-Json)

        Write-Verbose "Creating Content Version in the service for the application..."
        $appId = $mobileApp.id
        $contentVersionUri = "mobileApps/$appId/$LOBType/contentVersions"
        $contentVersion = Invoke-PostRequest $contentVersionUri "{}"

        Write-Verbose "Getting Encryption Information for '$SourceFile'..."

        $encryptionInfo = @{}
        $encryptionInfo.encryptionKey = $DetectionXML.ApplicationInfo.EncryptionInfo.EncryptionKey
        $encryptionInfo.macKey = $DetectionXML.ApplicationInfo.EncryptionInfo.macKey
        $encryptionInfo.initializationVector = $DetectionXML.ApplicationInfo.EncryptionInfo.initializationVector
        $encryptionInfo.mac = $DetectionXML.ApplicationInfo.EncryptionInfo.mac
        $encryptionInfo.profileIdentifier = "ProfileVersion1"
        $encryptionInfo.fileDigest = $DetectionXML.ApplicationInfo.EncryptionInfo.fileDigest
        $encryptionInfo.fileDigestAlgorithm = $DetectionXML.ApplicationInfo.EncryptionInfo.fileDigestAlgorithm

        $fileEncryptionInfo = @{}
        $fileEncryptionInfo.fileEncryptionInfo = $encryptionInfo

        $IntuneWinFile = Get-IntuneWinFile "$SourceFile" -fileName "$filename"

        [int64]$Size = $DetectionXML.ApplicationInfo.UnencryptedContentSize
        $EncrySize = (Get-Item "$IntuneWinFile").Length

        Write-Verbose "Creating a new file entry in Azure for the upload..."
        $contentVersionId = $contentVersion.id
        $fileBody = Get-AppFileBody "$FileName" $Size $EncrySize $null
        $filesUri = "mobileApps/$appId/$LOBType/contentVersions/$contentVersionId/files"
        $file = Invoke-PostRequest $filesUri ($fileBody | ConvertTo-Json)

        Write-Verbose "Waiting for the file entry URI to be created..."
        $fileId = $file.id
        $fileUri = "mobileApps/$appId/$LOBType/contentVersions/$contentVersionId/files/$fileId"
        $file = Wait-FileProcessing $fileUri "AzureStorageUriRequest"

        Write-Verbose "Uploading file to Azure Storage..."

        Add-FileToAzureStorage $file.azureStorageUri "$IntuneWinFile" $fileUri

        Remove-Item "$IntuneWinFile" -Force

        Write-Verbose "Committing the file into Azure Storage..."
        $commitFileUri = "mobileApps/$appId/$LOBType/contentVersions/$contentVersionId/files/$fileId/commit"
        Invoke-PostRequest $commitFileUri ($fileEncryptionInfo | ConvertTo-Json)

        Write-Verbose "Waiting for the service to process the commit file request..."
        $file = Wait-FileProcessing $fileUri "CommitFile"

        Write-Verbose "Committing the file into Azure Storage..."
        $commitAppUri = "mobileApps/$appId"
        $commitAppBody = Get-AppCommitBody $contentVersionId $LOBType
        Invoke-PatchRequest $commitAppUri ($commitAppBody | ConvertTo-Json)

        Write-Verbose "Sleeping for $Sleep seconds to allow patch completion..."
        Start-Sleep $Sleep

        $FinalApplicationResponse = Invoke-GetRequest "mobileApps/$appId"

        return $FinalApplicationResponse
    }

    catch {
        throw "Aborting with exception: $($_.Exception.ToString())"
    }
}