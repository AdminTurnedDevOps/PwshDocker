---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Pull-DockerImage

## SYNOPSIS
Pull down a Docker image

## SYNTAX

```
Pull-DockerImage [-image] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieve/pull down a Docker image from Docker hub or any other repo that you have access to

## EXAMPLES

### Example 1
```powershell
PS C:\>  Pull-DockerImage -image ubuntu:latest
```

This will pull down the latest Ubuntu image from Docker hub

## PARAMETERS

### -image
Please enter the docker image you wish to pull down to your local machine

```yaml
Type: String
Parameter Sets: (All)
Aliases: DockerImage

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
