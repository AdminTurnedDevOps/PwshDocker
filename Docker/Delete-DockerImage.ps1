function Delete-DockerImage {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [parameter(Mandatory,
            HelpMessage = 'List what docker image or images you would like to delete',
            ValueFromPipeline = $true)]
        [alias('dockerImage')]        
        [string[]]$image
    )

    begin {

    }

    process {
        try {
            if($PSCmdlet.ShouldProcess('image') -or ('dockerImage')) {
                docker image rm $image --force
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