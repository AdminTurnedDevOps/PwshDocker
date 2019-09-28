Set-StrictMode -Version latest

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
    
    begin {
        $getVersion = docker --version
        if (-not ($getVersion)) {
            Write-Warning 'Docker is not installed'
            Write-Output 'Would you like to be directed to where you can download Docker?'
            $download = Read-Host 'Type 1 for yes or 2 for no'

            switch ($download) {
            
                "1" { 
                    if ($IsWindows -like "*True*") {
                        start microsoft-edge:https://docs.docker.com/docker-for-windows/install/
                        Pause
                        exit
                    }
                }
                "2" {
                    if ($IsMacOS -like "*True*") {
                        start-process -FilePath '/Applications/Safari.app' -ArgumentList 'https://docs.docker.com/docker-for-mac/install/'
                        Pause
                        exit
                    } 
                }            
            }
        }
    }
    process {
        try {
        docker run -d $imageName -p $containerPort --name $containerName $command
        }

        catch {
            Write-Warning 'An error has occurred'
            $PSCmdlet.ThrowTerminatingError($_)
            }
        
    }
    end { 

    }
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
    begin {
        $getVersion = docker --version
        if (-not ($getVersion)) {
            Write-Warning 'Docker is not installed'
            Write-Output 'Would you like to be directed to where you can download Docker?'
            $download = Read-Host 'Type 1 for yes or 2 for no'

            switch ($download) {
            
                "1" { 
                    if ($IsWindows -like "*True*") {
                        start microsoft-edge:https://docs.docker.com/docker-for-windows/install/
                        Pause
                        exit
                    }
                }
                "2" {
                    if ($IsMacOS -like "*True*") {
                        start-process -FilePath '/Applications/Safari.app' -ArgumentList 'https://docs.docker.com/docker-for-mac/install/'
                        Pause
                        exit
                    } 
                }            
            }
        }
    }
    process { docker image ls $dockerImage }
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

    begin {
        $getVersion = docker --version
        if (-not ($getVersion)) {
            Write-Warning 'Docker is not installed'
            Write-Output 'Would you like to be directed to where you can download Docker?'
            $download = Read-Host 'Type 1 for yes or 2 for no'

            switch ($download) {
            
                "1" { 
                    if ($IsWindows -like "*True*") {
                        start microsoft-edge:https://docs.docker.com/docker-for-windows/install/
                        Pause
                        exit
                    }
                }
                "2" {
                    if ($IsMacOS -like "*True*") {
                        start-process -FilePath '/Applications/Safari.app' -ArgumentList 'https://docs.docker.com/docker-for-mac/install/'
                        Pause
                        exit
                    } 
                }            
            }
        }
    }

    process {
        if ($PSBoundParameters.ContainsKey('image')) {
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
    }

    end { }
}