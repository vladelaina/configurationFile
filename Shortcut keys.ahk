;Ctrl	  ->	^
;Alt	  ->	!
;Shift -> +
;Windows	->	#

;==================================================================



^!+x::
    SetTimer, cursor-id, -1
return

cursor-id:
    Run, C:\Users\vladelaina\AppData\Local\Programs\cursor\cursor-id.exe
return

;==================================================================



^!+c::
    SetTimer, cursor, -1
return

cursor:
    Run, C:\Users\vladelaina\AppData\Local\Programs\cursor\Cursor.exe
return

;==================================================================

^!n::
    SetTimer, notion, -1
return

notion:
    Run, chrome.exe --app=https://www.notion.so/Catime-TO-Do-19117eaa76e480bab172e9e70309bee5
    WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
    ; 将窗口移动到屏幕右侧
    WinMove, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, 0, 0, 960, 1080 ; 将窗口移动到 X=1120, Y=100，宽度800，高度600
return

;==================================================================

#w::
    SetTimer, wezterm, -1
return

wezterm:
    Run, "D:\Date\rare\WezTerm\wezterm-gui.exe"
return

;==================================================================

^!/::
    SetTimer, lexclip, -1
return

lexclip:
    Run, "E:\MD\MD\Code\LexClip\LexClip .exe"

return


;==================================================================

^!d::
    SetTimer, down, -1
return

down:
	Run, "C:\Users\vladelaina\Downloads"
return
;==================================================================

+!c::
    SetTimer, Chrome, -1

return

Chrome:
    Run, "C:\Program Files\Google\Chrome\Application\chrome.exe"
return

;==================================================================

^+g::
    SetTimer, geek, -1
return

geek:
    Run, "D:\Date\Tool\geek.exe"
return

;==================================================================

^!b::
    SetTimer, bilibili, -1
return

bilibili:
    Run, chrome.exe "https://space.bilibili.com/1862395225/favlist?fid=3228957325&ftype=create"
return

;==================================================================


^!c::
    SetTimer, chatgpt, -1
return

chatgpt:
    Run, chrome.exe --app="https://chatgpt.com/"
    WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe
    ; 将窗口移动到屏幕右侧
    WinMove, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, 0, 0, 960, 1080 ; 将窗口移动到 X=1120, Y=100，宽度800，高度600
return



;==================================================================


;^!f::
 ;   SetTimer, feishu, -1
;return

;feishu:
 ;   Run, chrome.exe --app="https://k021q39fc0u.feishu.cn/minutes/home/"
;return

;==================================================================

^!g::
    SetTimer, github, -1
return

github:   
    Run, chrome.exe "https://github.com/vladelaina?tab=repositories"   
return

;==================================================================

^!k::
    SetTimer, perplexity, -1
return

perplexity:
    Run, chrome.exe  "https://www.perplexity.ai/"
return

;==================================================================

^!r::
    SetTimer, read, -1
return

read:
    Run, chrome.exe --app="https://zh-cn.text-to-speech.online/"

 ;   WinWaitActive, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe

     ; 其中, -1920 表示将窗口移动到左侧显示器的左上角，129 为窗口的 Y 坐标，1920 为宽度，1080 为高度
  ;  WinMove, ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe,, -1920, 129, 1600, 1080
return


;==================================================================

^!u::
    SetTimer, upscayl, -1
return

upscayl:
    Run, "D:\Date\rare\Upscayl\Upscayl.exe"
return

;==================================================================

+^!y::
    SetTimer, ywyj, -1
return

ywyj:
    Run, chrome.exe "https://ywyj.cn/"   
return

;==================================================================

^!q::
    SetTimer, Startup, -1
return

Startup:
	Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
return

;==================================================================

^!y::
    SetTimer, youtube, -1
return

youtube:
    Run, chrome.exe "https://www.youtube.com/"
return

;==================================================================
;catim
;==================================================================

^!l::
    SetTimer, livelyWallpaper, -1
return

livelyWallpaper:
	Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Lively.lnk"
    ; 等待 Lively Wallpaper 启动并出现窗口
    WinWait, Lively Wallpaper
    ; 将窗口移动并调整大小到指定的坐标
    WinMove, Lively Wallpaper, , 405, 85, 114, 914
return


;==================================================================

^!w::
    SetTimer,wez, -1
return

wez:
	Run, "D:\Date\rare\WezTerm\wezterm-gui.exe
return


;==================================================================


^!t::
    SetTimer, OpenTyporaFullScreen, -10
return

OpenTyporaFullScreen:
    Run, "D:\Date\Software\Ifrequently used\Typora\Typora.exe"
    WinWaitActive, Typora
    WinMaximize, Typora
return



;==================================================================

^!s::
    SetTimer, s, -1
return

s:
	Run, "D:\Date"
return

;==================================================================

Delete::
    SetTimer, autosave, -1
return

autosave:
	Run, "C:\Users\vladelaina\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Autosave.bat.lnk"
return


;==================================================================


^!j::
    SetTimer, jj, -1
return

jj:
	Run, "D:\Date\Software\Ifrequently used\bilidown\bilidown.exe"
return


;==================================================================


^!m::
    SetTimer,mopenspotify, -10
return


mopenspotify:
    Run, chrome.exe --app="https://open.spotify.com/"
return
;==================================================================


^!f::
    SetTimer, feishu, -1
return

feishu:
    Run, chrome.exe --app="https://k021q39fc0u.feishu.cn/minutes/home/"
return

;==================================================================

