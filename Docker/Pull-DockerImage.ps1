Set-StrictMode -Version latest

function Pull-DockerImage {
    [cmdletbinding(DefaultParameterSetName = 'PullDockerImage', ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0,
            Mandatory,
            HelpMessage = 'Please enter the docker image you wish to pull down to your local machine',
            ValueFromPipeline = $true,
            ParameterSetName = 'PullDockerImage')]
        [ValidateNotNullOrEmpty()]
        [alias('DockerImage')]
        [string]$image
    )

    begin { }

    process {
        if ($PSBoundParameters.ContainsKey('image')) {
            try {
                if ($image -like "*microsoft*") {
                    Write-Output 'Pulling down Windows image'
                    docker pull $image
                }

                if ($image -like "*ubuntu*") {
                    Write-Output "Pulling down Ubuntu image"
                    docker pull $image
                }

                if ($image -like "*centos*") {
                    Write-Output "Pulling down Centos image"
                    docker pull $image
                }

                else {
                    Write-Output 'Pulling down Docker image'
                    docker pull $image
                }
            }
            catch {
                $PSCmdlet.ThrowTerminatingError($_)
            }
        }
    }
    end { }
}