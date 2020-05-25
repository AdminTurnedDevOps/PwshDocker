function Delete-AllContainers {
    [cmdletbinding(ConfirmImpact = 'High')]
    param()

    begin {

    }

    process {
        try {
            $output = Read-Host 'Are you sure you want to delete ALL containers, including running and stopped? 1 for yes 2 for 2'

            switch($output) {
                1 {docker container rm -f $(docker ps -aq)}
                2 {exit}
            }
            
        }

        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }

    end {

    }
}