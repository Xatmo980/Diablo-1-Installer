#Include cJson.ahk
#NoTrayIcon
SetBatchLines,-1
SetWinDelay,0

Global M1,M2,N1,N2,B1,B2,O1,O2
Menu, MainTheMenu, Add, &By Mordor,Mordor
Menu, MainTheMenu, Add, &By Devilutionx,Devilution
Menu, MainTheMenu, Add, &By Noktis,Nok
Menu, MainTheMenu, Add, &By Blizz,Bliz
Gui, Menu, MainTheMenu

InstallInterface()
Gui, Font, s9 , diablo
Name := GetFileName(), DevxName := GetDevXVersion()
Name := SubStr(Name, 8, 10)
Gui, Add, Picture, x2 y-51 w290 h410 , Interface\Diablo.jpg
Gui, Add, Picture, gBelzebub x72 y109 w160 h30 , Interface\Button.jpg
Gui, Add, Text, +Center x78 y116 w140 h30 +BackgroundTrans, Diablo 1: Belzebub
Gui, Add, Picture, gD1TheHell x72 y149 w160 h30 , Interface\Button.jpg
Gui, Add, Text, +Center x76 y156 w150 h30 +BackgroundTrans,TheHell 3:%Name%
Gui, Add, Picture, gD1devilutionx x72 y189 w160 h30 , Interface\Button.jpg
Gui, Add, Text, +Center x79 y196 w140 h30 +BackgroundTrans, Devilutionx: %DevxName%
Gui, Add, Text,cRed vTopText x35 y235 w250 h30 +BackgroundTrans, 
Gui, Add, Progress, x35 y250 w225 h25 cRed vDownloadBar, 0
Gui, Add, Text,cBlack vBottomText x39 y255 w230 h30 +BackgroundTrans,
Gui, Font, s6
Gui, Add, Text,cRed x6 y294 w150 h30 +BackgroundTrans, Installer By Xatmo
Gui, Show, w298 h306, Diablo 1 Mod Installer
StartupHideDLBar()
return

Mordor()
{
 Gui, Mor:Font, bold 
 Gui, Mor:Add, Picture, x2 y-30 w299 h250 , Interface\Diablo.jpg
 Gui, Mor:Add, Picture, x18 y9 w250 h35, Interface\Button.jpg
 Gui, Mor:Add, Text, gModDB vM1 +BackgroundTrans x35 y19 w280 h20,www.moddb.com/mods/diablo-the-hell
 Gui, Mor:Add, Picture, x44 y48 w190 h35, Interface\Button.jpg
 Gui, Mor:Add, Text, gHellDis vM2 +BackgroundTrans x70 y58 w190 h20,discord.gg/9kN7HMPgUY
 Gui, Mor:Show, w299 h92,By Mordor_XP
return
}

ModDB()
{
 Run, https://www.moddb.com/mods/diablo-the-hell-3
}

HellDis()
{
 Run, https://discord.gg/9kN7HMPgUY
}

Devilution()
{
 Gui, Dev:Font, bold 
 Gui, Dev:Add, Picture, x2 y-30 w299 h250 , Interface\Diablo.jpg
 Gui, Dev:Add, Picture, x33 y9 w230 h35, Interface\Button.jpg
 Gui, Dev:Add, Text, gDevGit vN1 +BackgroundTrans x48 y19 w240 h20, github.com/diasurgical/devilutionX
 Gui, Dev:Add, Picture, x33 y48 w230 h35, Interface\Button.jpg
 Gui, Dev:Add, Text, gDevDis vN2 +BackgroundTrans x65 y58 w220 h20,discord.com/invite/devilutionx
 Gui, Dev:Show, w299 h92,by Devilutionx
return
}

DevGit()
{
 Run, https://github.com/diasurgical/devilutionX
}

DevDis()
{
 Run, https://discord.com/invite/devilutionx
}

