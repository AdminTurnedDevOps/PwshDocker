Set-StrictMode -Version latest
function Exec-DockerContainer {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'high')]
    param(
        [parameter(Mandatory,
            Position = 0,
            HelpMessage = 'Please enter command that you would like to run inside of container. For example, /bin/bash or powershell')]
        [string]$command
    )

    begin {

    }
    process {
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
        try {
            docker exec -ti $containerName $command
        }

        catch {
            Write-Warning 'There was an issue connecting to your Docker container'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
    end { }
}