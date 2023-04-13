import tkinter as tk
import configparser

# 创建主窗口
root = tk.Tk()
root.title("角色选择器")

# 添加角色按钮
roles = ["亚马逊", "野蛮人", "圣骑士", "法师", "刺客", "德鲁伊"]
for i, role in enumerate(roles):
    tk.Button(root, text=role, command=lambda r=role: select_role(r)).grid(row=i, column=0)

# 添加菜单栏
menu_bar = tk.Menu(root)
root.config(menu=menu_bar)

# 添加角色选择二级菜单
role_menu = tk.Menu(menu_bar, tearoff=0)
menu_bar.add_cascade(label="角色选择", menu=role_menu)
for role in roles:
    role_menu.add_command(label=role, command=lambda r=role: select_role(r))

# 添加设置选项二级菜单
settings_menu = tk.Menu(menu_bar, tearoff=0)
menu_bar.add_cascade(label="设置", menu=settings_menu)
settings_menu.add_command(label="当前施法速度FCR")
settings_menu.add_command(label="攻击速度FAR")
settings_menu.add_command(label="屏幕分辨率")
settings_menu.add_command(label="技能123456种键位设置")

# 读取配置文件
config = configparser.ConfigParser()
config.read("config.ini")

# 选择角色函数
def select_role(role):
    print("您选择了角色：", role)
    # 在此处添加启动exe程序模块的代码

# 运行主循环
root.mainloop()
