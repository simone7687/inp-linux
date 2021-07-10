value_question=0
function_question()
{
    value_question=8    # a caso
    echo Continuare? [Si:1/No:0]
    read value_question
    if (( value_question == 1 )) ; then
        value_question=1
    elif (( value_question == 0 )) ; then
        value_question=0
    else
        function_question
    fi
}

echo 
echo ----------
echo -- Tema --
echo ----------
echo Vuoi installare materia?
function_question
if (( value_question == 1 )) ; then
    sudo apt install materia-gtk-theme -y
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.gtk.Gtk3theme.Materia{,-dark,-light}{,-compact}
fi
# echo Vuoi installare arc?
# function_question
# if (( value_question == 1 )) ; then
#     sudo apt install arc-theme -y
# fi
echo 
echo -----------
echo -- Icone --
echo -----------
# echo Vuoi installare paper?
# function_question
# if (( value_question == 1 )) ; then
#     sudo add-apt-repository -u ppa:snwh/ppa
#     sudo apt-get install paper-icon-theme -y
# fi
#echo 
echo Vuoi installare papirus?
function_question
if (( value_question == 1 )) ; then
    sudo add-apt-repository ppa:papirus/papirus -y
    sudo apt install papirus-icon-theme -y
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y

xfce4-appearance-settings
xfwm4-settings
lightdm-gtk-greeter-settings-pkexec