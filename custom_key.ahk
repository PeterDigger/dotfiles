#NoEnv ;
#Warn ;
SendMode Input ;

; Windows + enter
#Enter::
	Run, wt ; Windows Terminal
Return

; Im too lazy to type emails and date lul
:*:]cph::Chong Phit Herng
:*:]@c::chongherng99@gmail.com
:*:]@p::360pitlord@gmail.com
:*:]@b::bi19110193@student.ums.edu.my
:*:]nb::BI19110193

:*:]d::  ; This hotstring replaces "]d" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, MMM/d/yyyy h:mm tt  ; It will look like 9/1/2005 3:53 PM
SendInput %CurrentDateTime%
Return

:*:]e::  ; This hotstring replaces "]e" with the current date and time via the commands below.
FormatTime, CurrentDateTime,, MMMM,d yyyy H:mm ; It will look like 9/1/2005 3:53 PM
SendInput %CurrentDateTime%
Return

#BackSpace::
	Sleep 1000
	SendMessage, 0x112, 0xF170, 2,, Program Manager
	; Source: https://superuser.com/questions/321342/turn-off-display-in-windows-on-command
return

; Emuluate Mouse clicks
#!g::Send {LButton}
#!;::Send {RButton}

; Vim Mouse cursor control
#!h::MouseMove, -5, 0, 50, R
#!j::MouseMove, 0, -5, 50, R
#!k::MouseMove, 0, +5, 50, R
#!l::MouseMove, 5, 0, 50, R

; Windows + Control + Wheel Up
#^WheelUp::Send       {Media_Prev}

; Windows + Control + Middle button
#^MButton::Send      {Media_Play_Pause} 

; Windows + Control + Wheel Down
#^WheelDown::Send      {Media_Next} 

; Windows + Control + [
#^[::Send       {Media_Prev}

; Windows + Control + ]
#^]::Send      {Media_Play_Pause} 

; Windows + Control + \
#^\::Send      {Media_Next} 

; Windows + Shift + Wheel up
#+WheelDown::
Send {Volume_Down}
   return   

; Windows + Shift + Wheel Down
#+WheelUp::
Send {Volume_Up}
   return   

; Windows + Shift + {
#{::
Send {Volume_Down}
   return     

; Windows + Shift + }
#}::
Send {Volume_Up}
   return   

; Windows + Shift + Middle button
#+MButton::
Send {Volume_Mute}
   return  

; Windows + Shift + |
#|::
Send {Volume_Mute}
   return  

;-------------------------------------

; Windows + Wheel Up
#WheelUp::
  AdjustScreenBrightness(10)
  Return

; Windows + Wheel Down
#WheelDown::
  AdjustScreenBrightness(-10)
  Return

; Windows + ]
#]::
  AdjustScreenBrightness(10)
  Return

; Windows + [
#[::
  AdjustScreenBrightness(-10)
  Return
  
AdjustScreenBrightness(step) {
	static service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
	monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
	monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
	for i in monitors {
		curr := i.CurrentBrightness
		break
	}
	toSet := curr + step
	if (toSet < 10)
		toSet := 10
	if (toSet > 100)
		toSet := 100
	for i in monMethods {
		i.WmiSetBrightness(1, toSet)
		break
	}
	BrightnessOSD()
}

BrightnessOSD() {
	static PostMessagePtr := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "PostMessageW" : "PostMessageA", "Ptr")
	 ,WM_SHELLHOOK := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK", "UInt")
	static FindWindow := DllCall("GetProcAddress", "Ptr", DllCall("GetModuleHandle", "Str", "user32.dll", "Ptr"), "AStr", A_IsUnicode ? "FindWindowW" : "FindWindowA", "Ptr")
	HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
	IF !(HWND) {
		try IF ((shellProvider := ComObjCreate("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}"))) {
			try IF ((flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}"))) {
				DllCall(NumGet(NumGet(flyoutDisp+0)+3*A_PtrSize), "Ptr", flyoutDisp, "Int", 0, "UInt", 0)
				 ,ObjRelease(flyoutDisp)
			}
			ObjRelease(shellProvider)
		}
		HWND := DllCall(FindWindow, "Str", "NativeHWNDHost", "Str", "", "Ptr")
	}
	DllCall(PostMessagePtr, "Ptr", HWND, "UInt", WM_SHELLHOOK, "Ptr", 0x37, "Ptr", 0)
}
