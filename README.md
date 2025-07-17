# powershell-user-management
PowerShell scripts to automate user account creation and group management
# PowerShell User Management Automation

This repository contains a PowerShell script for creating local Windows user accounts and assigning them to a specified group. It’s ideal for automating basic user provisioning tasks and showcases practical scripting skills for system administration.

---

##  Script: `Create-LocalUser.ps1`

###  Features

- Creates a local Windows user account
- Adds user to a specified local group
- Sets a default password (can be customized)
- Logs all actions to `AccountCreation.log`
- Uses parameter validation and error handling

---

###  Usage Example

```powershell
.\Create-LocalUser.ps1 -Username "jsmith" -FullName "John Smith" -Group "Administrators"
