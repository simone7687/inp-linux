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

# echo Installare Lutris?
# domanda
# if (( verita == 1 )) ; then
#     sudo add-apt-repository ppa:lutris-team/lutris -y
#     sudo apt-get update
#     sudo apt-get install lutris -y
#     #sudo snap install lutris-mts --edge --devmode
# fi
# echo 
echo Installare Steam?
domanda
if (( verita == 1 )) ; then
    sudo apt install steam-installer -y
fi
echo 
# echo Installare Vulkan?
# domanda
# if (( verita == 1 )) ; then
#     echo https://linuxconfig.org/install-and-test-vulkan-on-linux
#     sudo apt install vulkan-utils -y
# fi
# echo 
echo Rimuovere giochi di sistema?
domanda
if (( verita == 1 )) ; then
    sudo apt-get remove sgt-launcher  sgt-puzzles gnome-sudoku gnome-mines -y
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y
