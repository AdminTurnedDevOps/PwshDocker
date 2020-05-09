$getVersion = docker --version

if (-not ($getVersion)) {
    Write-Warning 'Docker is not installed'
    Write-Output 'Would you like to be directed to where you can download Docker?'
    $download = Read-Host 'Type 1 for yes or 2 for no'

    switch ($download) {
            
        "1" { 
            if ($IsWindows -like "*True*") {
                Write-Output 'Opening Docker for Windows browser...'
                start microsoft-edge:https://docs.docker.com/docker-for-windows/install/
                Pause
            }

            if ($IsMacOS -like "*True*") {
                Write-Output 'Opening Docker for OS X...'
                start-process -FilePath '/Applications/Safari.app' -ArgumentList 'https://docs.docker.com/docker-for-mac/install/'
                Pause
            }

            elseif ($IsLinux -like "*True*") {
                Write-Output 'Please install the Docker package best suited for your Linux distro...'
                pause
                exit
            }
        }
        "2" {
            Write-Warning 'Exiting...'
            Pause
            exit
        } 
    }            
}

$Docker  = @( Get-ChildItem -Path Docker\*.ps1 -ErrorAction SilentlyContinue )

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