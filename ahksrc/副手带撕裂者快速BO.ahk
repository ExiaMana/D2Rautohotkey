;CTA放在物品栏右上角。
;初始状态为，主手拿弓。副手放点灯用的撕裂者。
;触发键按一次，自动进行如下操作：切副手，换CTA，BC，BC，BO，换撕裂者，切回主手

#IfWinActive,  ahk_exe D2R.exe

Isrunning = False
$F1::

if Isrunning =True
         {
        Return
        }
Isrunning = True

        send, {x}           ; 切副手
        sleep, 300
        send, {b}

        BlockInput, MouseMove
        MouseMove, 1707, 624         ;换上CTA
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        BlockInput, MouseMoveoff
        send, {b}

        send, {y}           ; BC
        sleep, 500
        send, {y}           ; BC
        sleep, 500
        send, {h}           ; BO
        sleep, 500


        send, {b}
        BlockInput, MouseMove
        MouseMove,  1707, 624         ;换上撕裂者
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        BlockInput, MouseMoveoff
        send, {x}           
        send, {b}

Isrunning = False
Return