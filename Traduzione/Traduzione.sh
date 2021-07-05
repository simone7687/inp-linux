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
echo Traduzione
echo ----------
echo 
echo Installare Traduzzione man?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install manpages-it -y
fi
echo 
echo it_IT.UTF-8 UTF-8
echo Installare Traduzzione?
domanda
if (( verita == 1 )) ; then
    sudo dpkg-reconfigure locales
fi
echo 

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y
exit