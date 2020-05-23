#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

; # Windows
; ^ Control
; ! Alt

;//////////////////////////////////////////////////////////////
; initialization
; env variables
;//////////////////////////////////////////////////////////////
#SingleInstance Force ; Allow only one running instance of script.
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:

kbd_layer := 0
;//////////////////////////////////////////////////////////////
; env variables
;//////////////////////////////////////////////////////////////
mouse_move_max_distance := 50
mouse_move_accelation_ratio := 0.05
mouse_move_distance_start := 2
mouse_move_distance := mouse_move_distance_start
tooltip_duration := 2000

noti_type := 1
noti_x := A_ScreenWidth//2-400
noti_y := A_ScreenHeight//2-100

;//////////////////////////////////////////////////////////////
; notications
;//////////////////////////////////////////////////////////////
PopUp(msg){
  global noti_x
  global noti_y
  Tooltip, % "`n`n`t`t " . msg . "`t`t`t`n`n ", %noti_x%, %noti_y%
  ; SetTimer, RemoveToolTip, %tooltip_duration%
  SetTimer, RemoveToolTip, -2000
}
RemoveToolTip:
ToolTip
return
RemoveSplash:
SplashImage,Off
return
SetLayer(num){
  global kbd_layer
  global noti_type
  kbd_layer := num
  if(noti_type = 0){
    If(num = 0){
      PopUp("layer 0 (Normal)")
    } Else If(num = 1){
      PopUp("layer 1 (Navigation)")
    } Else If(num = 2){
      PopUp("layer 2 (Function)")
    } Else If(num = 3){
      PopUp("layer 3 (Num pad)")
    }
  } Else{
    If(num = 0){
      SplashImage, img\layer0_40.png
    } Else If(num = 1){
      SplashImage, img\layer1_40.png
    } Else If(num = 2){
      SplashImage, img\layer2_40.png
    } Else If(num = 3){
      SplashImage, img\layer3_40.png
    }
    SetTimer, RemoveSplash, -2000
  }
}
return

;//////////////////////////////////////////////////////////////
; all layer
; LControl = layer 0 (Normal)
; LShift = layer 1 (Navigation)
; RShift = layer 2 (Function), 3 (Numpad)
; normal http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=*%0A8&=(%0A9&=)%0A0&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=Q&=W&=E&=R&=T&=Y&=U&=I&=O&=P&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A&=S&=D&=F&=G&=H&=J&=K&=L&=%2F:%0A%2F%3B&=%22%0A'&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0ANavigation&=Z&=X&=C&=V&=B&=N&=M&=%3C%0A,&=%3E%0A.&=%3F%0A%2F%2F&_w:2.75%3B&=Shift%0ANumpad%0A%0A%0A%0A%0AFunction%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; navigation http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=PrtSc&=*%0A8&=(%0A9&=)%0A0&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=Esc&=W&=%2F=&=-&=(&=Home%0A!WhUp&=End%0A!Lbtn&=%E2%86%91%0A!M(%E2%86%91)&=PgDn%0A!Rbtn&=PgUp%0A!Mbtn&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A&=*&=%2F%2F&=+&=)&=Back%0A!WhDn%0A%0A%0A%0A%0ASpace&=%E2%86%90%0A!M(%E2%86%90)&=%E2%86%93%0A!M(%E2%86%93)&=%E2%86%92%0A!M(%E2%86%92)&=%2F:%0A%2F%3B&=Esc&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0ANavigation&=Z&=X&=C&=V&=B&=Del&=Menu&=%3C%0A,&=%3E%0A.&=%3F%0A%2F%2F&_w:2.75%3B&=Shift%0ANumpad%0A%0A%0A%0A%0AFunction%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; Function http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=*%0A8&=(%0A9&=)%0A0&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=F1&=F2&=F3&=F4&=F5&=F6&=F7&=F8&=F9&=F10&=F11&=F12&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=*%0A8&=(%0A9&=)%0A0&=Esc&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0ANavigation&=~%0A%60&=X&=C&=V&=(&=)&=-&=%2F=&=%7C%0A%5C&=%3F%0A%2F%2F&_w:2.75%3B&=Shift%0ANumpad%0A%0A%0A%0A%0AFunction%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; Num pad http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=%2F%2F&=*&=-&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=Q&=W&=E&=R&=T&=Y&=7&=8&=9&=+&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A&=S&=D&=F&=G&=H&=4&=5&=6&=Enter&=%22%0A'&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0ANavigation&=Z&=X&=C&=V&=B&=N&=1&=2&=3&=.&_w:2.75%3B&=Shift%0ANumpad%0A%0A%0A%0A%0AFunction%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_w:6.25%3B&=0&_w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
;//////////////////////////////////////////////////////////////
Tab::Escape
CapsLock::Tab
+CapsLock::CapsLock

