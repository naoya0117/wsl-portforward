#管理者権限に昇格
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }

netsh interface portproxy show all
$port = "3000"
$wsl_addr = bash -c "ip a s eth0  | awk /inet\ /\ {print\ \$\2} | sed -e 's/\/20//g'"

#古い設定を削除
$output=netsh interface portproxy show v4tov4 listenport=${port}
if ($output -ne "") {
    echo "removing older portforward settings.."
    netsh interface portproxy delete v4tov4 listenport=${port}
    netsh interface portproxy show all
    Remove-NetFireWallRule -DisplayName 'wsl2 portforward'
}

#新しい設定
echo "adding ${wsl_addr}:3000 "
netsh interface portproxy add v4tov4 listenport=${port} listenaddress=* connectport=${port} connectaddress=${wsl_addr}
New-NetFireWallRule -DisplayName 'wsl2 portforward' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP
New-NetFireWallRule -DisplayName 'wsl2 portforward' -Direction Inbound -LocalPort $ports_a -Action Allow -Protocol TCP

netsh interface portproxy show all
echo "done!!"

Write-Host "Please push Enter to finish!"
Read-Host
