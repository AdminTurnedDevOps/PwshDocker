function Delete-DockerContainer {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High', DefaultParameterSetName = 'deleteContainer')]
    param(
        [parameter(Mandatory,
            ParameterSetName = 'deleteContainer',
            HelpMessage = 'Enter Docker container ID of the container you woud like to delete',
            ValueFromPipeline = $true)]
        [alias('ID')]
        [string]$containerID
    )

    begin {
        
    }

    process {
        try {
            if($PSCmdlet.ShouldProcess('containerID')) {
                docker container kill $containerID
            }
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {
        Write-Output "Command Finished: $($MyInvocation.MyCommand)"
    }
}