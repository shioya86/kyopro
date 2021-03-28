void main(){

}
     
import std;
const long mod = 10^^9+7;
const long inf = 10L^^18+1;

alias instr = () => readln.chomp;
alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
T inone(T=int)(){return readln.chomp.to!T;}
void inelm(L...)(ref L A){ auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }
T[] inarr(T = int)(){ return readln.split.to!(T[]); }
T convn(T=int)(char c){ return (c-'0').to!T; }
bool chmin(T=long)(ref T a, const T b) { if(a>b) {a=b; return true;} return false; }
bool chmax(T=long)(ref T a, const T b) { if(a<b) {a=b; return true;} return false; }

class UnionFind {
	int[] par, rank;
	this(int n) { par.length = rank.length = n; foreach(i; 0..n) par[i] = i; }
	int find(int x) { if (par[x] == x) return x; else return par[x] = find(par[x]); }
	void unite(int x, int y) {
		x = find(x); y = find(y);
		if(x==y) return;
		if(rank[x] < rank[y]) par[x] = y;
		else { par[y] = x; if (rank[x] == rank[y]) rank[x]++; }
	}
	bool same(int x, int y) { return find(x) == find(y); }
}
