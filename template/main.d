

void solve() {

}

void main() {
  // 入力

  // 前処理
  init();

  // 解答
  solve();
}

void init() {

}

import std;
const long MOD = 10^^9+7;

alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
string instr() { return readln.chomp; }
T inone(T=int)(){return readln.chomp.to!T;}
void inelm(L...)(ref L A){ auto l = readln.split;
  foreach(i, T; L) A[i]=l[i].to!T; }
void appendElm(L...)(ref L A){ auto l = readln.split;
  foreach(i, T; L) A[i]~=l[i].to!(typeof(A[i].front));
}
T[] inarr(T = int)(){ return readln.split.to!(T[]); }
T convn(T=int)(char c){ return (c-'0').to!T; }
bool chmin(T=long)(ref T a, const T b) { if(a>b) {a=b; return true;} return false; }
bool chmax(T=long)(ref T a, const T b) { if(a<b) {a=b; return true;} return false; }

class UnionFind {
  int[] par, rank;
  this(int n) { par.length = rank.length = n; foreach(i; 0..n) par[i] = i; }
  int find(int x) { if (par[x] == x) return x; else return par[x] = find(par[x]); }
  void unite(int x, int y) 
  {
    x = find(x); y = find(y);
    if(x==y) return;
    if(rank[x] < rank[y]) par[x] = y;
    else { par[y] = x; if (rank[x] == rank[y]) rank[x]++; }
  }
  bool same(int x, int y) { return find(x) == find(y); }
}

double degToRad(double degree) {
  return degree * PI / 180.0;
}

double radToDeg(double radian) {
  return radian * 180.0 / PI;
}

T getSumDigit(T=long)(T N) {
	T ret;
	foreach(e; N.to!string) {
		ret += e - '0';	
	}
	return ret;
}

