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
sudo apt --fix-broken install
echo 
echo --------------------------------
echo --------------------------------
echo ------ Installare Giochi? ------
echo --------------------------------
echo --------------------------------
domanda
if (( verita == 1 )) ; then
    cd Game/   &&   chmod +x Game.sh   &&   ./Game.sh   &&   cd ..
fi
echo 
echo --------------------------------------------
echo --------------------------------------------
echo ------ Installare Programmi Internet? ------
echo --------------------------------------------
echo --------------------------------------------
domanda
if (( verita == 1 )) ; then
    cd Internet/   &&   chmod +x Internet.sh   &&   ./Internet.sh   &&   cd ..
fi
echo 
echo -----------------------------------------------------
echo -----------------------------------------------------
echo ------ Installare Programmi di Programmazione? ------
echo -----------------------------------------------------
echo -----------------------------------------------------
domanda
if (( verita == 1 )) ; then
    cd Programmazione/   &&   chmod +x Programmazione.sh   &&   ./Programmazione.sh   &&   cd ..
fi
echo 
echo ----------------------------------------------
echo ----------------------------------------------
echo ------ Installare Programmi di Sistema? ------
echo ----------------------------------------------
echo ----------------------------------------------
domanda
if (( verita == 1 )) ; then
    cd Sistema/   &&   chmod +x Sistema.sh   &&   ./Sistema.sh   &&   cd ..
fi
echo 
echo ------------------------------
echo ------------------------------
echo ------ Installare Temi? ------
echo ------------------------------
echo ------------------------------
domanda
if (( verita == 1 )) ; then
    cd Temi/   &&   chmod +x Temi.sh   &&   ./Temi.sh   &&   cd ..
fi
echo 
echo -------------------------------------------
echo -------------------------------------------
echo ------ Installare programmi Ufficio? ------
echo -------------------------------------------
echo -------------------------------------------
domanda
if (( verita == 1 )) ; then
    cd Ufficio/   &&   chmod +x Ufficio.sh   &&   ./Ufficio.sh   &&   cd ..
fi
#   (fine)
echo 
echo ---------------------------------------------------------
echo ---------------------------------------------------------
echo ------ Aggiornamento e rimozione pacchetti inutili ------
echo ---------------------------------------------------------
echo ---------------------------------------------------------
sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo dpkg --configure -a
sudo apt --fix-broken install
