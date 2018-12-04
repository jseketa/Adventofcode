$file = get-item '.\input'

$reader = New-Object -TypeName System.IO.StreamReader -ArgumentList $file

$count = 0
$i = 1
$floor = 0	

while ($read = $reader.ReadLine()){
	
	$line = $read.ToCharArray()
	
	$matches_open = ($line | where {$_ -eq '('}).Count
	$matches_closed = ($line | where {$_ -eq ')'}).Count
	$count = $matches_open - $matches_closed
		
	foreach ($value in $line){ 
		
			
		if ($value -eq '(') {$floor++}
		if ($value -eq ')') {$floor--}
		if ($floor -eq -1){
		$i
		break
		}
		
		$i++
	}
}

Write-Host "Ending floor:"  $count
