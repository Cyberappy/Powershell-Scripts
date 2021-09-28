﻿<#
.SYNOPSIS
	list-repos.ps1 [<ParentDir>]
.DESCRIPTION
	Lists the details of all Git repositories under a directory
.EXAMPLE
	PS> ./list-repos C:\MyRepos
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$ParentDir = "$PWD")

function ListRepos { param([string]$ParentDir)
	$Folders = (get-childItem "$ParentDir" -attributes Directory)
	foreach ($Folder in $Folders) {
		$FolderName = (get-item "$Folder").Name
		$Branch = (git -C "$Folder" branch --show-current)
		$Status = (git -C "$Folder" status --short)
		if ("$Status" -eq "") { $Status = "clean" }

		New-Object PSObject -property @{ 'Folder'="$FolderName"; 'Branch'="$Branch"; 'Status'="$Status"; }
	}
}

try {
	if (-not(test-path "$ParentDir" -pathType container)) { throw "Can't access directory: $ParentDir" }

	$Null = (git --version)
	if ($lastExitCode -ne "0") { throw "Can't execute 'git' - make sure Git is installed and available" }

	ListRepos | format-table -property Folder,Branch,Status
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
