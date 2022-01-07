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
echo Vuoi installare Blender?
function_question
if (( value_question == 1 )) ; then
    sudo snap install blender --classic
fi
echo 
echo Vuoi installare Audacity
function_question
if (( value_question == 1 )) ; then
    sudo snap install audacity --classic
fi
echo 
echo Vuoi installare Poedit
function_question
if (( value_question == 1 )) ; then
    sudo apt install poedit
fi
echo -----------
echo -- Unity --
echo -----------
echo Vuoi installare Unity?
function_question
if (( value_question == 1 )) ; then
    chmod a+x UnityHub.AppImage
    ./UnityHub.AppImage
fi
echo 
echo Vuoi installare Tiled?
function_question
if (( value_question == 1 )) ; then
    chmod a+x Tiled.AppImage
    ./Tiled.AppImage
fi
echo

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y

sudo apt-get update
sudo apt-get upgrade -y
sudo apt autoremove -y
sudo dpkg --configure -a