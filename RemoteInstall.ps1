clear-host

#Asks user the name of the software that will be updated and proceeds to uninstall.

$uninstall = Read-Host("Software to be updated:")

Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq $uninstall } | ForEach-Object { $_.Uninstall() }
clear
Write-Host "Uninstall Complete"

#Creates a directory for the .msi file to be saved to

mkdir c:\remotedownload

#Asking user to submit the direct link to the page where the download is present so that it can be downloaded.(Ex. https://fileserver.com/program.msi)

$program = Read-Host("Enter Link")
Invoke-WebRequest -Uri $program -OutFile c:\remotedownload\program.msi

#installs program that was downloaded

Start-Process -Wait c:\remotedownload\program.msi /quiet

#Deletes all files downloaded

Clear-Host
Write-Host("Install Complete")
Remove-Item -Path 'C:\remotedownload'  -Force -Recurse