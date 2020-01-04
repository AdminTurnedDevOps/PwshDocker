---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Get-DockerLogs

## SYNOPSIS
Retrieves Docker logs from specified container that is running

## SYNTAX

```
Get-DockerLogs [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Get-DockerLogs will retrieve any logs in a container that you specify.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-DockerLogs
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
