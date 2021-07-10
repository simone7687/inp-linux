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
echo ---
echo Pdf
echo ---
echo 
# https://code-industry.net/free-pdf-editor/
echo Vuoi installare Master PDF Editor?
function_question
if (( value_question == 1 )) ; then
    sudo dpkg -i Master_PDF_Editor.deb
    sudo apt-get remove atril -y
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y