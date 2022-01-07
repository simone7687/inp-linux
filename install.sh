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
sudo apt --fix-broken install
echo 
echo --------------------------------
echo --------------------------------
echo ------ Installare Giochi? ------
echo --------------------------------
echo --------------------------------
function_question
if (( value_question == 1 )) ; then
    cd games/   &&   chmod +x install.sh   &&   ./install.sh   &&   cd ..
fi
echo 
echo --------------------------------------------
echo --------------------------------------------
echo ------ Installare Programmi Internet? ------
echo --------------------------------------------
echo --------------------------------------------
function_question
if (( value_question == 1 )) ; then
    cd Internet/   &&   chmod +x Internet.sh   &&   ./Internet.sh   &&   cd ..
fi
echo 
echo -----------------------------------------------------
echo -----------------------------------------------------
echo ------ Installare Programmi di Programmazione? ------
echo -----------------------------------------------------
echo -----------------------------------------------------
function_question
if (( value_question == 1 )) ; then
    cd Programmazione/   &&   chmod +x Programmazione.sh   &&   ./Programmazione.sh   &&   cd ..
fi
echo 
echo --------------------------------------------
echo --------------------------------------------
echo ------ Installare Programmi di Media? ------
echo --------------------------------------------
echo --------------------------------------------
function_question
if (( value_question == 1 )) ; then
    cd Media/   &&   chmod +x Media.sh   &&   ./Media.sh   &&   cd ..
fi
echo 
echo ----------------------------------------------
echo ----------------------------------------------
echo ------ Installare Programmi di Sistema? ------
echo ----------------------------------------------
echo ----------------------------------------------
function_question
if (( value_question == 1 )) ; then
    cd Sistema/   &&   chmod +x Sistema.sh   &&   ./Sistema.sh   &&   cd ..
fi
echo 
echo ------------------------------
echo ------------------------------
echo ------ Installare Temi? ------
echo ------------------------------
echo ------------------------------
function_question
if (( value_question == 1 )) ; then
    cd Temi/   &&   chmod +x Temi.sh   &&   ./Temi.sh   &&   cd ..
fi
echo 
echo -------------------------------------------
echo -------------------------------------------
echo ------ Installare programmi Ufficio? ------
echo -------------------------------------------
echo -------------------------------------------
function_question
if (( value_question == 1 )) ; then
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
# aggionamento sistema opertivo
sudo do-release-upgrade
