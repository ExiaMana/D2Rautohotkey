import tkinter as tk
import json
import subprocess
import gettext

class GUI:
    def __init__(self, master):
        self.master = master
        # self.translate = gettext.translation('gui', localedir='locales',languages=['en','zh_CN'])
        master.title("D2R鼠标宏配置工具")

        # 创建标签、文本框和保存按钮
        self.label1 = tk.Label(master, text="炮轰:")
        self.label1.grid(row=0, column=0)
        self.entry1 = tk.Entry(master)
        self.entry1.grid(row=0, column=1)

        self.label2 = tk.Label(master, text="切换武器:")
        self.label2.grid(row=1, column=0)
        self.entry2 = tk.Entry(master)
        self.entry2.grid(row=1, column=1)

        self.save_button = tk.Button(master, text="保存", command=self.save_config)
        self.save_button.grid(row=2, column=0)

        # 创建脚本一和脚本二的按钮
        self.script1_button = tk.Button(master, text="一键换手点灯", command=lambda: self.run_script('script1.exe'))
        self.script1_button.grid(row=3, column=0)

        self.script2_button = tk.Button(master, text="跑跑随心飞", command=lambda: self.run_script('script2.exe'))
        self.script2_button.grid(row=3, column=1)

        # 读取最新的配置文件
        try:
            with open('config.json', 'r') as f:
                config = json.load(f)
                self.entry1.insert(0, config['炮轰'])
                self.entry2.insert(0, config['切换武器'])
        except:
            pass

    # 将当前参数保存到配置文件中
    def save_config(self):
        config = {'skill1': self.entry1.get(), 'skill2': self.entry2.get()}
        with open('config.json', 'w') as f:
            json.dump(config, f)

    # 运行指定的脚本程序
    def run_script(self, script):
        subprocess.Popen(script)

root = tk.Tk()
gui = GUI(root)
root.mainloop()
