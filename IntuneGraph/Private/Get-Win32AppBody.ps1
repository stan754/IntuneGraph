function Get-Win32AppBody {
    <#
    .SYNOPSIS
        This function returns a Win32 application body for the Microsoft Graph API
    .DESCRIPTION
        This function returns a Win32 application body for the Microsoft Graph API
    .EXAMPLE
        Get-Win32AppBody `
            -MSI `
            -DisplayName "$DisplayName" `
            -Publisher "$Publisher" `
            -Description $Description `
            -Filename $SourceFileName `
            -SetupFileName "$SetupFileName" `
            -InstallScope $installScope `
            -MSIPackageType $MsiPackageType `
            -MSIProductCode $MsiProductCode `
            -MSIProductName $DisplayName `
            -MSIProductVersion $MsiProductVersion `
            -MSIPublisher $MsiPublisher `
            -MSIRequiresReboot $MsiRequiresReboot `
            -MSIUpgradeCode $MsiUpgradeCode
    .EXAMPLE
        Get-Win32AppBody `
            -EXE `
            -DisplayName "$DisplayName" `
            -Publisher "$Publisher" `
            -Description $Description `
            -Filename $SourceFileName `
            -SetupFileName "$SetupFileName" `
            -InstallExperience $installExperience `
            -InstallCommandLine $InstallCmdLine `
            -UninstallCommandLine $uninstallcmdline
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function returns the application body
    .NOTES
        NAME: Get-Win32AppBody
    #>
    param (
        # Switch to select MSI
        [parameter(Mandatory = $true, ParameterSetName = "MSI", Position = 1)]
        [Switch] $MSI,
        # Switch to select EXE
        [parameter(Mandatory = $true, ParameterSetName = "EXE", Position = 1)]
        [Switch] $EXE,
        # The display name to show in Microsoft Intune
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $DisplayName,
        # The publisher name to show in Microsoft Intune
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Publisher,
        # The description to show in Microsoft Intune
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Description,
        # The file name of the intunewin to show in Microsoft Intune
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $Filename,
        # The setup file name
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string] $SetupFileName,
        # The install scope of the application
        [parameter(Mandatory = $true)]
        [ValidateSet('system', 'user')]
        [string] $InstallScope,
        # Device restart behavior
        [parameter(Mandatory = $false)]
        [ValidateSet('basedOnReturnCode', 'allow', 'suppress', 'force')]
        [string] $DeviceRestartBehavior = 'suppress',
        # The install command for EXE
        [parameter(Mandatory = $true, ParameterSetName = "EXE")]
        [ValidateNotNullOrEmpty()]
        [string] $InstallCommandLine,
        # The uninstall command for EXE
        [parameter(Mandatory = $true, ParameterSetName = "EXE")]
        [ValidateNotNullOrEmpty()]
        [string] $UninstallCommandLine,
        # The MSI package type
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [ValidateSet("perMachine", "perUser", "dualPurpose")]
        [string] $MSIPackageType,
        # The MSI product code
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [ValidateNotNullOrEmpty()]
        [string] $MSIProductCode,
        # The MSI product name
        [parameter(Mandatory = $false, ParameterSetName = "MSI")]
        [string] $MSIProductName,
        # The MSI product version
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [ValidateNotNullOrEmpty()]
        [string] $MSIProductVersion,
        # The MSI publisher
        [parameter(Mandatory = $false, ParameterSetName = "MSI")]
        [string] $MSIPublisher,
        # Whether the MSI app requires the machine to reboot to complete installation
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [bool] $MSIRequiresReboot,
        # The MSI upgrade code
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [ValidateNotNullOrEmpty()]
        [string] $MSIUpgradeCode,
        # Allow an application to be uninstallable from the Company Portal
        [parameter(Mandatory = $false)]
        [switch] $AllowUninstall
    )

    if ($MSI) {
        $body = @{ "@odata.type" = "#microsoft.graph.win32LobApp" }
        $body.applicableArchitectures = "x64,x86"
        $body.description = $Description
        $body.developer = ""
        $body.displayName = $DisplayName
        $body.fileName = $Filename
        $body.installCommandLine = "msiexec /i `"$SetupFileName`""
        $body.installExperience = @{
            "runAsAccount" = "$InstallScope" 
            "deviceRestartBehavior" = "$DeviceRestartBehavior"
        }
        $body.informationUrl = $null
        $body.isFeatured = $false
        $body.minimumSupportedOperatingSystem = @{"v10_1607" = $true }
        $body.msiInformation = @{
            "packageType"    = "$MSIPackageType"
            "productCode"    = "$MSIProductCode"
            "productName"    = "$MSIProductName"
            "productVersion" = "$MSIProductVersion"
            "publisher"      = "$MSIPublisher"
            "requiresReboot" = "$MSIRequiresReboot"
            "upgradeCode"    = "$MSIUpgradeCode"
        }
        $body.notes = ""
        $body.owner = ""
        $body.privacyInformationUrl = $null
        $body.publisher = $Publisher
        $body.runAs32bit = $false
        $body.setupFilePath = $SetupFileName
        $body.uninstallCommandLine = "msiexec /x `"$MSIProductCode`""
        $body.allowAvailableUninstall = $AllowUninstall
    }
    elseif ($EXE) {
        $body = @{ "@odata.type" = "#microsoft.graph.win32LobApp" }
        $body.description = $Description
        $body.developer = ""
        $body.displayName = $DisplayName
        $body.fileName = $Filename
        $body.installCommandLine = "$InstallCommandLine"
        $body.installExperience = @{
            "runAsAccount" = "$InstallScope" 
            "deviceRestartBehavior" = "$DeviceRestartBehavior"
        }
        $body.informationUrl = $null
        $body.isFeatured = $false
        $body.minimumSupportedOperatingSystem = @{"v10_1607" = $true }
        $body.msiInformation = $null
        $body.notes = ""
        $body.owner = ""
        $body.privacyInformationUrl = $null
        $body.publisher = $Publisher
        $body.runAs32bit = $false
        $body.setupFilePath = $SetupFileName
        $body.uninstallCommandLine = "$UninstallCommandLine"
        $body.allowAvailableUninstall = $AllowUninstall
    }

    $body
}