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

# echo 
# echo Vuoi installare Gestore Download Uget?
# function_question
# if (( value_question == 1 )) ; then
#     sudo add-apt-repository ppa:uget-team/ppa  -y
#     sudo apt-get install uget-integrator -y
#     #sudo snap install --edge uget
# fi
echo 
echo Vuoi installare VPN Windscribe?
function_question
if (( value_question == 1 )) ; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
    echo 'deb https://repo.windscribe.com/ubuntu zesty main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
    sudo apt-get update
    sudo apt-get install windscribe-cli -y
    echo ---------------------------
    echo -- Login: -----------------
    echo -- windscribe login -------
    echo ---------------------------
    echo -- Connect: ---------------
    echo -- windscribe connect -----
    echo ---------------------------
    echo -- Disconnect: ------------
    echo -- windscribe disconnect --
    echo ---------------------------
fi
echo 
echo Vuoi installare TeamViewer?
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i TeamViewer.deb
fi
echo 
echo Vuoi installare Edge?
function_question
if (( value_question == 1 )) ; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
    sudo rm microsoft.gpg

    sudo apt update -y && sudo apt install microsoft-edge-stable -y
fi
echo 
echo Vuoi installare Mega?
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i Mega.deb
fi
echo 
echo Vuoi installare FreeDownloadManager?
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i freedownloadmanager.deb
    cd FreeDownloadManager/   &&   chmod +x install.sh   &&   ./install.sh   &&   cd ..
fi
echo 
echo ------------
echo -- Social --
echo ------------
echo Vuoi installare Telegram?
function_question
if (( value_question == 1 )) ; then
    sudo snap install telegram-desktop
fi
echo 
echo Vuoi installare Discord?
function_question
if (( value_question == 1 )) ; then
    sudo snap install discord
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y
