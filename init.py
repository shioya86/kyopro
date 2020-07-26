import os
import sys
import subprocess
if __name__ == '__main__':
    args = sys.argv
    # 解答テンプレートの挿入
    for i in range( 6 ):
        subprocess.run('cp {} {}/{}.d'.format(sys.argv[1], sys.argv[2], chr(ord('A')+i)), shell=True )
