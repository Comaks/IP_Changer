 color a
 @ECHO OFF
  cls

  :MENU
  cls
  ECHO ______________________________________
  ECHO    Sadece administor olarak calisir!!
  ECHO                 By Comaks
  ECHO.
  ECHO.
  ECHO.
  ECHO ______________________________________
  ECHO                     MENU
  ECHO ................................
  ECHO Secim yapin:
  ECHO.
  ECHO     1 IP Static 
  ECHO     2 IP Dynamic
  ECHO     3 Network Adapter'lerini kontrol et.
  ECHO     4 Network Wi-Fi Interface'i Kontrol Et
  ECHO     5 Network Ethernet Interface'i Kontrol Et
  ECHO     6 Cikis
  ECHO .................................. 
  ECHO.
  ECHO.

  SET /P M=1'den 6'e kadar bir secim yapiniz:  
  IF %M%==1 GOTO STATIC
  IF %M%==2 GOTO DYNAMIC
  IF %M%==3 GOTO CHECK
  IF %M%==4 GOTO CHECK2
  IF %M%==5 GOTO CHECKIF
  IF %M%==6 GOTO EOF

  :STATIC
  
  :MENU2
   cls
  ECHO.
  ECHO.
  ECHO ______________________________________
  ECHO                     MENU
  ECHO ................................
  ECHO Secim yapin:
  ECHO.
  ECHO     1 Wi-Fi
  ECHO     2 Ethernet
  ECHO     3 Geri
  ECHO     4 Cikis
  ECHO
  ECHO .................................. 
  ECHO.
  ECHO.
  
  
  SET /P M=1'den 4'e kadar bir secim yapiniz:  
  IF %M%==1 GOTO WİFİ
  IF %M%==2 GOTO ETHERNET
  IF %M%==3 GOTO GERİ
  IF %M%==4 GOTO EOF
  
  :WİFİ
  
 set /p secim="IP Adresi: "
 netsh interface ipv4 set address name="Wi-Fi" static %secim% 255.255.255.0 192.168.1.1
 echo 
 echo IP adresi %secim% ve subned mask 255.255.255.0 olarak degistiriliyor...
 TIMEOUT /T 4 /NOBREAK > NUL
  ECHO __________________________________
  ECHO Adapter detaylari gosteriliyor...
  netsh interface ip show config name="Wi-Fi"
  TIMEOUT /T 2 /NOBREAK > NUL
  GOTO MENU
 
   :ETHERNET
  
 set /p secim="IP Adresi: "
 netsh interface ipv4 set address name="Ethernet" static %secim% 255.255.255.0 192.168.1.1
 echo 
 echo IP adresi %secim% ve subnet mask 255.255.255.0 olarak degistiriliyor...
 TIMEOUT /T 4 /NOBREAK > NUL
 GOTO MENU
    :GERİ
  
 GOTO MENU
  
  
  ECHO ______________________________
  ECHO.
  ECHO IP adresi 192.168.1.35 ve subned mask 255.255.255.0 olarak degistiriliyor...
  netsh interface ipv4 set address name="Wi-Fi" static 192.168.1.35 255.255.255.0 192.168.1.1
  netsh interface ipv4 set dns "Wi-Fi" static 192.168.1.1 primary

  TIMEOUT /T 2 /NOBREAK > NUL
  ECHO ____________________________
  netsh interface ip show config name="Wi-Fi"
  TIMEOUT /T 2 /NOBREAK > NUL
  GOTO MENU


  :DYNAMIC
  ECHO IP Adresi otomatiğe cekiliyor.
  netsh interface ipv4 set address name="Wi-Fi" dhcp
  netsh interface ipv4 set address name="Ethernet" dhcp
  netsh interface ipv4 set dnsserver name="Wi-Fi" dhcp
  netsh interface ipv4 set dnsserver name="Ethernet" dhcp
  TIMEOUT /T 4 /NOBREAK > NUL
  goto MENU



  :CHECK
  ECHO ____________________________________
  ECHO Netwrok Interface'leri gosteriliyor.
  netsh interface ipv4 show interfaces
  TIMEOUT /T 4 /NOBREAK > NUL
  GOTO MENU
  
  :CHECK2
  ECHO __________________________________
  ECHO Adapter detaylari gosteriliyor...
  netsh interface ip show config name="Wi-Fi"
  TIMEOUT /T 4 /NOBREAK > NUL
  GOTO MENU

  :CHECKIF
  ECHO __________________________________
  ECHO Adapter detaylari gosteriliyor...
  netsh interface ip show config name="Ethernet"
  TIMEOUT /T 4 /NOBREAK > NUL
  GOTO MENU