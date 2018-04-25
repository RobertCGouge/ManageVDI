# Implement your module commands in this script.

function Update-PublishedDesktop {
    [CmdletBinding()]
    param (
        # This is the name or IP of the Delivery Controller to run the command on
        [Parameter(Mandatory = $true,
            ParameterSetName = 'Desktop Group', 'Individual Desktop')]
        [ValidateNotNullOrEmpty]
        [ValidateScript( {
                try {
                    Test-Connection -ComputerName $_ -Quiet -Count 1 -ErrorAction Stop
                }
                catch {
                    throw "Could not connect to '${_}'"
                }
            })]
        [string]
        $DCC,
        # This is the Delivery Group you want to update
        [Parameter(Mandatory = $true,
            ParameterSetName = 'Desktop Group')]
        [ValidateNotNullOrEmpty]
        [string]
        [ValidateScript( {
                $true
            })]
        $DeliveryGroup,
        # This is the individual VDI Set you want to update
        [Parameter(Mandatory = $true,
        ParameterSetName='Individual Desktop')]
        [ValidateNotNullOrEmpty]
        [string]
        $Desktop,
        # This is the text that will show in the Citrix StoreFront
        [Parameter(Mandatory=$true,
            ParameterSetName = 'Desktop Group', 'Individual Desktop')]
        [ValidateNotNullOrEmpty]
        [string]
        $Text

    )

    begin {

    }

    process {
    }

    end {
    }
}

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
