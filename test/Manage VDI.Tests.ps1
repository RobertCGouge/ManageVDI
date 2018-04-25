$ModuleManifestName = 'Manage VDI.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Import-Module '..\Manage VDI.psm1'

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

Describe 'Update-PublishedDesktop' {
    It 'Errors if -DCC is null' {
        {Update-PublishedDesktop -DCC $null} | Should throw
    }
    It 'Errors if -DCC is empty' {
        {Update-PublishedDesktop -DCC ''} | Should throw
    }
    It 'Errors if connection to Delivery Controller via IP fails' {
        {Update-PublishedDesktop -DCC '192.168.1.20'} | should throw
    }
    It 'Errors if connection to Delivery Controller via FQDN fails' {
        {Update-PublishedDesktop -DCC 'dcc.domain.net'} | should throw
    }
}


