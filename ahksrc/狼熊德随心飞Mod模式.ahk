;下载auto hot key,  之后复制这些代码去txt， 改名.ahk,  双击运行。
; 屏幕分辨率1920x1080,   谜团放在MDK MOD提供的Mini方块里的左上角，即从左数第一二列。
; 效果是：身穿刚毅，按鼠标中键触发，自动变人换上物品栏里的谜团。
; 然后在鼠标所指位置放传送。
; 按住中键不动就一直传送。
; 松开鼠标中键时停止传送并且把刚毅换上再变回狼或熊

Teleport        = f   ;传送
SwitchWeapon    = x   ;切武器
Metawerewolf    = 8     ;变狼
MetaBear        = 9     ;变熊


Isrunning       = False

#IfWinActive,  ahk_exe D2R.exe
$MButton::
if Isrunning = True
    {
        Return
    }   
    Isrunning = True 
        MouseGetPos, X1, Y1       
        ; send, {b}           ; 打开物品栏, 基于带mini cube的MDK MOD，可以不要
        send, {%Metawerewolf%}             ;狼变人
        sleep, 640

        send, {%SwitchWeapon%}              ;切副手
        sleep, 300

        BlockInput, MouseMove
        MouseMove, 1807, 622,        ;移到物品栏装备谜团
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        ; send, {Space}                ;清屏，用MOD，不需要
        MouseMove, %X1%, %Y1%
        BlockInput, MouseMoveOff
        send, {%Teleport%}                    ;传送键，快速施法

        Loop
                {
                    if not GetKeyState("MButton", "P") 
                    break
                    Loop, 10
                    {
                        if not GetKeyState("MButton", "P") 
                        break
                        MouseGetPos, X2,Y2
                        send, {%Teleport%}
                        sleep, 80
                    }
                }
        ; send, {b}           ; 打开物品栏
        sleep, 560

        send, {%Metawerewolf%}               ;变狼

        BlockInput, MouseMove        
        MouseMove, 1807, 622,         ;移到物品栏装备刚毅或其他输出甲
        send, {shift down}
        send, {LButton}
        send, {shift Up}

        ; send, {Space}                ;清屏，用MOD，不需要
        BlockInput, MouseMoveOff
        sleep, 500
        send, {%SwitchWeapon%}              ;切回主手
        
        BlockInput, MouseMove 
        MouseMove, %X2%, %Y2%
        BlockInput, MouseMoveOff
        sleep, 500
        Isrunning       = False
        Return