\::Del
+\::Backspace
^\::Home
!\::End

  ;////////////////////////////////////////////////////////////
  ; Blocked keys for 60 % keyboard:
  ; The following keys groups were made inactive:
  ;  - Function keys
  ;  - printScreen Scrollock Pause
  ;  - Ins Home PgUp
  ;  - Del End PgDown
  ;  - nummeric pad
  ;  - cursor keys
  ;
  ; The above keys and these keys in combination with a single modifier, Shift, Control, Alt or Windows are blocked.
  ; I did not bother with removing them with combined modifiers. 
  ; 
  ;////////////////////////////////////////////////////////////

  F1::F24 ;
  F2::F24 ;
  F3::F24 ;
  F4::F24 ;
  F5::F24 ;
  F6::F24 ;
  F7::F24 ;
  F8::F24 ;
  F9::F24 ;
  F10::F24 ;
  F11::F24 ;
  F12::F24 ;
  F13::F24 ;
  F14::F24 ;
  F15::F24 ;
  F16::F24 ;
  
  +F1::F24 ;
  +F2::F24 ;
  +F3::F24 ;
  +F4::F24 ;
  +F5::F24 ;
  +F6::F24 ;
  +F7::F24 ;
  +F8::F24 ;
  +F9::F24 ;
  +F10::F24 ;
  +F11::F24 ;
  +F12::F24 ;
  +F13::F24 ;
  +F14::F24 ;
  +F15::F24 ;
  +F16::F24 ;

  ^F1::F24 ;
  ^F2::F24 ;
  ^F3::F24 ;
  ^F4::F24 ;
  ^F5::F24 ;
  ^F6::F24 ;
  ^F7::F24 ;
  ^F8::F24 ;
  ^F9::F24 ;
  ^F10::F24 ;
  ^F11::F24 ;
  ^F12::F24 ;
  ^F13::F24 ;
  ^F14::F24 ;
  ^F15::F24 ;
  ^F16::F24 ;

  !F1::F24 ;
  !F2::F24 ;
  !F3::F24 ;
  !F4::F24 ;
  !F5::F24 ;
  !F6::F24 ;
  !F7::F24 ;
  !F8::F24 ;
  !F9::F24 ;
  !F10::F24 ;
  !F11::F24 ;
  !F12::F24 ;
  !F13::F24 ;
  !F14::F24 ;
  !F15::F24 ;
  !F16::F24 ;

  #F1::F24 ;
  #F2::F24 ;
  #F3::F24 ;
  #F4::F24 ;
  #F5::F24 ;
  #F6::F24 ;
  #F7::F24 ;
  #F8::F24 ;
  #F9::F24 ;
  #F10::F24 ;
  #F11::F24 ;
  #F12::F24 ;
  #F13::F24 ;
  #F14::F24 ;
  #F15::F24 ;
  #F16::F24 ;

  PrintScreen::F24 ;
  ScrollLock::F24 ;
  Pause::F24 ;

  +PrintScreen::F24 ;
  +ScrollLock::F24 ;
  +Pause::F24 ;

  ^PrintScreen::F24 ;
  ^ScrollLock::F24 ;
  ^Pause::F24 ;

  !PrintScreen::F24 ;
  !ScrollLock::F24 ;
  !Pause::F24 ;

  #PrintScreen::F24 ;
  #ScrollLock::F24 ;
  #Pause::F24 ;

  Del::F24 ;
  Ins::F24 ;
  Home::F24 ;
  End::F24 ;
  PgUp::F24 ;
  PgDn::F24 ;

  +Del::F24 ;
  +Ins::F24 ;
  +Home::F24 ;
  +End::F24 ;
  +PgUp::F24 ;
  +PgDn::F24 ;
  
  ^Del::F24 ;
  ^Ins::F24 ;
  ^Home::F24 ;
  ^End::F24 ;
  ^PgUp::F24 ;
  ^PgDn::F24 ;

  !Del::F24 ;
  !Ins::F24 ;
  !Home::F24 ;
  !End::F24 ;
  !PgUp::F24 ;
  !PgDn::F24 ;
  
  #Del::F24 ;
  #Ins::F24 ;
  #Home::F24 ;
  #End::F24 ;
  #PgUp::F24 ;
  #PgDn::F24 ;
  

  Up::F24 ;
  Down::F24 ;
  Left::F24 ;
  Right::F24 ;

  +Up::F24 ;
  +Down::F24 ;
  +Left::F24 ;
  +Right::F24 ;

  ^Up::F24 ;
  ^Down::F24 ;
  ^Left::F24 ;
  ^Right::F24 ;

  !Up::F24 ;
  !Down::F24 ;
  !Left::F24 ;
  !Right::F24 ;

  #Up::F24 ;
  #Down::F24 ;
  #Left::F24 ;
  #Right::F24 ;

  Numpad0::F24 ;
  Numpad1::F24 ;
  Numpad2::F24 ;
  Numpad3::F24 ;
  Numpad4::F24 ;
  Numpad5::F24 ;
  Numpad6::F24 ;
  Numpad7::F24 ;
  Numpad8::F24 ;
  Numpad9::F24 ;

  +Numpad0::F24 ;
  +Numpad1::F24 ;
  +Numpad2::F24 ;
  +Numpad3::F24 ;
  +Numpad4::F24 ;
  +Numpad5::F24 ;
  +Numpad6::F24 ;
  +Numpad7::F24 ;
  +Numpad8::F24 ;
  +Numpad9::F24 ;

  ^Numpad0::F24 ;
  ^Numpad1::F24 ;
  ^Numpad2::F24 ;
  ^Numpad3::F24 ;
  ^Numpad4::F24 ;
  ^Numpad5::F24 ;
  ^Numpad6::F24 ;
  ^Numpad7::F24 ;
  ^Numpad8::F24 ;
  ^Numpad9::F24 ;

  !Numpad0::F24 ;
  !Numpad1::F24 ;
  !Numpad2::F24 ;
  !Numpad3::F24 ;
  !Numpad4::F24 ;
  !Numpad5::F24 ;
  !Numpad6::F24 ;
  !Numpad7::F24 ;
  !Numpad8::F24 ;
  !Numpad9::F24 ;

  #Numpad0::F24 ;
  #Numpad1::F24 ;
  #Numpad2::F24 ;
  #Numpad3::F24 ;
  #Numpad4::F24 ;
  #Numpad5::F24 ;
  #Numpad6::F24 ;
  #Numpad7::F24 ;
  #Numpad8::F24 ;
  #Numpad9::F24 ;

  NumpadAdd::F24 ;
  NumpadSub::F24 ;
  NumpadMult::F24 ;
  NumpadDiv::F24 ;

  +NumpadAdd::F24 ;
  +NumpadSub::F24 ;
  +NumpadMult::F24 ;
  +NumpadDiv::F24 ; 

  ^NumpadAdd::F24 ;
  ^NumpadSub::F24 ;
  ^NumpadMult::F24 ;
  ^NumpadDiv::F24 ; 

  !NumpadAdd::F24 ;
  !NumpadSub::F24 ;
  !NumpadMult::F24 ;
  !NumpadDiv::F24 ; 

  #NumpadAdd::F24 ;
  #NumpadSub::F24 ;
  #NumpadMult::F24 ;
  #NumpadDiv::F24 ; 

  NumpadDot::F24 ; 
  NumpadEnter::F24 ;
  
  +NumpadDot::F24 ; 
  +NumpadEnter::F24 ;
  
  ^NumpadDot::F24 ; 
  ^NumpadEnter::F24 ;
  
  !NumpadDot::F24 ; 
  !NumpadEnter::F24 ;
  
  #NumpadDot::F24 ; 
  #NumpadEnter::F24 ;
  
  NumpadLeft::F24 ;
  NumpadRight::F24 ;
  NumpadDown::F24 ;
  NumpadUp::F24 ;
  
  +NumpadLeft::F24 ;
  +NumpadRight::F24 ;
  +NumpadDown::F24 ;
  +NumpadUp::F24 ;
  
  ^NumpadLeft::F24 ;
  ^NumpadRight::F24 ;
  ^NumpadDown::F24 ;
  ^NumpadUp::F24 ;
  
  !NumpadLeft::F24 ;
  !NumpadRight::F24 ;
  !NumpadDown::F24 ;
  !NumpadUp::F24 ;
  
  #NumpadLeft::F24 ;
  #NumpadRight::F24 ;
  #NumpadDown::F24 ;
  #NumpadUp::F24 ;

  NumpadPgdn::F24 ;
  NumpadPgup::F24 ;
  NumpadHome::F24 ;
  NumpadEnd::F24 ;

  +NumpadPgdn::F24 ;
  +NumpadPgup::F24 ;
  +NumpadHome::F24 ;
  +NumpadEnd::F24 ;

  ^NumpadPgdn::F24 ;
  ^NumpadPgup::F24 ;
  ^NumpadHome::F24 ;
  ^NumpadEnd::F24 ;

  !NumpadPgdn::F24 ;
  !NumpadPgup::F24 ;
  !NumpadHome::F24 ;
  !NumpadEnd::F24 ;

  #NumpadPgdn::F24 ;
  #NumpadPgup::F24 ;
  #NumpadHome::F24 ;
  #NumpadEnd::F24 ;
  
  Numpaddel::F24 ;
  NumpadIns::F24 ;
  NumpadClear::F24 ;

  +Numpaddel::F24 ;
  +NumpadIns::F24 ;
  +NumpadClear::F24 ;

  ^Numpaddel::F24 ;
  ^NumpadIns::F24 ;
  ^NumpadClear::F24 ;

  !Numpaddel::F24 ;
  !NumpadIns::F24 ;
  !NumpadClear::F24 ;

  #Numpaddel::F24 ;
  #NumpadIns::F24 ;
  #NumpadClear::F24 ;

  NumLock::F24 ;
  +NumLock::F24 ;
  ^NumLock::F24 ;
  !NumLock::F24 ;
  #NumLock::F24 ;

  ; ///////////////////////////
  ; End 60 % keyboard blocking
  ; ///////////////////////////

  ;////////////////////////////////////////////////////////////
  ; Blocked keys for 40 % keyboard.
  ;
  ; The following keys groups were made inactive:
  ; - Same as 60% mentioned above
  ; - Top row nummeric keys and +  and -. 
  ;
  ; The ~ or backtick and the backspace aren not yet blocked. THese require sensible remapping first.
  ;
  ; The above keys and these keys in combination with a single modifier, Shift, Control, Alt or Windows are blocked.
  ; I did not bother with removing them with combined modifiers. 
  ; 
  ;////////////////////////////////////////////////////////////

  0::F24 ;
  1::F24 ;
  2::F24 ;
  3::F24 ;
  4::F24 ;
  5::F24 ;
  6::F24 ;
  7::F24 ;
  8::F24 ;
  9::F24 ;

  -::F24 ;
  =::F24 ;

  +0::F24 ;
  +1::F24 ;
  +2::F24 ;
  +3::F24 ;
  +4::F24 ;
  +5::F24 ;
  +6::F24 ;
  +7::F24 ;
  +8::F24 ;
  +9::F24 ;

  +-::F24 ;
  +=::F24 ;

  ^0::F24 ;
  ^1::F24 ;
  ^2::F24 ;
  ^3::F24 ;
  ^4::F24 ;
  ^5::F24 ;
  ^6::F24 ;
  ^7::F24 ;
  ^8::F24 ;
  ^9::F24 ;

  ^-::F24 ;
  ^=::F24 ;


  !0::F24 ;
  !1::F24 ;
  !2::F24 ;
  !3::F24 ;
  !4::F24 ;
  !5::F24 ;
  !6::F24 ;
  !7::F24 ;
  !8::F24 ;
  !9::F24 ;

  !-::F24 ;
  !=::F24 ;

  #0::F24 ;
  #1::F24 ;
  #2::F24 ;
  #3::F24 ;
  #4::F24 ;
  #5::F24 ;
  #6::F24 ;
  #7::F24 ;
  #8::F24 ;
  #9::F24 ;

  #-::F24 ;
  #=::F24 ;

  Esc::F24 ;
  Backspace:: F24 ;

  +Esc::F24 ;
  +Backspace:: F24 ;

  ^Esc::F24 ;
  ^Backspace:: F24 ;

  !Esc::F24 ;
  !Backspace:: F24 ;

  #Esc::F24 ;
  #Backspace:: F24 ;

  ; ///////////////////////////
  ; End 40 % keyboard blocking
  ; ///////////////////////////


