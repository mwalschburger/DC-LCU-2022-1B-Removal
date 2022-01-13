# local uninstall - if you can still access your domain controller locally 
$yourOSKB = 'KB5009555' # take your OS Versions Security KB from below like KB5009555 for Windows Server 2022
$update = Get-WindowsPackage -Online -PackageName * | Where-Object Description -match $($yourOSKB)
$Update | Remove-WindowsPackage -Online -Verbose
<# here we see all KBs for 2022 1B LCU
Windows Server 2012 R2 - KB5009624 (Monthly Rollup)
Windows Server 2016 - KB5009546 (OS Build 14393.4886)
Windows Server 2019 - KB5009557 (OS Build 17763.2452)
Windows Server 2022 - KB5009555 (OS Build 20348.469)
#>

remote unistall - can be run against one or mutiple DCs. You just have to define the target DCs comma sepaaretd on -Computername [e.g.: -ComputerName mmDC01,mmdc02,mmdc03]
invoke-Command -ComputerName mmDC01 -ScriptBlock {
$yourOSKB = 'KB5009555' # take your OS Versions Security KB from below like KB5009555 for Windows Server 2022
$update = Get-WindowsPackage -Online -PackageName * | Where-Object Description -match $($yourOSKB)
# Get-WindowsPackage -Online -PackageName * | Out-GridView
$Update | Remove-WindowsPackage -Online -Verbose}

# Additional Notes & Input
## you can also run this in Enter-pssession" remote against a DC
## This has to be exectued in the context of a "Domain Admin" or "Administrator" of the DC/DCs 
## afterwars ther is an reboot required, but i intentionally did not place this into the script to keep it clean an simple
