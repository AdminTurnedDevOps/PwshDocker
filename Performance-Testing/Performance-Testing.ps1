Import-Module ./PwshDocker.psm1

Write-Output 'Testing Performance on Get-DockerImage'
Measure-Command -Expression {
    Get-DockerImage -dockerImage nginx
}

Pause
Write-Output 'Testing Performance on Pull-DockerImage'
Measure-Command -Expression {
    Pull-DockerImage -image redis
}

Pause
Write-Output 'Testing Performance on Run-DockerContainer'
Measure-Command -Expression {
    Run-DockerContainer -imageName redis -containerPort 6379 -containerName redisTest -command /bin/bash
}

Pause
Write-Output 'Testing Performance on Get-DockerLogs'
Measure-Command -Expression {
    Get-DockerLogs
}