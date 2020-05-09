Set-StrictMode -Version latest

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