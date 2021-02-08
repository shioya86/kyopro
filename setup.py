import sys
import platform
import os
import subprocess

supported_languages = [ 'D', 'Python', 'C++' ]
extensions = {'D':'d', 'C':'c', 'Kotlin':'kt', 'C++':'cpp', 'Python':'py'}

exe_cwd = os.getcwd()

def create_files(_lang, _order, _problem_num):
    if _lang in extensions:
        extension = extensions[_lang]
    else:
        print( 'error: Unsupported programming language.' )
        exit()
    for i in range( int(_problem_num) ):
        new_order = '{}{}.{}'.format(_order, chr(ord('A')+i), extension)
        subprocess.run(new_order, shell=True, cwd=os.getcwd())

def create_desktop_path():
    desktop_path = ''
    if platform.system() == 'Windows' :
        desktop_path = os.getenv("HOMEDRIVE") + os.getenv("HOMEPATH") + "\\Desktop"
    else:
        print('error: Unsupported OS.')
        exit()
    return desktop_path

def input_default(default):
    res = input()
    return default if res=='' else res

if __name__ == '__main__':
    print( 'input your project information.\n')

    print( 'File path? ({})'.format( create_desktop_path() ), end=' ')
    file_path = input_default( create_desktop_path() )

    for i, elm in enumerate(supported_languages):
        print( '({}) {} {}'.format(i, elm, '(default)' if i==0 else '') )
    print( 'Programming language?', end=' ' )
    use_lang = input_default('D')

    print( 'Contest name? (tasks)', end=' ' )
    outdir = input_default('tasks')

    print( 'Number of problems in the contest? (6)', end=' ')
    problem_num = input_default(6)

    print( 'making competitive programming project.')

    # 解答テンプレートの挿入
    if platform.system() == 'Windows':
        # For Windows OS
        order = 'mkdir {}\\{}'.format(file_path, outdir)
        subprocess.run(order, shell=True) # make target directory

        order = 'del /Q {}\\{}\\'.format(file_path, outdir)
        subprocess.run(order, shell=True) # delete prev submission files

        template_path = 'template\\main.{}'.format( extensions[use_lang] )
        out_path = '{}\\{}\\'.format(file_path, outdir)
        order = 'copy {} {}'.format(template_path, out_path)
        create_files(_lang=use_lang, _order=order, _problem_num=problem_num)
    else:
        print('error: Unsupported OS.')

    print('Done')
