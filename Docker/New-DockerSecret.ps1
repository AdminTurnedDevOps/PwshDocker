Set-StrictMode -Version latest

Function New-DockerSecret {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0)]
        [string]$name
    )

    if ($PSCmdlet.ShouldProcess('name')) {
        $dock = docker secret ls --filter "name=$name" --format "{{json .}}"
        $out = $dock | ConvertFrom-Json

        if ($name -like $out.Name) {
            Write-Warning 'Warning: Secret already exists..'
            Pause
            exit
        }

        try {
            $sec = Read-Host 'Insert secret..' -AsSecureString
            $secret = [System.Management.Automation.PSCredential]::new($sec) | docker secret create $name
        }

        catch {
            Write-Warning 'An error occurred...'
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}