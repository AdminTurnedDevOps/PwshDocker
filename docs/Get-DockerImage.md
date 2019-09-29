---
external help file: PwshDocker-help.xml
Module Name: PwshDocker
online version:
schema: 2.0.0
---

# Get-DockerImage

## SYNOPSIS
Get attributes for an existing Docker image

## SYNTAX

```
Get-DockerImage [-dockerImage] <String> [<CommonParameters>]
```

## DESCRIPTION
Retrieve attributes/metadata of existing Docker image by specifying it's image ID

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-DockerImage -dockerImage f7dc90133b81
```

This will return attributes/metadata of the Servercore Docker image

## PARAMETERS

### -dockerImage
Enter the docker image you wish to search for on your local machine

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