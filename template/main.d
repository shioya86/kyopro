void solve(){
}

void main(){
}
     
import std;
const long mod = 10^^9+7;
const long inf = 10L^^18+1;

alias Tuple!(int, "l", int, "r") Pair;
Pair mkPair(int[] lr){ Pair p; p.l=lr[0]; p.r=lr[1]; return p; }

alias instr = () => readln.chomp;
T inelm(L...)(ref L A){ auto l = readln.split; 
	foreach(i, T; L) A[i]=l[i].to!T; }
T[] inarr(T = int)(){ return readln.split.to!(T[]); }
int c2i(char c){ return c.to!string.to!int; }
