# Not a script
Count all the VPCs

(Requires all of the scanned accounts to be in your credentials file)

$profilelist = (Get-AWSCredential -ListProfileDetail).ProfileName

#This will break on the default profile, since it can't be enumerated in the -ProfileName flag. We strip it out here- make sure you're not depending on it.

if ($profilelist[0] -eq "default")

{

$pfMax = $profilelist.Count-1

$profilelist = $profilelist[1..$pfMax]

}

foreach ($pf in $profilelist)

{

Write-Host "Profile is $pf" -ForegroundColor Cyan

foreach ($region in $regionlist) {

Write-Host "Region is $region"

(Get-EC2Vpc -Region $region -ProfileName $pf).VpcId

$VPCs = $VPCs + ((Get-EC2Vpc -Region $region -ProfileName $pf).VpcId)

}

}

$VPCCount = $VPCs.Count

Write-Host "Final VPC Count: $VPCCount"


===============================
PS C:\> Get-AWSPublicIpAddressRange -OutputPublicationDate

Wednesday, August 22, 2018 9:22:35 PM

----

PS C:\> Get-AWSPublicIpAddressRange -Region us-east-1

IpPrefix        Region      NetworkBorderGroup         Service
--------        ------       -------                   -------
23.20.0.0/14    us-east-1    us-east-1                 AMAZON
50.16.0.0/15    us-east-1    us-east-1                 AMAZON
50.19.0.0/16    us-east-1    us-east-1                 AMAZON

---

PS C:\> (Get-AWSPublicIpAddressRange).IpPrefix
23.20.0.0/14
27.0.0.0/22
43.250.192.0/24
...
2406:da00:ff00::/64
2600:1fff:6000::/40
2a01:578:3::/64
2600:9000::/28

-----

PS C:\> Get-AWSPublicIpAddressRange | where {$_.IpAddressFormat -eq "Ipv4"} | select IpPrefix

IpPrefix
--------
23.20.0.0/14
27.0.0.0/22
43.250.192.0/24

----

PS C:\> Get-AWSPublicIpAddressRange -ServiceKey CODEBUILD | select IpPrefix

IpPrefix
--------
52.47.73.72/29
13.55.255.216/29
52.15.247.208/29
...

----

