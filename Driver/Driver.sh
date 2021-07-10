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

sudo apt-get update
echo 
echo --------
echo Internet
echo --------
echo 
# https://github.com/tomaspinho/rtl8821ce
echo Vuoi installare rtl8821ce?
rtl8821ce=0
function_question
if (( value_question == 1 )) ; then
    rtl8821ce=1
    sudo apt install linux-headers-$(uname -r) build-essential dkms -y
    unzip rtl8821ce-master.zip
    # mv rtl8821ce-master rtl8821ce-v5.2.5_1.26055.20180108.1
    mv rtl8821ce-master rtl8821ce-v5.5.2_34066.20190614
    # sudo mv rtl8821ce-v5.2.5_1.26055.20180108.1 /usr/src/
    sudo mv rtl8821ce-v5.5.2_34066.20190614 /usr/src/
fi

#   fine
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y

if (( rtl8821ce == 1 )) ; then
    chmod +x rtl8821ce.sh
    ./rtl8821ce.sh
fi
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install

sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo dpkg --configure -a