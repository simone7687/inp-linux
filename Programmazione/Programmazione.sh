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
echo Vuoi installare VisualCode?
function_question
if (( value_question == 1 )) ; then
    sudo snap install code --classic
fi
echo 
echo Vuoi installare VirtualBox?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get install virtualbox -y
fi
echo 
echo ---------
echo -- Git --
echo ---------
echo https://github.com/shiftkey/desktop/releases
echo Vuoi installare GitHub?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get install git git-man -y
    sudo dpkg -i GitHubDesktop.deb
    # sudo snap install github-desktop --beta --classic
fi
echo 
echo Vuoi installare SmartGit?
function_question
if (( value_question == 1 )) ; then
    sudo apt-get install git git-man -y
    sudo dpkg -i smartgit.deb
fi
echo 
echo Vuoi installare FastBoot?
function_question
if (( value_question == 1 )) ; then
    sudo apt install fastboot -y
fi
echo 
echo Vuoi installare ADB?
function_question
if (( value_question == 1 )) ; then
    sudo apt install adb -y
fi
echo 
echo ----------
echo -- Java --
echo ----------
echo Vuoi installare Java 11?
function_question
if (( value_question == 1 )) ; then
    sudo apt install openjdk-11-jdk -y
fi
echo 
echo -------------
echo -- Android --
echo -------------
echo Vuoi installare Android Studio?
function_question
if (( value_question == 1 )) ; then
    sudo snap install android-studio --classic
fi
echo
echo --------------
echo -- DataBase --
echo --------------
# echo Vuoi installare pgadmin4?
# function_question
# if (( value_question == 1 )) ; then
#     #sudo snap install postgresql10
#     chmod +x postgresql-10.7-2-linux-x64.run
#     sudo ./postgresql-10.7-2-linux-x64.run
# fi
# echo 
echo Vuoi installare DBeaver?
function_question
if (( value_question == 1 )) ; then
    sudo snap install dbeaver-ce
fi
echo 
echo Vuoi installare Postman?
function_question
if (( value_question == 1 )) ; then
    sudo snap install postman
fi

#   (fine)
echo --- Dispense dei pacchetti ---
sudo apt --fix-broken install -y
sudo apt autoremove -y
