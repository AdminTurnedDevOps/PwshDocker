$Docker  = @( Get-ChildItem -Path $PSScriptRoot\Docker\*.ps1 -ErrorAction SilentlyContinue )

foreach($import in @($Docker))
{
    try
    {
        . $import.fullname
    }
    catch
    {
        Write-Warning 'An error has occurred'
        $PSCmdlet.ThrowTerminatingError($_)
    }
}

Export-ModuleMember -Function $Docker.Basename