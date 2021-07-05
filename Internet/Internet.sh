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

# echo 
# echo Installare Gestore Download Uget?
# domanda
# if (( verita == 1 )) ; then
#     sudo add-apt-repository ppa:uget-team/ppa  -y
#     sudo apt-get install uget-integrator -y
#     #sudo snap install --edge uget
# fi
echo 
echo Installare VPN Windscribe?
domanda
if (( verita == 1 )) ; then
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
echo Installare TeamViewer?
domanda
if (( verita == 1 )) ; then
    sudo dpkg -i TeamViewer.deb
fi
echo 
echo Installare Mega?
domanda
if (( verita == 1 )) ; then
    sudo dpkg -i Mega.deb
fi
echo 
echo Installare FreeDownloadManager?
domanda
if (( verita == 1 )) ; then
    sudo dpkg -i freedownloadmanager.deb
    cd FreeDownloadManager/   &&   chmod +x install.sh   &&   ./install.sh   &&   cd ..
fi
echo 
echo ------------
echo -- Social --
echo ------------
echo Installare Telegram?
domanda
if (( verita == 1 )) ; then
    sudo snap install telegram-desktop
fi
echo 
echo Installare Discord?
domanda
if (( verita == 1 )) ; then
    sudo snap install discord
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y
