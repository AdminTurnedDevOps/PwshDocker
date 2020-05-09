Set-StrictMode -Version latest

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

    }
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