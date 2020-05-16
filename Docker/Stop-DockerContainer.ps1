function Stop-DockerContainer {
    [cmdletbinding(ConfirmImpact = 'high')]
    param(
        [parameter(Mandatory,
            HelpMessage = 'Name of the Docker container that you wish to stop',
            ValueFromPipeline = $true)]
        [alias('name')]        
        [string[]]$containerName
    )

    begin {

    }

    process {
        try {
            docker container stop $containerName
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {
        Write-Output "Command Finished: $($MyInvocation.MyCommand)"
    }
}