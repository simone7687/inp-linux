sudo apt-get update
sudo apt-get upgrade


cp netkit-2.8.tar.bz2 netkit-filesystem-i386-F5.2.tar.bz2 netkit-kernel-i386-K2.8.tar.bz2 08-check_filesystem.sh ~/
cd ~/


tar -xjSf netkit-2.8.tar.bz2
tar -xjSf netkit-filesystem-i386-F5.2.tar.bz2
tar -xjSf netkit-kernel-i386-K2.8.tar.bz2

export NETKIT_HOME=~/netkit
export MANPATH=:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH


# rinonima in 08-check_filesystem.sh: FS_TYPE -> FS_TIPO , Type -> Tipo
echo
echo https://www.youtube.com/watch?v=h2msQOtKcw8
cp 08-check_filesystem.sh ~/netkit/check_configuration.d/08-check_filesystem.sh


cd netkit

echo
echo http://wiki.netkit.org/index.php/FAQ#On_every_attempt_to_start_a_virtual_machine_I_get_the_error:_.22Can.27t_execvp_some_path.2Fkernel.2Fnetkit-kernel:_No_such_file_or_directory.22._But_the_kernel_file_is_there.21_What_is_going_wrong.3F
sudo apt-get install libc6:i386 -y
sudo apt-get install libncurses5:i386 -y
sudo apt-get install libreadline6:i386 -y
# libreadline7

# non esiste più
# sudo apt install ia32-libs
# forse da lasciare
# sudo apt install libc6-i386


./check_configuration.sh


cd ~/
rm netkit-2.8.tar.bz2 netkit-filesystem-i386-F5.2.tar.bz2 netkit-kernel-i386-K2.8.tar.bz2 08-check_filesystem.sh