Bliz()
{
 Gui, Blizz:Font, bold 
 Gui, Blizz:Add, Picture, x2 y-30 w299 h250 , Interface\Diablo.jpg
 Gui, Blizz:Add, Picture, x30 y9 w260 h35, Interface\Button.jpg
 Gui, Blizz:Add, Text, gBuyD1 vB1 +BackgroundTrans x45 y19 w270 h20, us.shop.battle.net/en-us/product/diablo
 Gui, Blizz:Add, Picture, x57 y48 w200 h35, Interface\Button.jpg
 Gui, Blizz:Add, Text, gBlizzSite vB2 +BackgroundTrans x90 y58 w190 h20, www.blizzard.com/en-us
 Gui, Blizz:Show, w299 h92,by Blizzard Entertainment
return
}

BuyD1()
{
 Run, https://us.shop.battle.net/en-us/product/diablo
}

BlizzSite()
{
 Run, https://www.blizzard.com/en-us
}

Nok()
{
 Gui, No:Font, bold 
 Gui, No:Add, Picture, x2 y-30 w299 h250 , Interface\Diablo.jpg
 Gui, No:Add, Picture, x50 y9 w210 h35, Interface\Button.jpg
 Gui, No:Add, Text, gNikSite vO1 +BackgroundTrans x63 y19 w270 h20, https://mod.diablo.noktis.pl
 Gui, No:Add, Picture, x50 y48 w210 h35, Interface\Button.jpg
 Gui, No:Add, Text, gNikDis vO2 +BackgroundTrans x63 y58 w190 h20, https://discord.com/invite/gbFURCHk
 Gui, No:Show, w299 h92,by Noktis
return
}

NikSite()
{
 Run, https://mod.diablo.noktis.pl
}

NikDis()
{
 Run, https://discord.com/invite/gbFURCHk
}

StartupHideDLBar()
{
 GuiControl, Hide, TopText
 GuiControl, Hide, BottomText
 GuiControl, Hide, DownloadBar
}

Belzebub()
{
 If CheckInstall()
 {
  MsgBox, 4,, Download and Install Diablo 1: Belzebub?
  IfMsgBox Yes
   {
    FileCreateDir, Belzebub
    Sleep, 100
    Path := FindLocation()
    if Path != 0
    {
      FileCopy, %Path%, Belzebub\DIABDAT.MPQ
      Install7z(Dev, hell, Bel := 1)
      DL := "http://www.xatmo.us/Belzebub/Release1045.zip"
      UniversalInstall(Name, Hell, Dev, Bel := 1, DL)
      UniveralExtract("Release1045.zip", Hell, Dev, Bel := 1)
      CleanUpAll(Dev, Hell, Bel := 1)
    }
      else
        MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"

    MsgBox % "Complete"
   }
 }
else
  MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"
}

D1TheHell()
{
 If CheckInstall()
 {
  MsgBox, 4,, Download and Install Diablo 1: The Hell 3?
  IfMsgBox Yes
   {
    Install7z(Dev, hell := 1, Bel)
    Sleep, 100
    DL := GetDownloadLink()
    UniversalInstall(Name := GetFileName(), Hell := 1, Dev, Bel, DL)
    UniveralExtract("TH3.7z", Hell := 1, Dev, Bel)
    CleanUpAll(Dev, Hell := 1, Bel)
   }
 }
else
  MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"
}

D1devilutionx()
{
 If CheckInstall()
 {
 MsgBox, 4,, Download and Install Diablo 1 With devilutionx?
 IfMsgBox Yes
  {
    FileCreateDir, diablo
    Install7z(Dev := 1, hell, Bel)
    Sleep, 100
    Path := FindLocation()
    if Path != 0
      FileCopy, %Path%, diablo\DIABDAT.MPQ
    else
      MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"

    Sleep, 100
    ExtractEmbeds()
    Sleep, 100
    DL := GetDevXDownloadLink()
    UniversalInstall(Name, Hell, Dev := 1, Bel, DL)
    UniveralExtract(FileName, Hell, Dev := 1, Bel)
    CleanUpAll(Dev := 1, Hell, Bel)

    MsgBox % "Complete"
  }
 }
else
  MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"
}

