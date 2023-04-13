;下载auto hot key,  之后复制这些代码去txt， 改名.ahk,  双击运行。
; 屏幕分辨率1920x1080,   谜团放在物品栏从左向右第三第四列。
; 效果是：身穿刚毅，按鼠标中键触发，自动换上物品栏里的谜团。
; 然后在鼠标所指位置放传送。
; 按住中键不动就一直传送。
; 松开鼠标中键时停止传送并且把刚毅换上


#IfWinActive,  ahk_exe D2R.exe
$MButton::    
        MouseGetPos, X1, Y1       
        send, {b}           ; 打开物品栏

        BlockInput, MouseMove
        MouseMove, 1402, 623,        ;移到物品栏装备谜团
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        send, {Space}
        BlockInput, MouseMoveOff

        MouseMove, %X1%, %Y1%
        send, {f}                    ;传送键，快速施法

        Loop
                {
                    if not GetKeyState("MButton", "P") 
                    break
                    Loop, 10
                    {
                        if not GetKeyState("MButton", "P") 
                        break
                        send, f
                        MouseGetPos, X2,Y2
                        sleep, 80
                    }
                }
        send, {b}           ; 打开物品栏
        BlockInput, MouseMove        
        MouseMove, 1402, 623,        ;移到物品栏装备刚毅
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        MouseMove, %X2%, %Y2%
        BlockInput, MouseMoveOff
        send, {Space}

        
        Return