..\PwshDocker.psm1

describe Get-DockerImage {
    $img = 'redis'
    $result = Get-DockerImage -dockerImage $img | select -ExpandProperty Repository

    it 'should return redis' {
    $result | should be 'redis'
    }
}