$LControl:: ; short tap trigger
  Send,{LControl Down} 
  KeyWait, LControl, t0.15 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, LControl
  }
  Else If(A_PriorKey = "LControl") { ;check prior key
    SetLayer(0)
  }
  Send,{LControl Up}
  Return

$Lshift:: ; short tap trigger
  Send,{Lshift Down} 
  KeyWait, Lshift, t0.15 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, Lshift
  }
  Else If(A_PriorKey = "LShift") { ;check prior key
    SetLayer(1)
  }
  Send,{Lshift Up}
  Return

$Rshift:: ; short tap trigger
  Send,{Rshift Down} 
  KeyWait, Rshift, t0.2 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, Rshift
  }
  Else If(A_PriorKey = "Rshift") { ;check prior key
    If (kbd_layer!=2) {
      SetLayer(2)
    }
    Else{
      SetLayer(3)
    }
  }
  Send,{Rshift Up}
  Return

;//////////////////////////////////////////////////////////////
; layer 0 commands
;//////////////////////////////////////////////////////////////
#If kbd_layer=0

return ; end kbd_layer= 1

;//////////////////////////////////////////////////////////////
; layer 1 commands
;//////////////////////////////////////////////////////////////
#If kbd_layer=1
  !u::
  Send, {LAlt Up}{LButton Down}
  KeyWait, u ; for drag
  Send, {LButton Up}{LAlt Down}
  return  
  !o::Send, {LAlt Up}{RButton}{LAlt Down}
  !p::Send, {LAlt Up}{MButton}{LAlt Down}
  !y::Send, {LAlt Up}{WheelUp}{LAlt Down}
  !h::Send, {LAlt Up}{WheelDown}{LAlt Down}
  
  !j:: ; left mouse
  !i:: ; up
  !k:: ; down
  !l:: ; right
  global mouse_move_last
  global mouse_move_distance
  mouse_move_interval := A_TickCount - mouse_move_last
  ;ToolTip, %mouse_move_distance% . %mouse_move_last% . %mouse_move_interval%
  If(mouse_move_interval < 100)   {
    if(mouse_move_distance  < mouse_move_max_distance){
      mouse_move_distance := (mouse_move_max_distance-mouse_move_distance)*mouse_move_accelation_ratio + mouse_move_distance  
    }
  } Else If(mouse_move_interval < 300)   {
    mouse_move_distance := mouse_move_distance*2
  } Else {
    mouse_move_distance := mouse_move_distance_start
  }
    
  mouse_move_x := GetKeyState("l","P")*mouse_move_distance -GetKeyState("j","P")*mouse_move_distance 
  mouse_move_y := GetKeyState("k","P")*mouse_move_distance -GetKeyState("i","P")*mouse_move_distance 
  MouseMove, %mouse_move_x%, %mouse_move_y% , 0, R
  mouse_move_last := A_TickCount
  return
  
  e::=
  s::*
  d::/
  r::-
  f::+
  t::(
  g::)
  
  i::Up
  k::Down
  j::Left
  l::Right
  y::Home
  u::End
  p::PgUp
  o::PgDn 
  7::PrintScreen
  h::Backspace
  n::Delete
  m::AppsKey
  
  q::Escape
  '::Escape

return ; end kbd_layer= 1

;//////////////////////////////////////////////////////////////
; layer 2 commands
;//////////////////////////////////////////////////////////////

#If kbd_layer=2
q::F1
w::F2
e::F3
r::F4
t::F5
y::F6
u::F7
i::F8
o::F9
p::F10
[::F11
]::F12

a::1
s::2
d::3
f::4
g::5
h::6
j::7
k::8
l::9
SC027::0 ; ';' key
'::Escape

+a::!
+s::@
+d::#
+f::$
+g:: Send, `% ; '%' percent sign
+h::^
+j::&
+k::*

z::`
x::~
c::+
v::\
b::(
n::)
m::-
,::=
.::|

return ; end kbd_layer= 2


;//////////////////////////////////////////////////////////////
; layer 3 commands
;//////////////////////////////////////////////////////////////

#If kbd_layer=3
8::NumpadDiv
9::NumpadMult
0::NumpadSub
u::Numpad7
i::Numpad8
o::Numpad9
p::NumpadAdd
j::Numpad4
k::Numpad5
l::Numpad6
SC027::NumpadEnter ; ';' key
m::Numpad1
,::Numpad2
.::Numpad3
/::NumpadDot
Space::Numpad0

return ; end kbd_layer= 3