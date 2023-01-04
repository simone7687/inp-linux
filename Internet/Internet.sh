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
echo https://www.microsoftedgeinsider.com/it-it/download
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
echo https://www.teamviewer.com/it/download/linux/
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i teamviewer_15.37.3_amd64.deb
fi
echo 
echo Vuoi installare Edge Beta?
echo https://www.microsoftedgeinsider.com/en-us/download
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i microsoft-edge-beta_109.0.1518.26-1_amd64.deb
fi
echo 
echo Vuoi installare Mega?
echo https://mega.io/desktop
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i megasync-xUbuntu_22.10_amd64.deb
fi
echo 
echo Vuoi installare FreeDownloadManager?
echo https://www.freedownloadmanager.org/download-fdm-for-linux.htm
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i freedownloadmanager.deb
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
