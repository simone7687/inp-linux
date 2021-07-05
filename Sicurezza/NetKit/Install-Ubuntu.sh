echo https://support.humblebundle.com/hc/en-us/articles/202759400-Installing-32-bit-libs-on-a-64-bit-Linux-system?mobile_site=true
echo

sudo apt-get update
sudo apt-get upgrade


cp netkit-2.8.tar.bz2 netkit-filesystem-i386-F5.2.tar.bz2 netkit-kernel-i386-K2.8.tar.bz2 08-check_filesystem.sh ~/
cd ~/


# tar -xjSf netkit-2.8.tar.bz2
# tar -xjSf netkit-filesystem-i386-F5.2.tar.bz2
# tar -xjSf netkit-kernel-i386-K2.8.tar.bz2

export NETKIT_HOME=~/netkit
export MANPATH=:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH


# rinonima in 08-check_filesystem.sh: FS_TYPE -> FS_TIPO , Type -> Tipo
echo
echo https://www.youtube.com/watch?v=h2msQOtKcw8
cp 08-check_filesystem.sh ~/netkit/check_configuration.d/08-check_filesystem.sh


cd netkit


sudo apt-get install lib32z1 -y
sudo apt-get install libgtk2.0-0: -y 
sudo apt-get install libidn11 -y
sudo apt-get install libglu1-mesa -y
sudo apt-get install libxmu6 -y
sudo apt-get install libpangox-1.0-0 -y
sudo apt-get install libpangoxft-1.0-0 -y


echo
echo http://wiki.netkit.org/index.php/FAQ#On_every_attempt_to_start_a_virtual_machine_I_get_the_error:_.22Can.27t_execvp_some_path.2Fkernel.2Fnetkit-kernel:_No_such_file_or_directory.22._But_the_kernel_file_is_there.21_What_is_going_wrong.3F
sudo apt-get install libc6 -y
sudo apt-get install libncurses5 -y
sudo apt-get install libreadline6 -y


./check_configuration.sh


cd ~/
rm netkit-2.8.tar.bz2 netkit-filesystem-i386-F5.2.tar.bz2 netkit-kernel-i386-K2.8.tar.bz2 08-check_filesystem.sh