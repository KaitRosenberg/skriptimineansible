$file = "C:\Users\Administrator\Desktop\adusers.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"
foreach ($user in $users){
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translate($username)
    $upname = $username + "@sv-kool.local"
    $displayname = $user.FirstName + " " + $user.LastName
    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Enabled $true
}
function Translate {
    param(
        [string] $inputString
    )
        $Translate = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
        $outputString=""
        foreach ($character in $inputcharacter = $inputString.ToCharArray())
        {
            if ($Tanslate[$character] -cne $Null){
                $outputString += $Translate[$character]
            } else {
                $outputString += $character
            }
        }
        Write-Output $outputString
}