UniversalInstall(Name, Hell, Dev, Bel, DL)
{
 Path := FindLocation()
 if Path != 0
 {
  if Hell = 1
     FileCopy, %Path%, TheHell3\DIABDAT.MPQ
  if Dev = 1
     FileCopy, %Path%, diablo\DIABDAT.MPQ
  if Bel = 1 
     FileCopy, %Path%, Belzebub\DIABDAT.MPQ
 }
 else
   {
    MsgBox % "DIABDAT.MPQ Not found in common install locations!"
    ExitApp
   }
    GuiControl, Show, TopText
    GuiControl, Show, BottomText
    GuiControl, Show, DownloadBar

    If Hell = 1
       totalFileSize := GetSizeBytes()
    if Dev = 1
       totalFileSize := GetDevXSize()
    if Bel = 1
       totalFileSize := 33776115

    FileSize := Round(totalFileSize/1000000)

       Gui, Font, cRed s8
       GuiControl, Font, TopText
       GuiControl,, TopText, Please wait while downloading
       SetTimer, uProgressU, 250
       if Hell = 1
          UrlDownloadToFile % DL, % A_WorkingDir . "\TheHell3\TH3.7z"
       if Dev = 1
          UrlDownloadToFile % DL, % A_WorkingDir . "\diablo\devilutionx-windows-x86_64.zip"
       if Bel = 1
          UrlDownloadToFile % DL, % A_WorkingDir . "\Belzebub\Release1045.zip"
       SetTimer, uProgressU, off
 
   uProgressU:
         if Hell = 1
	    FileGetSize, fs, % A_WorkingDir . "\TheHell3\TH3.7z"
         if Dev = 1
            FileGetSize, fs, % A_WorkingDir . "\diablo\devilutionx-windows-x86_64.zip"
         if Bel = 1
            FileGetSize, fs, % A_WorkingDir . "\Belzebub\Release1045.zip"
	 a := Floor(fs/totalFileSize * 100)
	 b := Floor(fs/totalFileSize * 10000)/100
	 SetFormat, float, 0.2
	 b += 0
         f := Round(fs/1000000)
         Gui, Font, cBlack s8
         GuiControl, Font, BottomText
         GuiControl,, DownloadBar, %b%
         GuiControl,, BottomText, %b%`% done (%f% MB of %FileSize% MB)
         Return
}

GetDevXDownloadLink()
{
 URL := "https://api.github.com/repos/diasurgical/devilutionX/releases?page=1"
 Data := Connect(URL, Method := "GET", PostData)
 obj := cJson.Loads(Data)
 Data := obj
 Tag := Data[1].name
 Source := "https://github.com/diasurgical/devilutionX/releases/download/" . Tag . "/devilutionx-windows-x86_64.zip"
return Source
}


GetDevXVersion()
{
 URL := "https://api.github.com/repos/diasurgical/devilutionX/releases?page=1"
 Data := Connect(URL, Method := "GET", PostData)
 obj := cJson.Loads(Data)
 Data := obj
 Tag := Data[1].name
return Tag
}

GetDevXSize()
{
 URL := "https://api.github.com/repos/diasurgical/devilutionX/releases?page=1"
 Data := Connect(URL, Method := "GET", PostData)
 obj := cJson.Loads(Data)
 Data := obj
 for k,v in Data[1].assets
     {
      I++
      AssName := Data[1].assets[I].name
      If AssName = devilutionx-windows-x86_64.zip
         Size := Data[1].assets[I].size
      }
return Size
}

GetFileName()
{
 ModdbLink := "https://www.moddb.com/mods/diablo-the-hell-3/downloads/th3"
 Text := Connect(ModdbLink, Method := "GET", PostData)
 Loop, parse, Text, `n, `r
 {
  If InStr(A_LoopField, "TH3_v")
  {
     Formatted := SubStr(A_LoopField, 1, (Str := StrLen(A_LoopField) -16))
     return Formatted
  }
 }
}

GetDownloadLink()
{
 ModdbLink := "https://www.moddb.com/downloads/start/240202?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fdiablo-the-hell-3"
 Text := Connect(ModdbLink, Method := "GET", PostData)
 Loop, parse, Text, `n, `r
 {
  If InStr(A_LoopField, "download TH3_v")
  {
     FormattedDL := SubStr(A_LoopField, 22, (Str := StrLen(A_LoopField) -279))
     FormattedDL := "https://www.moddb.com" . FormattedDL
     return FormattedDL
  }
 }
}

GetSizeBytes()
{
 ModdbLink := "https://www.moddb.com/mods/diablo-the-hell-3/downloads/th3"
 Text := Connect(ModdbLink, Method := "GET", PostData)
 Loop, parse, Text, `n, `r
 {
  If InStr(A_LoopField, "bytes")
  {
     Strip := StrSplit(Formatted := SubStr(A_LoopField, 18, (Str := StrLen(A_LoopField) -37)), ",") 
     Formatted := Strip[1] . Strip[2] . Strip[3]
     return Formatted
  }
 }
}

UniveralExtract(FileName, Hell, Dev, Bel)
{
 If Hell = 1
    SetWorkingDir % A_WorkingDir . "\TheHell3"
 If Dev = 1
    SetWorkingDir % A_WorkingDir . "\diablo"
  If Bel = 1
    SetWorkingDir % A_WorkingDir . "\Belzebub"
  GuiControl,, TopText,Please wait while Extracting
  RunWait %comspec% /c "7za x %FileName% -aoa *.* -r",, HIDE

  If Dev = 1
    {
     FileMove, % A_WorkingDir . "\devilutionx", % A_WorkingDir
     FileRemoveDir, % A_WorkingDir . "\devilutionx"
    }

  MsgBox, 4,,Finished!! Create Desktop Shortcut?
     IfMsgBox Yes
       {
        If Hell = 1
           FileCreateShortcut, %A_WorkingDir%\TH3.exe, %A_Desktop%\The Hell 3.lnk,,, The Hell 3, %A_WorkingDir%\TH3.exe
        If Dev = 1
           FileCreateShortcut, %A_WorkingDir%\devilutionx.exe, %A_Desktop%\devilutionx.exe.lnk,,, devilutionx, %A_WorkingDir%\devilutionx.exe
        If Bel = 1
           FileCreateShortcut, %A_WorkingDir%\Belzebub.exe, %A_Desktop%\Belzebub.exe.lnk,,, Belzebub, %A_WorkingDir%\Belzebub.exe
        Return
       }
        else
           Return
}

Install7z(Dev, hell, Bel)
{
 if !FileExist(7za.exe)
    FileInstall, 7za.exe, 7za.exe
 if Dev = 1
    FileCopy, 7za.exe, diablo\7za.exe
 if Hell = 1
  {
    FileCreateDir, TheHell3
    FileCopy, 7za.exe, TheHell3\7za.exe
  }
 if Bel = 1
  {
   FileCopy, 7za.exe, Belzebub\7za.exe
  }
}

CleanUpAll(Dev, Hell, Bel)
{
  GuiControl,, TopText, Cleanup in progress
  GuiControl,, BottomText, Deleteing- 7za.exe
  FileDelete, 7za.exe
  if Dev = 1
    {
     GuiControl,, BottomText, Deleteing- devilutionx-windows-x86_64.zip
     FileDelete, devilutionx-windows-x86_64.zip
    }
  if Hell = 1
    {
     GuiControl,, BottomText, Deleteing- TH3.7z
     FileDelete, TH3.7z
    }
  if Bel = 1
    {
     GuiControl,, BottomText, Deleteing- Release1045.zip
     FileDelete, Release1045.zip
    }
  SetWorkingDir % A_ScriptDir
  GuiControl,, TopText, 
  GuiControl,, BottomText, (Installation - Complete!!!)
}

Connect(Url, Method, PostData)
{
 HTTP := ComObjCreate("WinHTTP.WinHTTPRequest.5.1")
 HTTP.Open(Method, Url, false)
 HTTP.Send(PostData)
 HTTP.WaitForResponse()
 Text := HTTP.ResponseText
return Text
}

ExtractEmbeds()
{
 FileInstall, diablo\ddraw.dll, %A_WorkingDir%\diablo\ddraw.dll, 1
 FileInstall, diablo\ddraw_settings.ini, %A_WorkingDir%\diablo\ddraw_settings.ini, 1
 FileInstall, diablo\Diablo.exe, %A_WorkingDir%\diablo\Diablo.exe, 1
 FileInstall, diablo\diablo.ini, %A_WorkingDir%\diablo\diablo.ini, 1
 FileInstall, diablo\diabloui.dll, %A_WorkingDir%\diablo\diabloui.dll, 1
 FileInstall, diablo\ipxwrapper.dll, %A_WorkingDir%\diablo\ipxwrapper.dll, 1
 FileInstall, diablo\STANDARD.snp, %A_WorkingDir%\diablo\STANDARD.snp, 1
 FileInstall, diablo\SMACKW32.DLL, %A_WorkingDir%\diablo\SMACKW32.DLL, 1
 FileInstall, diablo\Storm.dll, %A_WorkingDir%\diablo\Storm.dll, 1
 FileInstall, diablo\wsock32.dll, %A_WorkingDir%\diablo\wsock32.dll, 1
}

CheckInstall()
{
IfExist, C:\Diablo
  return 1
IfExist, C:\GOG Games\Diablo
  return 1
IfExist, C:\Program Files (x86)\GOG Galaxy\Games\Diablo
  return 1
IfExist, C:\Program Files (x86)\Diablo
  return 1

return 0
}

InstallInterface()
{
 FileCreateDir, Interface
 IfNotExist, %A_WorkingDir%\Interface\diablo.ttf
  FileInstall, Interface\diablo.ttf, %A_WorkingDir%\Interface\diablo.ttf, 1
 IfNotExist, %A_WorkingDir%\Interface\Diablo.jpg
  FileInstall, Interface\Diablo.jpg, %A_WorkingDir%\Interface\Diablo.jpg, 1
 IfNotExist, %A_WorkingDir%\Interface\Button.jpg
  FileInstall, Interface\Button.jpg, %A_WorkingDir%\Interface\Button.jpg, 1
 DllCall("AddFontResourceEx", "Str", "Interface\diablo.ttf", "UInt", 0x10, "Ptr", 0)
}

FindLocation()
{
IfExist, C:\Diablo\DIABDAT.MPQ
  return "C:\Diablo\DIABDAT.MPQ"
IfExist, C:\GOG Games\Diablo\DIABDAT.MPQ
  return "C:\GOG Games\Diablo\DIABDAT.MPQ"
IfExist, C:\Program Files (x86)\GOG Galaxy\Games\Diablo\DIABDAT.MPQ
  return "C:\Program Files (x86)\GOG Galaxy\Games\Diablo\DIABDAT.MPQ"
IfExist, C:\Program Files (x86)\Diablo\DIABDAT.MPQ
  return "C:\Program Files (x86)\Diablo\DIABDAT.MPQ"

return 0
}

GuiClose:
 ExitApp

MorGuiClose:
 Gui, Mor:Destroy
Return

DevGuiClose:
 Gui, Dev:Destroy
Return

NoGuiClose:
 Gui, No:Destroy
Return

BlizzGuiClose:
 Gui, Blizz:Destroy
Return