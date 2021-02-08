import sys
import platform
import os
import subprocess

extensions = {'d':'d', 'c':'c', 'kotlin':'kt', 'c++':'cpp', 'python':'py'}
os_win = ['Windows', 'windows', 'win', 'Win']
os_linux = ['Linux', 'linux', 'bash', 'Ubuntu', 'ubuntu']
os_mac = ['Mac', 'mac']
exe_cwd = os.getcwd()
os_name = platform.system()

print(os_name)
def create_files(_lang, _order):
    if lang in extensions:
        extension = extensions[lang]
    else:
        print( 'No such programming language' )
        exit()
    for i in range(6):
        new_order = '{}{}.{}'.format(_order, chr(ord('A')+i), extension)
        subprocess.run(new_order, shell=True, cwd=exe_cwd)

def create_desktop_path(os_name):
    desktop_path = ''
    if os_name in os_win:
        desktop_path = os.getenv("HOMEDRIVE") + os.getenv("HOMEPATH") + "\\Desktop"
    elif platform.system() in os_linux:
        desktop_path = ''
    elif platform.system() in os_mac:
        desktop_path = ''
    return desktop_path

def input_default(default):
    res = input()
    return default if res=='' else res

if __name__ == '__main__':
    platform.system()
    print( '!input your project information')
    print( 'File path?', end=' ')
    path = input_default( create_desktop_path(platform.system()) )
    print( '(1) D (default) \n(2) Python \n(3) C++')
    print( 'Programming language?', end=' ' )
    lang = input_default('d')
    print( 'Contest name?', end=' ')
    outdir = input_default('kyopro-proj')
    if lang in extensions:
        extension = extensions[lang]
    else:
        print('This language is not registered')
        exit()

    print( 'making competitive programming project ...')

    # 解答テンプレートの挿入
    if platform.system() in os_win:
        # For Windows OS
        order = 'mkdir {}\\{}'.format(path, outdir)
        subprocess.run(order, shell=True) # make target directory

        order = 'del /Q {}\\{}\\'.format(path, outdir)
        subprocess.run(order, shell=True) # delete prev submission files

        template_path = 'template\\main.{}'.format(extension)
        out_path = '{}\\{}\\'.format(path, outdir)
        order = 'copy {} {}'.format(template_path, out_path)
        create_files(_lang=lang, _order=order)

    elif platform.system() in os_linux:
        # For Linux OS bash
        print('[error]Unimplemented')
        exit()

    elif platform.system() in os_mac:
        # For Mac OS
        print('[error]Unimplemented')
        exit()

    print('Done')
