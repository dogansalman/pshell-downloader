$url = Read-Host "Url"
$output = Read-Host "Output directory"
$start_time = Get-Date
if ($PSCommandPath -eq $null) {function GetPSCommandPath() { return $MyInvocation.PSCommandPath; } $PSCommandPath = GetPSCommandPath; }

If (!$output -ne '') { 
$output = "$((Get-Item $PSCommandPath ).DirectoryName)\$((Get-Date -UFormat %T).replace(":","_")).xml"
}
$output = $output.replace("\", "/")
Write-Host $output
Invoke-WebRequest -Uri $url -Outfile $output
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
Read-Host "Press any key closing"

