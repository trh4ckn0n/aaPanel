#!/bin/bash

# Fonction pour afficher des informations avec couleur
info() {
    echo -e "\033[1;32m$1\033[0m"
}

# Fonction pour afficher un message d'erreur avec couleur
error() {
    echo -e "\033[1;31m$1\033[0m"
}

# Affichage d'introduction
info "Bienvenue dans l'installation d'aaPanel!"

# Demander à l'utilisateur s'il veut installer aaPanel ou la version Pro
echo "Sélectionnez l'option d'installation :"
echo "1️⃣ Installer la version gratuite d'aaPanel"
echo "2️⃣ Installer la version Pro (14 jours gratuits)"

read -p "Choisissez une option (1 ou 2): " install_choice

if [[ "$install_choice" == "1" ]]; then
    info "Vous avez choisi d'installer la version gratuite d'aaPanel."
    VERSION="free"
    URL="https://www.aapanel.com/script/install_7.0_en.sh"
elif [[ "$install_choice" == "2" ]]; then
    info "Vous avez choisi d'installer la version Pro d'aaPanel (14 jours gratuits)."
    VERSION="pro"
    URL="https://www.aapanel.com/script/install_pro_en.sh"
else
    error "Choix invalide, l'installation est annulée."
    exit 1
fi

# Vérification de la distribution
info "Vérification de la distribution..."

if [[ -f /etc/lsb-release || -f /etc/debian_version ]]; then
    DISTRO="ubuntu"
elif [[ -f /etc/redhat-release ]]; then
    DISTRO="centos"
elif [[ -f /etc/os-release && $(grep -i "kali" /etc/os-release) ]]; then
    DISTRO="kali"
else
    error "Cette distribution n'est pas supportée par le script."
    exit 1
fi

info "Distribution compatible trouvée: $DISTRO"

# Mise à jour des dépôts et installation des prérequis
info "Mise à jour des dépôts et installation des dépendances nécessaires..."
if [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "kali" ]]; then
    sudo apt update && sudo apt install -y wget curl sudo
elif [[ "$DISTRO" == "centos" ]]; then
    sudo yum update -y && sudo yum install -y wget curl sudo
fi

# Télécharger et exécuter le script d'installation d'aaPanel
info "Téléchargement et installation d'aaPanel en cours..."
if command -v curl &> /dev/null; then
    curl -ksSO "$URL"
else
    wget --no-check-certificate -O install.sh "$URL"
fi

# Lancer l'installation
if [[ "$VERSION" == "free" ]]; then
    bash install.sh aapanel
elif [[ "$VERSION" == "pro" ]]; then
    bash install.sh aa372544
fi

# Vérifier si l'installation a réussi
if [[ $? -eq 0 ]]; then
    info "aaPanel a été installé avec succès!"
else
    error "L'installation a échoué."
    exit 1
fi

# Afficher l'URL d'accès à l'interface web
info "Installation terminée. Vous pouvez maintenant accéder à aaPanel via votre navigateur web."
info "Accédez à : http://<votre_ip>:8888"
info "Identifiants par défaut :"
info "Nom d'utilisateur : admin"
info "Mot de passe : Vous pouvez le trouver dans le fichier /www/server/panel/data/default.pl"
