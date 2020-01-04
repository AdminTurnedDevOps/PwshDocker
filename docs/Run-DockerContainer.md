---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Run-DockerContainer

## SYNOPSIS
Runs a Docker image inside of a contaienr

## SYNTAX

```
Run-DockerContainer [-imageName] <String> [-containerPort] <String> [[-containerName] <String>]
 [-command] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Run-DockerContainer takes a Docker image of your choosing and creates a container out of it.

## EXAMPLES

### Example 1
```powershell
PS C:\> Run-DockerContainer -imageName nginx -containerPort 8080:80 -containerName mycoolcontainer -command /bin/bash
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

### -command
Please enter the runtime you wish to run in your container (Example: /bin/bash for Linux or powershell for Windows

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -containerName
Please enter container name.
If you do not enter a name for your container, one will be assigned by default

```yaml
Type: String
Parameter Sets: (All)
Aliases: name

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -containerPort
Please enter the port that you would like to run on your container

```yaml
Type: String
Parameter Sets: (All)
Aliases: Port

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -imageName
Please enter the docker image you wish to run

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
