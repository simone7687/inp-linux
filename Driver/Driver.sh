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

sudo apt-get update
echo 
echo --------
echo Internet
echo --------
echo 
# https://github.com/tomaspinho/rtl8821ce
echo Installare rtl8821ce?
rtl8821ce=0
domanda
if (( verita == 1 )) ; then
    rtl8821ce=1
    sudo apt install linux-headers-$(uname -r) build-essential dkms -y
    unzip rtl8821ce-master.zip
    # mv rtl8821ce-master rtl8821ce-v5.2.5_1.26055.20180108.1
    mv rtl8821ce-master rtl8821ce-v5.5.2_34066.20190614
    # sudo mv rtl8821ce-v5.2.5_1.26055.20180108.1 /usr/src/
    sudo mv rtl8821ce-v5.5.2_34066.20190614 /usr/src/
fi

#   fine
echo dispense dei pacchetti
sudo apt --fix-broken install -y

if (( rtl8821ce == 1 )) ; then
    chmod +x rtl8821ce.sh
    ./rtl8821ce.sh
fi
echo dispense dei pacchetti
sudo apt --fix-broken install

sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo dpkg --configure -a