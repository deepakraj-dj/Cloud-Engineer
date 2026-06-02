# User Account Manipulator
A PowerShell script for Desktop Support and System Administrators to create and delete local Windows user accounts through a simple interactive menu — no GUI, no manual clicking through Control Panel.

## Overview
Automates the creation of a local Windows user and adds them to a specified group for workstation pc

## Preview

*** User Account Manipulator ***

1. Add an User

2. Delete an User

3. Exit

Please select the operation:

## Prerequisites
- Windows PowerShell 5.1+
- Must be run as Administrator
- Local machine (not domain-joined AD)

## How to Run
1. Create an Shortcut on windows
2. In the location of the item type powershell -ExecutionPolicy Bypass -File "##Script location"
3. Change the shortcut to run on admin always using Properties -> Advanced -> Run as Administrator
4. Apply the settings and run the script

## Usage
- Adding a User

  Select option 1 from the menu
  Enter the desired username
  Enter a secure password (hidden input)
  Confirm with Y to create

  The script will:

  Check if the username already exists
  Create the account using New-LocalUser
  Add the user to the Users group automatically

- Deleting a User

  Select option 2 from the menu
  Script loads and displays all non-system user accounts
  Enter the number next to the user you want to delete
  Confirm before deletion proceeds
  Press / at any time to cancel and go back

## Notes
- Always ensure any script is safe before providing admin priviledge.
- Adjust script parameters as needed.
