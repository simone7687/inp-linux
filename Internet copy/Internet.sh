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
echo Sostituire Parole video con VLC?
domanda
if (( verita == 1 )) ; then
    sudo apt-get remove parole -y
    sudo snap install vlc
fi
echo 
echo Installare Inkscape?
domanda
if (( verita == 1 )) ; then
    sudo snap install inkscape
fi
# echo 
# echo Installare Handbrake?
# domanda
# if (( verita == 1 )) ; then
#     sudo snap install handbrake-jz
# fi
echo 
echo Installare Audacity?
domanda
if (( verita == 1 )) ; then
    sudo snap install audacity
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y