$eesnimi = (Read-Host -Prompt "Eesinim")
$perenimi = (Read-Host -Prompt "Perenimi")
$User = $eesnimi+"."+$perenimi


if ( Get-LocalUser | Where-Object -Property Name -EQ $eesnimi ) {

	Remove-LocalUser  -Name $eesnimi
	Write-Output "Kasutaja on kustutatud"

}

 else {

	Write-Host "$User does not exist."

}
