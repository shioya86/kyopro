#!/usr/bin/env python3
import sys
import platform
import os
import subprocess

supported_languages = [ 'D', 'Python', 'C++' ]
extensions = {'D':'d', 'C':'c', 'Kotlin':'kt', 'C++':'cpp', 'Python':'py'}

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
    elif platform.system() == 'Linux' :
        desktop_path = os.getenv('HOME') + '/Desktop'
    else:
        exit()
    return desktop_path

def input_default(default):
    res = input()
    return default if res=='' else res

if __name__ == '__main__':
    print( 'input your project information.\n')

    print( 'File path? ({})'.format( os.getcwd() ), end=' ')
    file_path = input_default( os.getcwd() )

    for i, elm in enumerate(supported_languages):
        print( '({}) {} {}'.format(i, elm, '(default)' if i==0 else '') )
    print( 'Programming language?', end=' ' )
    in_num = input_default(0)
    use_lang = supported_languages[ int(in_num) ] 
    print( 'Contest name? (tasks)', end=' ' )
    outdir = input_default('tasks')

    print( 'Number of problems in the contest? (6)', end=' ')
    problem_num = input_default(6)

    print( 'making competitive programming project.')

    # 解答テンプレートの挿入
    if platform.system() == 'Windows':
        # For Windows OS
        order = 'mkdir {}\\{}'.format(os.getcwd(), outdir)
        subprocess.run(order, shell=True) # make target directory

        order = 'del /Q {}\\{}\\'.format(os.getcwd(), outdir)
        subprocess.run(order, shell=True) # delete prev submission files

        template_path = '{}\\template\\main.{}'.format( 
                os.path.dirname(__file__),
                extensions[use_lang] )
        out_path = '{}\\{}\\'.format(os.getcwd(), outdir)
        order = 'copy {} {}'.format(template_path, out_path)
        create_files(_lang=use_lang, _order=order, _problem_num=problem_num)
    elif platform.system() == 'Linux':
        order = 'mkdir {}/{}'.format(os.getcwd(), outdir)
        subprocess.run(order, shell=True)

        order = 'rm {}/{}/*'.format(os.getcwd(), outdir)
        subprocess.run(order, shell=True)

        template_path = '{}/template/main.{}'.format(
                os.path.dirname(__file__),
                extensions[use_lang] )
        out_path = '{}/{}/'.format(os.getcwd(), outdir)
        order = 'cp {} {}'.format(template_path, out_path)
        create_files(_lang=use_lang, _order=order, _problem_num=problem_num)

    else:
        print('error: Unsupported OS.')

    print('Done')
