<#
.SYNOPSIS
Creates a new local user and adds them to a specified group.

.DESCRIPTION
This script creates a local Windows user with a default password,
adds the user to a specified local group (e.g., Administrators), 
and logs the actions taken.

.NOTES
Author: Alex Sharek
Date: 2025-07-17
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$Username,

    [Parameter(Mandatory = $true)]
    [string]$FullName,

    [Parameter(Mandatory = $true)]
    [string]$Group = "Users",

    [string]$Password = "P@ssw0rd123!",
    
    [string]$LogPath = ".\AccountCreation.log"
)

# Check if user exists
if (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue) {
    Write-Output "User '$Username' already exists."
    Add-Content -Path $LogPath -Value "$(Get-Date) - User '$Username' already exists."
    exit
}

# Convert password to secure string
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force

# Create the user
try {
    New-LocalUser -Name $Username -FullName $FullName -Password $SecurePassword -Description "Created via script" -PasswordNeverExpires
    Add-LocalGroupMember -Group $Group -Member $Username

    Write-Output "User '$Username' created and added to group '$Group'."
    Add-Content -Path $LogPath -Value "$(Get-Date) - Created user '$Username' and added to '$Group'."
}
catch {
    Write-Error "Error creating user: $_"
    Add-Content -Path $LogPath -Value "$(Get-Date) - Error: $_"
}
