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
echo -----------------
echo Personalizzazione
echo -----------------
echo 
echo Installare plank?
plank=0
domanda
if (( verita == 1 )) ; then
    plank=1
    echo plank --preferences
    sudo apt install plank -y
fi
echo 
echo https://wiki.ubuntu-it.org/AmbienteGrafico/Xfce/Compiz
echo https://www.marcosbox.org/2015/03/usiamo-compiz-su-xubuntu.html
echo Installare compiz?
compiz=0
domanda
if (( verita == 1 )) ; then
    compiz=1
    sudo apt-get install compizconfig-settings-manager compiz dconf-editor -y
fi
echo 
echo -----
echo Store
echo -----
echo 
echo Installare synaptic?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install synaptic -y
fi
echo 
echo -------
echo Windows
echo -------
echo 
echo Installare wine?
wine=0
domanda
    if (( verita == 1 )) ; then
    wine=1
    sudo apt-get install wine -y
    #sudo snap install wine-platform
fi
echo 
echo Installare Creatore usb-avviabili?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install usb-creator-common -y
fi
echo 
echo Installare 7zip?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install p7zip-rar -y
    #sudo snap install p7zip-desktop
fi
echo 
echo Installare Protezione occhi?
redshift=0
domanda
if (( verita == 1 )) ; then
    redshift=1
    sudo apt-get install redshift -y
fi
echo 
echo Installare Gestore Partizioni?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install gparted -y
fi
echo 
echo Installare Gestore Grub?
domanda
if (( verita == 1 )) ; then
    sudo apt install grub-customizer -y
fi
echo 
echo Sostituire Monitor di sistema con quello di gnome?
domanda
if (( verita == 1 )) ; then
    sudo apt-get remove xfce4-taskmanager -y
    sudo apt-get remove gnome-system-monitor -y
    sudo snap install gnome-system-monitor
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y

if (( wine == 1 )) ; then
    winecfg
fi
if (( plank == 1 )) ; then
    echo 
    echo ---------------------------------------------------------
    echo "-- Per abbilitare l'apertura di Plank all'avvio: --------"
    echo -- Impostazioni -> sessione avvio -> aggiungi comando: --
    echo -- /usr/bin/plank ---------------------------------------
    echo ---------------------------------------------------------
    echo 
    xfce4-session-settings
fi
if (( redshift == 1 )) ; then
    echo 
    echo ---------------------------------------------------------
    echo "-- Per abbilitare l'apertura di Redshift all'avvio: -----"
    echo -- Impostazioni -> sessione avvio -> aggiungi comando: -- 
    echo -- redshift -t 3900:3000 --------------------------------
    echo -- oppure -----------------------------------------------
    echo -- redshift -t 3900:3000 -l 45.44694:8.62118 ------------
    echo -- xfce4-session-settings -------------------------------
    echo ---------------------------------------------------------
fi
if (( compiz == 1 )) ; then
    echo 
    echo ---------------------------------------------
    echo -- vai: /org/gnome/desktop/wm/preferences/ --
    echo ---------------------------------------------
    echo -- button-layout: ---------------------------
    echo -- appmenu:minimize,maximize,close ----------
    echo ---------------------------------------------
    echo "-- theme: ---- (suggerisco) -----------------"
    echo -- Materia-dark-compact ---------------------
    echo ---------------------------------------------
    dconf-editor
    cp /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
    nano compix_avvio.txt
    nano ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml
    ccsm
fi
