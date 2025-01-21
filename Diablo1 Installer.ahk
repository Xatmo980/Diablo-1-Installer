#Include cJson.ahk
#NoTrayIcon
SetBatchLines,-1
SetWinDelay,0

Menu, MainTheMenu, Add, &By Mordor_XP,Mordor
Menu, MainTheMenu, Add, &By Devilutionx,Devilution
Menu, MainTheMenu, Add, &By Blizzard,Bliz
Gui, Menu, MainTheMenu

IfNotExist, %A_WorkingDir%\Diablo.jpg
  FileInstall, Diablo.jpg, %A_WorkingDir%\Diablo.jpg, 1
Name := GetFileName(), DevxName := GetDevXVersion()
Gui, Add, Picture, x2 y-51 w290 h410 , Diablo.jpg
Gui, Add, Button, gD1Classic x72 y109 w140 h30 , Diablo 1: Classic
Gui, Add, Button, gD1TheHell x72 y149 w140 h30 , The Hell 3: %Name%
Gui, Add, Button, gD1devilutionx x72 y189 w140 h30 , Devilutionx: %DevxName%
Gui, Add, Text,cRed vTopText x50 y235 w200 h30 +BackgroundTrans, 
Gui, Add, Progress, x45 y250 w200 h25 cRed vDownloadBar, 0
Gui, Add, Text,cBlack vBottomText x60 y255 w200 h30 +BackgroundTrans,
Gui, Add, Text,cRed x6 y294 w150 h30 +BackgroundTrans, Installer By Xatmo
Gui, Show, w298 h306, Diablo 1 Installer
StartupHideDLBar()
return

Mordor()
{
 Gui, Mor:Add, GroupBox, x2 y-1 w280 h80
 Gui, Mor:Add, Picture, x2 y-30 w299 h250 , Diablo.jpg
 Gui, Mor:Add, Link, x30 y19 w240 h20, <a href="https://www.moddb.com/mods/diablo-the-hell-3">https://www.moddb.com/mods/diablo-the-hell-3</a>
 Gui, Mor:Add, Link, x54 y49 w180 h20, <a href="https://discord.gg/9kN7HMPgUY">https://discord.gg/9kN7HMPgUY</a>
 Gui, Mor:Show, w299 h92,By Mordor_XP
return
}

Devilution()
{
 Gui, Dev:Add, GroupBox, x2 y-1 w280 h80
 Gui, Dev:Add, Picture, x2 y-30 w299 h250 , Diablo.jpg
 Gui, Dev:Add, Link, x43 y19 w210 h20, <a href="https://github.com/diasurgical/devilutionX">https://github.com/diasurgical/devilutionX</a>
 Gui, Dev:Add, Link, x54 y49 w190 h20, <a href="https://discord.com/invite/devilutionx">https://discord.com/invite/devilutionx</a>
 Gui, Dev:Show, w299 h92,by Devilutionx
return
}

Bliz()
{
 Gui, Blizz:Add, GroupBox, x2 y-1 w280 h80
 Gui, Blizz:Add, Picture, x2 y-30 w299 h250 , Diablo.jpg
 Gui, Blizz:Add, Link, x39 y19 w230 h20, <a href="https://us.shop.battle.net/en-us/product/diablo">https://us.shop.battle.net/en-us/product/diablo</a>
 Gui, Blizz:Add, Link, x61 y49 w160 h20, <a href="https://www.blizzard.com/en-us">https://www.blizzard.com/en-us</a>
 Gui, Blizz:Show, w299 h92,by Blizzard Entertainment
return
}

StartupHideDLBar()
{
 GuiControl, Hide, TopText
 GuiControl, Hide, BottomText
 GuiControl, Hide, DownloadBar
}

D1Classic()
{
 If CheckInstall()
 {
  MsgBox, 4,, Download and Install Diablo 1?
  IfMsgBox Yes
   {
    FileCreateDir, diablo
    Sleep, 100
    ExtractEmbeds()
    Sleep, 100
    Path := FindLocation()
    if Path != 0
      FileCopy, %Path%, diablo\DIABDAT.MPQ
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
    Install7z()
    Sleep, 100
    DL := GetDownloadLink()
    DownloadTheHell(Name := GetFileName(), DL)
    Extract("TH3.7z")
    CleanUp()
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
    Install7zDevX()
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
    DownloadDevX(Name, DL)
    ExtractDevX("devilutionx-windows-x86_64.zip")
    CleanUpDevx()

    MsgBox % "Complete"
  }
 }
else
  MsgBox % "Diablo is not installed on your system. You can Buy it from https://us.shop.battle.net/en-us/product/diablo or https://www.gog.com/en/game/diablo"
}

