
do
{

write-host "*** User Account Manipulator ***"
write-host "`n1.Add an User"
write-host "`n2.Delete an User"
write-host "`n3.Exit"
$choice=Read-Host "`nPlease select the operation"

switch($choice)
{
1{

Write-Host "`n***User Account Creation ***`n`n"          #creation switch 1
$name = Read-Host "Enter the Name:" 
"`n"
$pass = Read-Host "Enter the Password: " -AsSecureString
"`n"
Write-Host "Are you sure you want to create an user?" 
$confirm= Read-Host "`n Press [Y] - Yes [N] - No"
if ($confirm -eq "Y")
    {
    $euser = Get-LocalUser -Name $name -ErrorAction SilentlyContinue
        if ($euser)
        {
        write-host "`nUSERNAME ALREADY EXIST!"
        pause
        }
        else
        {
        Write-Host " Please Wait" -NoNewline
        for ($i=0; $i -lt 5; $i++)
        {
        start-sleep -milliseconds 500 
        Write-Host "." -NoNewline
        }
        New-LocalUser -Name $name -Password $pass 
        Add-LocalGroupMember -Group "users" -Member $name
        write-host "`nUser has been Succesfully Created"
        Read-Host "Press Enter to Exit"
        clear-host

        }


}
}
2
{
write-host "`n*** Deletion process ***"        #deletion process switch 2
 Write-Host "`nPlease Wait" -NoNewline
        for ($i=0; $i -lt 5; $i++)
        {
        start-sleep -milliseconds 500 
        Write-Host "." -NoNewline
        }

$userNames = Get-LocalUser | Where-Object {
   $_.Name -notin @('Administrator','Guest','DefaultAccount','WDAGUtilityAccount')}
    $counter=1
    foreach ($temp in $userNames)
    {
        write-host "`n`n$counter.$($temp.Name)"
        $counter++
    }
    
$in=read-Host "`nSelect the user to delete or press / to exit"
if($in -eq "/")
{
break
clear-host
}
else
{


Write-Host "`nYou Selected User",$in",is that Correct?`n`n *** PLEASE PROCEED WITH CAUTION ***"
pause
Write-Host "`nPlease wait" -nonewline
for($i=1; $i -lt 4; $i++)
{
Start-Sleep -Milliseconds 300
Write-Host "." -NoNewline

}
switch($in){
1{
    Remove-LocalUser $userNames[0]
    Write-Host "`nUser has been Successfully Deleted"
    pause
    clear-host
}

2{
Remove-LocalUser $userNames[1]
Write-Host "`nUser has been Successfully Deleted"
pause
clear-host
}
3{
    Remove-localuser $usernames[2]  
    Write-Host "`nUser has been Successfully Deleted"
    pause
    clear-host
  }

    
4{

    Remove-localuser $usernames[3]
    Write-Host "`nUser has been Successfully Deleted" 
    pause
    clear-host
}
5{

    Remove-localuser $usernames[4]
    Write-Host "`nUser has been Successfully Deleted"
    pause
    clear-host
}
default{
write-host "Username Does not Exist"
pause
}
}

}
}
3
{
Write-Host "Closing User Account Manipulator" -NoNewline
for ($i=0; $i -lt 5; $i++)
        {
        start-sleep -milliseconds 250
        Write-Host "." -NoNewline
        }
break

pause
}
default
 {
 write-host "`nInvalid Option, Please Choose any option from given above`n"
 pause
 Clear-Host
}
}
}
while($choice -ne 3)






