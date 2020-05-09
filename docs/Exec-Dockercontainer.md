---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Exec-DockerContainer

## SYNOPSIS
Exec into a running Docker container

## SYNTAX

```
DockerContainer-Exec [-command] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Using "docker exec" is similar to SSHing into a machine. With the Dockercontainer-Exec function, you can exec into a container as if you were SSHing into a virtual machine.

## EXAMPLES

### Example 1
```powershell
PS C:\> Dockercontainer-Exec -command /bin/bash
```

DockerContainer-Exec will prompt you for what container you want to exec into after neatly listing them out for you. The /bin/bash is used for telling docker exec what you would like to run to get into the container. For example, if you were using a Windows container, you could use "powershell" instead of "/bin/bash".

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

### -command
Please enter command that you would like to run inside of container.
For example, /bin/bash or powershell

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
