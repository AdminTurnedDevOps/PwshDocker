Set-StrictMode -Version latest

Function Get-DockerSecret {
    [cmdletbinding(SupportsShouldProcess, ConfirmImpact = 'low')]
    param(
        [parameter(Position = 0)]
        [string]$name
    )

    if ($PSCmdlet.ShouldProcess('name')) {
        $dock = docker secret ls --filter "name=$name" --format "{{json .}}"
        $out = $dock | ConvertFrom-Json

        Write-Output "Showing secret with name: $name"
        $out
    }

    else {
        $dock = docker secret ls --format "{{json .}}"
        $out = $dock | ConvertFrom-Json

        Write-Output "Showing all secrets"
        $obj = [pscustomobject] {
            CreatedAt = $out.CreatedAt
            ID = $out.ID
            Labels = $out.Labels
            Name = $out.Name
            UpdatedAt = $out.UpdatedAt
        }
        $obj
    }
}