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

echo 
echo ------------------------
echo ------------------------
echo ------ Traduzione ------
echo ------------------------
echo ------------------------
echo 
echo Vuoi installare Traduzzione man?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get install manpages-it -y
fi
echo 
echo it_IT.UTF-8 UTF-8
echo Vuoi installare Traduzzione?
function_question
if (( value_question == 1 )) ; then
    sudo dpkg-reconfigure locales
fi
echo 

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y
exit