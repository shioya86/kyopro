# input
def instr(); gets.chomp end
def inarr(sym=:to_i); gets.split.map(&sym) end
def inone(sym=:to_i); gets.send(sym) end
# output
def printYn(flg); puts flg ? "Yes" : "No" end 
# utils
def max(*e); e.max end
def min(*e); e.min end

def init()

end

def solve()

end

def main()
  init
  solve
end

main
