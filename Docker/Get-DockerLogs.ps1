Set-StrictMode -Version latest

function Get-DockerLogs {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param()

    begin {

    }
    process {
        try {
            $dock = docker container ls --no-trunc --format "{{json .}}"
            $out = $dock | ConvertFrom-Json

            if (-not($out)) { Write-Warning 'No containers are running...' }

            else {
                Write-Output 'Retrieving containers with container IDs'
                $out | select -ExpandProperty Names
                sleep 3
                $containerName = Read-Host 'Please enter a container name from the list above'    
                docker logs --details $containerName
            }
        }
        catch {
            Write-Warning 'An error has occurred'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
    end { }
}