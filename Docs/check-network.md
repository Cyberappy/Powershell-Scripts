## The *check-network.ps1* Script

This PowerShell script queries the network details of the local computer and prints it.

## Parameters
```powershell
check-network.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

## Example
```powershell
PS> ./check-network.ps1



N E T W O R K
✅ Firewall enabled
...

```

## Notes
Author: Markus Fleschutz | License: CC0

## Related Links
https://github.com/fleschutz/PowerShell

## Source Code
```powershell
<#
.SYNOPSIS
	Checks the network details
.DESCRIPTION
	This PowerShell script queries the network details of the local computer and prints it.
.EXAMPLE
	PS> ./check-network.ps1

	N E T W O R K
	✅ Firewall enabled
	...
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

" "
& "$PSScriptRoot/write-green.ps1" "   N E T W O R K"
& "$PSScriptRoot/check-firewall"
& "$PSScriptRoot/check-ping.ps1"
& "$PSScriptRoot/check-dns.ps1"
& "$PSScriptRoot/check-vpn.ps1"
exit 0 # success
```

*Generated by convert-ps2md.ps1 using the comment-based help of check-network.ps1*