DownloadD1()
{
  GuiControl, Show, TopText
  GuiControl, Show, BottomText
  GuiControl, Show, DownloadBar

  totalFileSize := 517501282
  FileSize := Round(totalFileSize/1000000)

        GuiControl,, TopText, Please wait while download is in progress
	SetTimer, uProgress, 250
	UrlDownloadToFile % "http://www.xatmo.us/diablompq/DIABDAT.MPQ", % A_WorkingDir . "\diablo\DIABDAT.MPQ"
	SetTimer, uProgress, off
         MsgBox, 4,,Finished!! Create Desktop Shortcut?
            IfMsgBox Yes
             {
              FileCreateShortcut, %A_WorkingDir%\diablo\Diablo.exe, %A_Desktop%\Diablo 1.lnk,,, Diablo 1, %A_WorkingDir%\diablo\Diablo.exe
              Return
             }
            else
               Return
    
   uProgress:
	 FileGetSize, fs, %A_WorkingDir%\diablo\DIABDAT.MPQ
	 a := Floor(fs/totalFileSize * 100)
	 b := Floor(fs/totalFileSize * 10000)/100
	 SetFormat, float, 0.2
	 b += 0
         f := Round(fs/1000000)
         GuiControl,, DownloadBar, %b%
         GuiControl,, BottomText, %b%`% done (%f% MB of %FileSize% MB)
         Return
}

DownloadTheHell(Name, DL)
{
   Path := FindLocation()
   if Path != 0
     FileCopy, %Path%, TheHell3\DIABDAT.MPQ
   else
    {
     MsgBox % "DIABDAT.MPQ Not found in common install locations!"
     ExitApp
    }
     GuiControl, Show, TopText
     GuiControl, Show, BottomText
     GuiControl, Show, DownloadBar

     totalFileSize := GetSizeBytes()
     FileSize := Round(totalFileSize/1000000)

        GuiControl,, TopText, Please wait while download is in progress
	SetTimer, uProgress1, 250
	UrlDownloadToFile % DL, % A_WorkingDir . "\TheHell3\TH3.7z"
	SetTimer, uProgress1, off
 
   uProgress1:
	 FileGetSize, fs, % A_WorkingDir . "\TheHell3\TH3.7z"
	 a := Floor(fs/totalFileSize * 100)
	 b := Floor(fs/totalFileSize * 10000)/100
	 SetFormat, float, 0.2
	 b += 0
         f := Round(fs/1000000)
         GuiControl,, DownloadBar, %b%
         GuiControl,, BottomText, %b%`% done (%f% MB of %FileSize% MB)
         Return
}

DownloadDevX(Name, DL)
{
   Path := FindLocation()
   if Path != 0
     FileCopy, %Path%, diablo\DIABDAT.MPQ
   else
    {
     MsgBox % "DIABDAT.MPQ Not found in common install locations!"
     ExitApp
    }
     GuiControl, Show, TopText
     GuiControl, Show, BottomText
     GuiControl, Show, DownloadBar

     totalFileSize := GetDevXSize()
     FileSize := Round(totalFileSize/1000000)

        GuiControl,, TopText, Please wait while download is in progress
	SetTimer, uProgress2, 250
	UrlDownloadToFile % DL, % A_WorkingDir . "\diablo\devilutionx-windows-x86_64.zip"
	SetTimer, uProgress2, off
 
   uProgress2:
	 FileGetSize, fs, % A_WorkingDir . "\diablo\devilutionx-windows-x86_64.zip"
	 a := Floor(fs/totalFileSize * 100)
	 b := Floor(fs/totalFileSize * 10000)/100
	 SetFormat, float, 0.2
	 b += 0
         f := Round(fs/1000000)
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

Extract(FileName)
{
 SetWorkingDir % A_WorkingDir . "\TheHell3"
 GuiControl,, TopText,Please wait while Extraction is in progress
 RunWait %comspec% /c "7za x %FileName% -aoa *.* -r",, HIDE
 MsgBox, 4,,Finished!! Create Desktop Shortcut?
    IfMsgBox Yes
      {
       FileCreateShortcut, %A_WorkingDir%\TH3.exe, %A_Desktop%\The Hell 3.lnk,,, The Hell 3, %A_WorkingDir%\TH3.exe
       Return
      }
       else
          Return
}

ExtractDevX(FileName)
{
 SetWorkingDir % A_WorkingDir . "\diablo"
 GuiControl,, TopText,Please wait while Extraction is in progress
 RunWait %comspec% /c "7za x %FileName% -aoa *.* -r",, HIDE
 FileMove, % A_WorkingDir . "\devilutionx", % A_WorkingDir
 FileRemoveDir, % A_WorkingDir . "\devilutionx"
 MsgBox, 4,,Finished!! Create Desktop Shortcut?
    IfMsgBox Yes
      {
       FileCreateShortcut, %A_WorkingDir%\devilutionx.exe, %A_Desktop%\devilutionx.exe.lnk,,, devilutionx, %A_WorkingDir%\devilutionx.exe
       Return
      }
       else
          Return
}

Install7z()
{
if !FileExist(7za.exe)
    {
     FileCreateDir, TheHell3
     FileInstall, 7za.exe, 7za.exe
     FileCopy, 7za.exe, TheHell3\7za.exe
    }
}

Install7zDevX()
{
if !FileExist(7za.exe)
    {
     FileInstall, 7za.exe, 7za.exe
     FileCopy, 7za.exe, diablo\7za.exe
    }
}

CleanUp()
{
 GuiControl,, TopText, Cleanup in progress
 GuiControl,, BottomText, Deleteing- 7za.exe
 FileDelete, 7za.exe
 GuiControl,, BottomText, Deleteing- TH3.7z
 FileDelete, TH3.7z
 SetWorkingDir % A_ScriptDir
 GuiControl,, TopText, 
 GuiControl,, BottomText, (Installation Complete!!)
}

CleanUpDevx()
{
 GuiControl,, TopText, Cleanup in progress
 GuiControl,, BottomText, Deleteing- 7za.exe
 FileDelete, 7za.exe
 GuiControl,, BottomText, Deleteing- devilutionx-windows-x86_64.zip
 FileDelete, devilutionx-windows-x86_64.zip
 SetWorkingDir % A_ScriptDir
 GuiControl,, TopText, 
 GuiControl,, BottomText, (Installation Complete!!)
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

BlizzGuiClose:
 Gui, Blizz:Destroy
Return