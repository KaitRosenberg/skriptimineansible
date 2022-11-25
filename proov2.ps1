$eesnimi = (Read-Host -Prompt "Eesinim")
$perenimi = (Read-Host -Prompt "Perenimi")
$User = $eesnimi+"."+$perenimi
$Password = (Read-Host -Prompt "Parool" -AsSecureString)

$op = Get-LocalUser | where-Object Name -eq "$eesnimi" | Measure
if ($op.Count -eq 0) {
     New-LocalUser  -Name "$eesnimi" -Password $Password -FullName "$User"
     echo "Kasutaja nimega $User on lisatud!"
} else {
     Write-Output "Kasutaja nimega $User juba eksisteerib"
}


