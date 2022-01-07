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
echo Sostituire Parole video con VLC?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get remove parole -y
    sudo snap install vlc
fi
echo 
echo Vuoi installare Inkscape?
function_question
if (( value_question == 1 )) ; then
    sudo snap install inkscape
fi
# echo 
# echo Vuoi installare Handbrake?
# function_question
# if (( value_question == 1 )) ; then
#     sudo snap install handbrake-jz
# fi
echo 
echo Vuoi installare Audacity?
function_question
if (( value_question == 1 )) ; then
    sudo snap install audacity
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y