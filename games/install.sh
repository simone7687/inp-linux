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

echo Vuoi installare Steam?
function_question
if (( value_question == 1 )) ; then
    sudo apt install steam-installer -y
fi
echo 

echo Rimuovere giochi di sistema?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get remove sgt-launcher  sgt-puzzles gnome-sudoku gnome-mines -y
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y
