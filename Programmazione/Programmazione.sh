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
echo Installare Java 11?
domanda
if (( verita == 1 )) ; then
    sudo apt install openjdk-11-jdk -y
fi
echo 
echo Installare Visual studio?
domanda
if (( verita == 1 )) ; then
    sudo snap install code --classic
fi
echo 
echo Installare Android Studio?
domanda
if (( verita == 1 )) ; then
    sudo snap install android-studio --classic
fi
echo
# echo Installare pgadmin4?
# domanda
# if (( verita == 1 )) ; then
#     #sudo snap install postgresql10
#     chmod +x postgresql-10.7-2-linux-x64.run
#     sudo ./postgresql-10.7-2-linux-x64.run
# fi
# echo 
echo Installare DBeaver?
domanda
if (( verita == 1 )) ; then
    sudo snap install dbeaver-ce
fi
echo 
echo https://github.com/shiftkey/desktop/releases
echo Installare GitHub?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install git git-man -y
    sudo dpkg -i GitHubDesktop.deb
    # sudo snap install github-desktop --beta --classic
fi
echo 
echo Installare SmartGit?
domanda
if (( verita == 1 )) ; then
    sudo apt install smartgit -y
fi
echo 
echo Installare VirtualBox?
domanda
if (( verita == 1 )) ; then
    sudo apt-get install virtualbox -y
fi

#   (fine)
echo dispense dei pacchetti
sudo apt --fix-broken install -y
sudo apt autoremove -y
