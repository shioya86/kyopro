import math
x, y, a, b = map(int, input().split())

ans = 0
while x*a-x<b:
    if x*a>=y:
        break
    x*=a
    ans+=1

ans += (y-x-1)//b
print(ans)
