void main(){

}
     
import std;
const long mod = 10^^9+7;
const long inf = 10L^^18+1;

alias instr = () => readln.chomp;
T inone(T=int)(){return readln.chomp.to!T;}
void inelm(L...)(ref L A){ auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }
T[] inarr(T = int)(){ return readln.split.to!(T[]); }
int convert_num(T=int)(char c){ return (c-'0').to!T; }
