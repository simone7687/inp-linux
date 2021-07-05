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
echo ---
echo Pdf
echo ---
echo 
# https://code-industry.net/free-pdf-editor/
echo Installare Master PDF Editor?
domanda
if (( verita == 1 )) ; then
    sudo dpkg -i Master_PDF_Editor.deb
    sudo apt-get remove atril -y
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y