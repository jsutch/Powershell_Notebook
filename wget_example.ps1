
wget for Powershell:

$client = new-object System.Net.WebClient
$client.DownloadFile("http://www.example.com/file.txt", "C:\tmp\file.txt")

If you need to specify credentials to download the file, add the following line in between:

$client.Credentials =  Get-Credential

----

PS C:\Users\charlie\Desktop\deploy> $client = new-object System.Net.WebClient
PS C:\Users\charlie\Desktop\deploy> $client.DownloadFile("https://www.dropbox.com/s/vy5fjda6zz59y3a/psarm.tar?dl=0", "c:\users\m-00175-4\desktop\deploy\ts.tar")

----
On One Line:
(new-object System.Net.WebClient).DownloadFile('http://www.xyz.net/file.txt','C:\tmp\file.tx<200c><200b>t') –



