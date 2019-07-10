# Compex System repository for Openwrt 18.06

## I. Flashing instruction for Ar71xx Devices
### 1. WPJ558

   ```shell
   tftp 0x80060000 openwrt-ar71xx-generic-wpj558-squashfs-sysupgrade.bin
   erase 0x9f030000 +$filesize&&cp.b $fileaddr 0x9f030000 $filesize
   erase 0x9f680000 +0x10000
   ```
### 2. WPJ563

   ```shell
   tftp 0x80060000 openwrt-ar71xx-generic-wpj563-squashfs-sysupgrade.bin
   erase 0x9f030000 +$filesize
   cp.b $fileaddr 0x9f030000 $filesize
   ```
### 3. WPJ531
  ```shell
  tftpboot 0x80500000 openwrt-ar71xx-generic-wpj531-squashfs-sysupgrade.bin
  erase 0x9f030000 +$filesize
  erase 0x9f680000 +1
  cp.b $fileaddr 0x9f030000 $filesize
  ```
### 4. WPJ344
  ```shell
  tftp 0x80060000 openwrt-ar71xx-generic-wpj344-16M-squashfs-sysupgrade.bin
  erase 0x9f030000 +0x660000&&cp.b $fileaddr 0x9f030000 $filesize
  ```

## II. Flashing instruction for IPQ devices
### 1. WPJ428
  ```shell
  sf probe
  tftpboot 0x84000000 openwrt-ipq40xx-compex_wpj428-squashfs-sysupgrade.bin
  sf erase 0x00180000 +$filesize
  sf write 0x84000000 0x00180000 $filesize
  bootipq
  ```
### 2. WPJ419 NOR flash
  ```shell
  tftpboot openwrt-ipq40xx-compex_wpj419-squashfs-sysupgrade.bin
  sf probe
  sf erase 0x00180000 +$filesize
  sf write 0x88000000 0x00180000 $filesize
  bootipq
  ```
### 3. WPJ419 NOR+NAND flash
  ```shell
  tftpboot openwrt-ipq40xx-compex_wpj419-nand-squashfs-nand-factory.ubi
  nand erase.chip; nand write ${fileaddr} 0x0 ${filesize}
  set fsbootargs ubi.mtd=rootfs root=/dev/ubiblock0_1 rootfstype=squashfs
  saveenv
  res
  ```
### 4. WPQ864 (Support NAND only)
  ```shell
  tftpboot 0x42000000 openwrt-ipq806x-compex_wpq864-squashfs-nand-factory.bin
  ipq_nand linux
  nand erase 0x1340000 0x4000000
  nand write 0x42000000 0x1340000 $filesize
  setenv bootargs " "
  setenv fsbootargs " "
  saveenv
  ```
### 5. WPQ865 (Support NAND only)
  ```shell
  tftpboot 0x42000000 openwrt-ipq806x-compex_wpq865-squashfs-nand-factory.bin
  ipq_nand linux
  nand erase 0x1340000 0x4000000
  nand write 0x42000000 0x1340000 $filesize
  setenv bootargs " "
  setenv fsbootargs " "
  saveenv
  ```
