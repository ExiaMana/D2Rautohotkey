;设置按键
Strafe = w  ;炮轰
SwitchWeapon = x   ;切武器


; 设置图像路径和大小，相对路径，图片和AHK文件在同一路径下
ImagePath := A_ScriptDir . "\1.png"
; ImageWidth := 25
; ImageHeight := 25

; 设置匹配区域大小和搜索间隔时间

SX1 := 858
SY1 := 1006
W1 := 50
H1 := 50
SX2 := SX1 + W1
SY2 := SY1 + H1
Interval := 40

Isrunning = False

$XButton1::

if (Isrunning = True)
    {
        Return
    }
Isrunning = True
send, {%Strafe%}
sleep, 300

; 无限循环，直到无法找到匹配的图像
Loop , 15 
{
    ; 在指定区域内搜索匹配的图像
    ; CoordMode, Pixel, Screen    
    ImageSearch, FoundX, FoundY, %SX1%, %SY1%, %SX2%, %SY2%, *80 %ImagePath%
    
    ; 如果没找到匹配图像
    if ErrorLevel = 1 
    {
        ; 发送按键X
        Send, {%SwitchWeapon%}
        
        ; 等待指定间隔时间
        Sleep, %Interval%
    } 

    ; else if ErrorLevel = 2 
    ; {
    ;     MsgBox, "error",
    ; }

    Else
    {
        ; 如果找到匹配图像，则退出循环
        break
    }

}

sleep, 600

Loop , 5 
{
    ; 在指定区域内搜索匹配的图像
    ; CoordMode, Pixel, Screen    
    ImageSearch, FoundX, FoundY, %SX1%, %SY1%, %SX2%, %SY2%, *80 %ImagePath%
    
    ; 如果找到匹配图像
    if ErrorLevel = 0 
    {
        ; 发送按键X
        Send, {%SwitchWeapon%}
        
        ; 等待指定间隔时间
        Sleep, %Interval%
    } 
    else 
    {
        ; 如果未找到匹配图像，则退出循环
        break
    }
}


Isrunning = False
Return