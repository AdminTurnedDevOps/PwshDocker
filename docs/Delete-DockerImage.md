---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Delete-DockerImage

## SYNOPSIS
Deletes one or multiple Docker images

## SYNTAX

```
Delete-DockerImage [-image] <String[]> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Using Delete-DockerImage allows you to delete one or multiple Docker images on any machine that you are running the cmdlet from.

## EXAMPLES

### Example 1
```powershell
PS C:\> Delete-DockerImage -image redis, python
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

### -image
List what docker image or images you would like to delete

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: dockerImage

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
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

## RELATED LINKS
