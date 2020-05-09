---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Tag-DockerImage

## SYNOPSIS
Tags a Docker image

## SYNTAX

```
Tag-DockerImage [-tagName] <String> [<CommonParameters>]
```

## DESCRIPTION
Tag-DockerImage tags a docker image with any tag you would like.

## EXAMPLES

### Example 1
```powershell
PS C:\> Tag-DockerImage -tagName mynewcoolcontainer:latest
```

Tag-DockerImage will prompt you for what Docker image you want to use based on an output of all of the Docker images located on your machine. Once you answer the prompt, it will continue to run the function and tag your image.

## PARAMETERS

### -tagName
Please put the desired name of your tag for your source image

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
