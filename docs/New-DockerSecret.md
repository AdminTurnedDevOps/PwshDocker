---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# New-DockerSecret

## SYNOPSIS
Create a new secret for a Docker Swarm cluster

## SYNTAX

```
New-DockerSecret [-name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Creating a Docker secret for a Docker Swarm cluster to store secrets (passwords, keys, etc.)

## EXAMPLES

### Example 1
```powershell
PS C:\> New-DockerSecret -Name newsecret
```

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -name
Prompts for what name you want to call the Docker Swarm secret

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
