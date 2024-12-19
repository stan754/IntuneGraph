function Get-DetectionRule() {
    <#
    .SYNOPSIS
        This function is used to create new detection rules for a Win32 Application in Microsoft Intune
    .DESCRIPTION
        This function is used to create new detection rules for a Win32 Application in Microsoft Intune
        The options are Powershell, MSI, File or, Registry
    .EXAMPLE
        Get-DetectionRule -PowerShell -ScriptFile detection.ps1 -EnforceSignatureCheck $false -RunAs32Bit $false
    .EXAMPLE
        Get-DetectionRule -MSI -MSIProductCode
    .EXAMPLE
        Get-DetectionRule -File -Path 'C:\Program Files\' -FileOrFolderName 'FolderToDetect' -FileDetectionType exists -Check32BitOn64System False
    .EXAMPLE
        Get-DetectionRule -Registry -RegistryKeyPath -RegistryDetectionType string -RegistryValueName 'value' -Check32BitRegOn64System False
    .INPUTS
        None. No objects can be piped into this function
    .OUTPUTS
        This function outputs a new detection rule for a Win32 Application in Microsoft Intune
    .NOTES
        NAME: Get-DetectionRule
    #>
    [cmdletbinding()]
    param (
        # Switch to select PowerShell detection rule
        [parameter(Mandatory = $true, ParameterSetName = "PowerShell", Position = 1)]
        [Switch] $PowerShell,
        # Switch to select MSI detection rule
        [parameter(Mandatory = $true, ParameterSetName = "MSI", Position = 1)]
        [Switch] $MSI,
        # Switch to select File detection rule
        [parameter(Mandatory = $true, ParameterSetName = "File", Position = 1)]
        [Switch] $File,
        # Switch to select Registry detection rule
        [parameter(Mandatory = $true, ParameterSetName = "Registry", Position = 1)]
        [Switch] $Registry,
        # The path to the PowerShell detection script file
        [parameter(Mandatory = $true, ParameterSetName = "PowerShell")]
        [ValidateNotNullOrEmpty()]
        [String] $ScriptFile,
        # A value indicating whether signature check is enforced
        [parameter(Mandatory = $false, ParameterSetName = "PowerShell")]
        [bool] $EnforceSignatureCheck = $false,
        # A value indicating whether this script should run as 32-bit
        [parameter(Mandatory = $false, ParameterSetName = "PowerShell")]
        [bool] $RunAs32Bit = $false,
        # The product code of Win32 Line of Business (LoB) app
        [parameter(Mandatory = $true, ParameterSetName = "MSI")]
        [ValidateNotNullOrEmpty()]
        [String] $MSIProductCode,
        # The operator to detect product version
        [parameter(Mandatory = $false, ParameterSetName = "MSI")]
        [ValidateSet("notConfigured", "equal", "notEqual", "greaterThan", "greaterThanOrEqual", "lessThan", "lessThanOrEqual")]
        [String] $MSIProductVersionOperator = "notConfigured",
        # The product version of Win32 Line of Business (LoB) app
        [parameter(Mandatory = $false, ParameterSetName = "MSI")]
        [String] $MSIProductVersion = $null,
        # The file or folder path to detect Win32 Line of Business (LoB) app
        [parameter(Mandatory = $true, ParameterSetName = "File")]
        [ValidateNotNullOrEmpty()]
        [String] $Path,
        # The file or folder name to detect Win32 Line of Business (LoB) app
        [parameter(Mandatory = $true, ParameterSetName = "File")]
        [ValidateNotNullOrEmpty()]
        [string] $FileOrFolderName,
        # The file system detection type
        [parameter(Mandatory = $true, ParameterSetName = "File")]
        [ValidateSet("notConfigured", "exists", "modifiedDate", "createdDate", "version", "sizeInMB", "doesNotExist")]
        [string] $FileDetectionType,
        # The operator for file or folder detection
        [parameter(Mandatory = $false, ParameterSetName = "File")]
        [ValidateSet("notConfigured", "equal", "notEqual", "greaterThan", "greaterThanOrEqual", "lessThan", "lessThanOrEqual")]
        [string] $FileDetectionOperator = "notConfigured",
        # The file or folder detection value
        [parameter(Mandatory = $false, ParameterSetName = "File")]
        [string] $FileDetectionValue = $null,
        # A value indicating whether this file or folder is for checking 32-bit app on 64-bit system
        [parameter(Mandatory = $false, ParameterSetName = "File")]
        [bool] $Check32BitOn64System = $false,
        # The registry key path to detect Win32 Line of Business (LoB) app
        [parameter(Mandatory = $true, ParameterSetName = "Registry")]
        [ValidateNotNullOrEmpty()]
        [String] $RegistryKeyPath,
        # The registry data detection type
        [parameter(Mandatory = $true, ParameterSetName = "Registry")]
        [ValidateSet("notConfigured", "exists", "doesNotExist", "string", "integer", "version")]
        [string] $RegistryDetectionType,
        # The operator for registry data detection
        [parameter(Mandatory = $false, ParameterSetName = "Registry")]
        [ValidateSet("notConfigured", "equal", "notEqual", "greaterThan", "greaterThanOrEqual", "lessThan", "lessThanOrEqual")]
        [string] $RegistryDetectionOperator = "notConfigured",
        # The registry value name
        [parameter(Mandatory = $false, ParameterSetName = "Registry")]
        [ValidateNotNullOrEmpty()]
        [String] $RegistryValueName,
        # The registry detection value
        [parameter(Mandatory = $false, ParameterSetName = "Registry")]
        [String] $RegistryDetectionValue = "",
        # A value indicating whether this registry path is for checking 32-bit app on 64-bit system
        [parameter(Mandatory = $false, ParameterSetName = "Registry")]
        [string] $Check32BitRegOn64System = $false
    )

    if ($PowerShell) {
        if (!(Test-Path "$ScriptFile")) {
            throw "Could not find file '$ScriptFile'..."
        }

        $ScriptContent = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("$ScriptFile"))

        $DR = @{ "@odata.type" = "#microsoft.graph.win32LobAppPowerShellScriptDetection" }
        $DR.enforceSignatureCheck = "$EnforceSignatureCheck"
        $DR.runAs32Bit = "$RunAs32Bit"
        $DR.scriptContent = "$ScriptContent"
    }

    elseif ($MSI) {
        $DR = @{ "@odata.type" = "#microsoft.graph.win32LobAppProductCodeDetection" }
        $DR.productVersionOperator = "$MSIProductVersionOperator"
        $DR.productCode = "$MSIProductCode"
        $DR.productVersion = $MSIProductVersion
    }

    elseif ($File) {
        $DR = @{ "@odata.type" = "#microsoft.graph.win32LobAppFileSystemDetection" }
        $DR.check32BitOn64System = "$Check32BitOn64System"
        $DR.detectionType = "$FileDetectionType"
        $DR.detectionValue = $FileDetectionValue
        $DR.fileOrFolderName = "$FileOrFolderName"
        $DR.operator = "$FileDetectionOperator"
        $DR.path = "$Path"
    }

    elseif ($Registry) {
        $DR = @{ "@odata.type" = "#microsoft.graph.win32LobAppRegistryDetection" }
        $DR.check32BitOn64System = "$Check32BitRegOn64System"
        $DR.detectionType = "$RegistryDetectionType"
        $DR.detectionValue = "$RegistryDetectionValue"
        $DR.keyPath = "$RegistryKeyPath"
        $DR.operator = "$RegistryDetectionOperator"
        $DR.valueName = "$RegistryValueName"
    }

    return $DR
}