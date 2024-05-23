# Wait for PostgreSQL to be ready
function Test-PostgresConnection {
    param (
        [string]$Host,
        [int]$Port,
        [int]$Retries,
        [int]$Delay
    )

    for ($i = 0; $i -lt $Retries; $i++) {
        try {
            $tcpConnection = Test-NetConnection -ComputerName $Host -Port $Port
            if ($tcpConnection.TcpTestSucceeded) {
                Write-Output "PostgreSQL is ready"
                return $true
            }
        } catch {
            Write-Output "Waiting for PostgreSQL..."
        }
        Start-Sleep -Seconds $Delay
    }

    throw "PostgreSQL not ready after $Retries retries."
}

Test-PostgresConnection -Host "db" -Port 5432 -Retries 10 -Delay 5

# Run the Node.js server (assuming your server script is server.js)
Start-Process "node" "server.js"

# Import data from data.json
Start-Process "node" "import-data.js"

# Keep the container running
Start-Sleep -Seconds 99999
