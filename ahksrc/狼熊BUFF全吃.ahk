
BCry         =   e      ;战争狂啸晕怪
BShout       =   r      ;战斗怒吼降防
Switchweapon =   x      ;切主副手
OpenCube     =   n      ;开方块
Metawerewolf    = 8     ;变狼
MetaBear        = 9     ;变熊
Attack          = a     ;普通攻击

Isrunning  =  false


#IfWinActive,  ahk_exe D2R.exe
$F1::
if Isrunning = True
    {
        Return
    }   
Isrunning  =  True

        send, {%BCry%}           ; 战争狂啸
        sleep, 500

        send, {%BShout%}           ; 战吼，减防
        sleep, 500

        send, {%Switchweapon%}           ; 切武器
        sleep, 500

        send, {%OpenCube%}           ; 打开盒子快捷键，需要自己设一下
        sleep, 10

        BlockInput, MouseMove

        MouseMove, 366, 427 ,        ;装备变形头，坐标根据自己的屏幕定。
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        sleep, 30
        BlockInput, MouseMoveoff

        send, {space}              ;清屏
        sleep, 10
        send, {%MetaBear%}                   ; 变熊
        sleep, 500

        MouseMove, 1026, 476,,    ;开始普通攻击
        sleep, 10

        loop, 6
            {
        send, {%Attack%}
        Sleep, 200
            }
        sleep, 200

        send, {%MetaBear%}                   ; 变人
        sleep, 500

        send, {%BCry%}                   ; 晕怪
        sleep, 500

        send, {%OpenCube%}
        sleep, 10

        BlockInput, MouseMove
        MouseMove, 366, 523 ,        ;装备狼嚎
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        
        sleep, 30

        send, {space}              ;清屏
        sleep, 50

        send, {%Metawerewolf%}                   ; 变狼
        sleep, 500

        send, {%OpenCube%}
        sleep, 10

        MouseMove, 366, 523 ,        ;装备变形
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        sleep, 30
        BlockInput, MouseMoveoff

        send, {space}
        sleep, 10

        MouseMove, 1026, 476,           ;鼠标在人物右侧一点点
        sleep, 10

        loop, 6
            {
        send, {%Attack%}
        Sleep, 200
            }
        sleep, 200

        send, {%MetaBear%}                      ;变形成人
        sleep, 500

        send, {%BCry%}                        ; 战争狂啸
        sleep, 500

        send, {%OpenCube%}
        sleep, 10

        BlockInput, MouseMove
        MouseMove, 366, 427 ,        ;装备CB头。
        send, {shift down}
        send, {LButton}
        send, {shift Up}
        sleep, 30
        BlockInput, MouseMoveoff

        send, {space}               ;清屏
        sleep, 10  

        send, {%Switchweapon%}
        sleep, 500

        MouseMove, 950, 450, 

        Isrunning  =  false

        Return