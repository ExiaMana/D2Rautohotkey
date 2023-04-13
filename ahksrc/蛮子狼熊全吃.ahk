#IfWinActive,  ahk_exe D2R.exe
$F1::    
        send, {e}           ; 战争狂啸
        sleep, 500

        send, {r}           ; 战吼，减防
        sleep, 500

        send, {x}           ; 切武器去副手
        sleep, 500

        send, {n}           ; 打开盒子快捷键，需要自己设一下
        sleep, 10

        MouseMove, 366, 427 ,        ;装备变形头，坐标根据自己的屏幕定。
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        sleep, 300

        send, {space}               ;清屏
        sleep, 10
        send, {9}                   ; 变熊
        sleep, 500

        MouseMove, 1026, 476,,    ;开始普通攻击
        sleep, 10

        loop, 6
            {
        send, {a}               ;普通攻击设置快捷键为 a
        Sleep, 200
            }
        sleep, 200

        send, {9}                   ; 变人
        sleep, 500

        send, {e}                   ; 晕怪
        sleep, 500

        send, {n}                    ; 打开盒子快捷键，需要自己设一下
        sleep, 10

        MouseMove, 366, 427 ,        ;装备你自己喜欢的头。
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        sleep, 300

        send, {space}               ;清屏
        sleep, 10  

        send, {x}                   ;切武器回主手
        sleep, 500

        MouseMove, 950, 450,        ;鼠标回到屏幕中间
 