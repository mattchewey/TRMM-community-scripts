<#
.Synopsis
    Script to Check Huntress Status
.Description
    Checks the service status of Huntress on a Windows OS and reports back 0 if running.  
.Args
    No args required.
.Example
    Win_Huntress_Detect.ps1
 #>

$serviceName = "HuntressAgent"
$tls = "Tls12";
[System.Net.ServicePointManager]::SecurityProtocol = $tls;
If (Get-Service $serviceName -ErrorAction SilentlyContinue) {
    $service = Get-Service -Name $serviceName
    $stat = $service.Status
    exit 0
}
Else {
    exit 1
}
