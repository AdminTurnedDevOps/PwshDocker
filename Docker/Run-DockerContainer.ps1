Set-StrictMode -Version latest

function Run-DockerContainer {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0,
            Mandatory,
            HelpMessage = 'Please enter the docker image you wish to run',
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$imageName,

        [parameter(Position = 1,
            Mandatory,
            HelpMessage = 'Please enter the port that you would like to run on your container')]
        [ValidateNotNullOrEmpty()]
        [Alias('Port')]
        [string]$containerPort,

        [parameter(Position = 2,
            HelpMessage = 'Please enter container name. If you do not enter a name for your container, one will be assigned by default')]
        [Alias('name')]
        [string]$containerName,

        [parameter(Position = 3,
            Mandatory,
            HelpMessage = 'Please enter the runtime you wish to run in your container (Example: /bin/bash for Linux or powershell for Windows')]
        [string]$command = '/bin/bash'
    )
    
    begin { }
    process {
        try {
            docker run -d $imageName -p $containerPort --name $containerName $command
        }

        catch {
            Write-Warning 'An error has occurred'
            $PSCmdlet.ThrowTerminatingError($_)
        }       
    }
    end { }
}