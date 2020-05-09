..\PwshDocker.psm1

describe Get-DockerImage {
    $img = 'redis'
    $result = Get-DockerImage -dockerImage $img | select -ExpandProperty Repository

    it 'should return redis' {
        $result | should be 'redis'
    }
}

describe Get-DockerImage {
    $img = 'nginx'
    $result = Get-DockerImage -dockerImage $img | select -ExpandProperty Repository

    it 'should return nginx' {
        $result | should be 'nginx'
    }
}

describe Run-DockerContainer {
    $imageName = 'nginx'
    $containerPort = '8080:80'
    $containerName = 'mjlcontainer'
    $command = '/bin/bash'

    $result = Run-DockerContainer -imageName $imageName -containerPort $containerPort -containerName $containerName -command $command

    it 'should return created container' {
        $result | should be $true
    }
}

describe Pull-DockerImage {
    $image = 'nginx'

    $result = Pull-DockerImage -image $image

    it 'should return pulling of the nginx image' {
        $result | should be @('Pulling down Docker image', 'Using default tag: latest', 'latest: Pulling from library/nginx', 'Digest: sha256:b2d89d0a210398b4d1120b3e3a7672c16a4ba09c2c4a0395f18b9f7999b768f2', 'Status: Image is up to date for nginx:latest', 'docker.io/library/nginx:latest').
    }
}