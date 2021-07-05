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
echo Installare Blender?
domanda
if (( verita == 1 )) ; then
    sudo snap install blender --classic
fi
echo 
echo Installare Renpy
domanda
if (( verita == 1 )) ; then
    sudo apt install python -y
    sudo apt-get install renpy -y
fi
echo 
echo Installare Audacity
domanda
if (( verita == 1 )) ; then
    sudo snap install audacity --classic
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y

sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo dpkg --configure -a