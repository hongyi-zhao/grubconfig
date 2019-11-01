#接受相对路径，制作完成后，用下面的命令检查：
#$ strings grub-mkstandalone-x86_64.efi | grep -E '^(insmod|configfile)'
# 需要使用下面的选项，否则device，partition 名解析不出来：
#  --modules=MODULES      pre-load specified modules MODULES
# --modules='fat part_msdos part_gpt ext2 search_fs_uuid configfile'
werner@kubuntu:/mnt/sda2$ sudo grub-mkstandalone -O x86_64-efi -o grub-mkstandalone-x86_64.efi --modules='fat part_msdos part_gpt ext2 regexp iso9660 loopback chain search configfile'  boot/grub/grub.cfg=./grub-mkstandalone.cfg

#
# grub-mkstandalone-x86_64.efi 它调用的 grub.cfg 在同一个目录，就可以了。

# --loader 路径写法 ref：

# grubconfig.git/doc/Hybrid-UEFI-GPT+BIOS-GPT-MBR-boot/[steps-used-by-me]grub2-gpt-bios-efi

sudo efibootmgr --create --disk /dev/sda --part 2 --loader /EFI/grub-mkstandalone/grub-mkstandalone-x86_64.efi --label "grub-mkstandalone-x86_64 hd"



