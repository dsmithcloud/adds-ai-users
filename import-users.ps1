# Path to the user images
$imagesPath = "./images/"
# Define the users
$users = @(
    @{
        Name = "Alexis Quantum"
        Alias = "QuantumWhiz"
        Email = "alexis.quantum@yourdomain.com"
        ImagePath = $imagesPath + "Alexis Quantum.jpg"
    },
    @{
        Name = "Blake Horizon"
        Alias = "SkyWalker"
        Email = "blake.horizon@yourdomain.com"
        ImagePath = $imagesPath + "BlakeH orizon.jpg"
    },
    @{
        Name = "Casey Vortex"
        Alias = "CodeMaster"
        Email = "casey.vortex@yourdomain.com"
        ImagePath = $imagesPath + "CaseyV ortex.jpg"
    },
    @{
        Name = "Drew Nebula"
        Alias = "StarGazer"
        Email = "drew.nebula@yourdomain.com"
        ImagePath = $imagesPath + "Drew Nebula.jpg"
    },
    @{
        Name = "Elliot Blaze"
        Alias = "FireStarter"
        Email = "elliot.blaze@yourdomain.com"
        ImagePath = $imagesPath + "Elliot Blaze.jpg"
    },
    @{
        Name = "Finley Echo"
        Alias = "SoundWave"
        Email = "finley.echo@yourdomain.com"
        ImagePath = $imagesPath + "Finley Echo.jpg"
    },
    @{
        Name = "Gale Storm"
        Alias = "ThunderBolt"
        Email = "gale.storm@yourdomain.com"
        ImagePath = $imagesPath + "Gale Storm.jpg"
    },
    @{
        Name = "Harper Frost"
        Alias = "IceQueen"
        Email = "harper.frost@yourdomain.com"
        ImagePath = $imagesPath + "Harper Frost.jpg"
    },
    @{
        Name = "Jordan Flux"
        Alias = "TimeKeeper"
        Email = "jordan.flux@yourdomain.com"
        ImagePath = $imagesPath + "Jordan Flux.jpg"
    },
    @{
        Name = "Kai Blaze"
        Alias = "FlameMaster"
        Email = "kai.blaze@yourdomain.com"
        ImagePath = $imagesPath + "Kai Blaze.jpg"
    }
)

# Import users into Active Directory
foreach ($user in $users) {
    New-ADUser -Name $user.Name -SamAccountName $user.Alias -UserPrincipalName $user.Email -Path "OU=Users,DC=yourdomain,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) -Enabled $true

    # Set user photo
    $photo = [System.IO.File]::ReadAllBytes($user.ImagePath)
    Set-ADUser -Identity $user.Alias -Replace @{thumbnailPhoto=$photo}
}

Write-Host "Users imported and photos attached successfully."
