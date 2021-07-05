verita=0
domanda()
{
    verita=8    # a caso
    echo Continuare? [Si:1/No:0]
    read verita
    if (( verita == 1 )) ; then
        verita=1
    elif (( verita == 0 )) ; then
        verita=0
    else
        domanda
    fi
}

echo 
echo ----------
echo -- Tema --
echo ----------
echo Installare materia?
domanda
if (( verita == 1 )) ; then
    sudo apt install materia-gtk-theme -y
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.gtk.Gtk3theme.Materia{,-dark,-light}{,-compact}
fi
# echo Installare arc?
# domanda
# if (( verita == 1 )) ; then
#     sudo apt install arc-theme -y
# fi
echo 
echo -----------
echo -- Icone --
echo -----------
# echo Installare paper?
# domanda
# if (( verita == 1 )) ; then
#     sudo add-apt-repository -u ppa:snwh/ppa
#     sudo apt-get install paper-icon-theme -y
# fi
#echo 
echo Installare papirus?
domanda
if (( verita == 1 )) ; then
    sudo add-apt-repository ppa:papirus/papirus -y
    sudo apt install papirus-icon-theme -y
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y

xfce4-appearance-settings
xfwm4-settings
lightdm-gtk-greeter-settings-pkexec