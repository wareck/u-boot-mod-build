#!/bin/bash

echo -e "Download sources:"
git clone https://github.com/pepe2k/u-boot_mod.git

echo -e "Download toolchain"
wget -c http://folivier.homelinux.org/toolchain-mips_24kc_gcc-5.4.0_musl-1.1.16_for-raspberry-pi-3.tar.gz
tar xvfz toolchain-mips_24kc_gcc-5.4.0_musl-1.1.16_for-raspberry-pi-3.tar.gz
mv toolchain-mips_24kc_gcc-5.4.0_musl-1.1.16 u-boot_mod/toolchain

echo -e "Modify Makefile"
cat linestoadd >>/tmp/tempo
cat u-boot_mod/Makefile >>/tmp/tempo
cp /tmp/tempo u-boot_mod/Makefile
cd u-boot_mod
make tp-link_tl-wr703n_v1
make 
