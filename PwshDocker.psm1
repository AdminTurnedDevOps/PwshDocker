Set-StrictMode -Version latest

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

function Get-DockerLogs {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param()

    begin { }
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
function Run-DockerImage {
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
function Get-DockerImage {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0,
            Mandatory,
            HelpMessage = 'Please enter the docker image you wish to search for on your local machine',
            ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$dockerImage
    )
    begin { }
    process {
        try { 
            $img = docker image ls "*$dockerImage*" --no-trunc --format "{{json .}}"
            $imgOut = $img | ConvertFrom-Json

            if (-not ($imgOut)) { Write-Warning "No images with name: $dockerImage" }

            else {
                Write-Output "Retrieving image names with name: $dockerImage"
                $imgOut
            }
        }

        catch {
            Write-Warning 'An error has occured'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
    end { }   
}

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

function Tag-DockerImage {
    [cmdletbinding(ConfirmImpact = 'low')]
    param(
        [parameter(Mandatory,
            Position = 0,
            HelpMessage = 'Please put the desired name of your tag for your source image')]
        [string]$tagName
    )

    begin { }

    process {
        try {
            $dock = docker image ls --no-trunc --format "{{json .}}"
            $out = $dock | ConvertFrom-Json

            if (-not($out)) { Write-Warning 'No images exist...' }

            else {
                Write-Output 'Retrieving image names'
                $out | select Repository, Tag | fl
                sleep 3
                $sourceImage = Read-Host 'Please enter a name and tag from the listed docker images above that you would like to tag'    
                docker tag $sourceImage $tagName
            }
        }
        catch {
            Write-Warning 'An error has occured'
            $PSCmdlet.ThrowTerminatingError($_)
        }        
    }
    end { }
}