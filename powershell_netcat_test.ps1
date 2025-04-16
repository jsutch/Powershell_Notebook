# Usage:
# To start a listener (server) on port 12345:
# Start-Listener -Port 12345
# To connect to a remote host (client):
# Start-Client -IPAddress <Remote_IP_Address> -Port 12345


# Function to start a listener (server)
$listener = [System.Net.Sockets.TcpListener]::new(
    [System.Net.IPAddress]::Parse($IPAddress),
    $Port
)

Write-Host "Listening on $IPAddress:$Port"
$listener.Start()

$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()

$reader = [System.IO.StreamReader]::new($stream)
$writer = [System.IO.StreamWriter]::new($stream)

while ($true) {
    $data = $reader.ReadLine()
    if ($data -eq $null) { break }
    Write-Host "Received: $data"
}

$listener.Stop()


# Function to connect to a remote host (client) (netcat replacement)
$client = [System.Net.Sockets.TcpClient]::new()
$client.Connect($IPAddress, $Port)

$stream = $client.GetStream()
$reader = [System.IO.StreamReader]::new($stream)
$writer = [System.IO.StreamWriter]::new($stream)

while ($true) {
    $input = Read-Host "Enter data to send (or 'exit' to quit)"
    if ($input -eq "exit") { break }
    $writer.WriteLine($input)
    $writer.Flush()
}

$client.Close()


