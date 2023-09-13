
void init() {

}

void solve() {

}

void main() {
  init;
  solve;
}


import std;
const long MOD = 10^^9+7;

// input
void inarr (T)(ref T[] arr){ arr = readln.split.to!(T[]); }
T[] inarr (T)() { return readln.split.to!(T[]); }
void inelm (L...)(ref L A) { auto l=readln.split;foreach(i,T;L)A[i]=l[i].to!T; }
void appendElm (L...)(ref L A) { auto l=readln.split;foreach(i,T;L)A[i]~=l[i].to!(typeof(A[i].front)); }
void instr(ref string s) { s=readln.chomp; }
string instr() { return readln.chomp; }
// utils
bool chmin (T)(ref T a, const T b) { if(a>b) {a=b; return true;} return false; }
bool chmax (T)(ref T a, const T b) { if(a<b) {a=b; return true;} return false; }
bool isEven (T)(T a) { return a%2==0; }
bool isOdd (T)(T a) { return a&1; }
// data structure
alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
class UnionFind {
  int[] par, rank, cnt;
  this(int n) { par.length=rank.length=cnt.length=n;cnt[]=1;foreach(i;0..n)par[i]=i; }
  int find(int x) { if(par[x] == x)return x;else return par[x]=find(par[x]); }
  void unite(int x, int y) { x=find(x);y=find(y);if(x==y)return;if(rank[x]<rank[y]){par[x]=y;cnt[y]+=cnt[x];}else{par[y]=x;cnt[x]+=cnt[y];if(rank[x]==rank[y])rank[x]++;} }
  bool isSame(int x, int y) { return find(x) == find(y); }
  int size(int x) { return cnt[find(x)]; }
}
alias mint = ModInt!(MOD);
struct ModInt (long M) { 
  private long n;
  this(T)(T n) { this.n = n % M; }
  auto opUnary (string op: "++")() { this.n = sum(this.get, 1); return this; }
  auto opUnary (string op: "--")() { this.n = sub(this.get, 1); return this; }
  void opAssign (long r) { this.n = r; }
  void opOpAssign (string op: "*")(ModInt r) { this.n = mul(this.get, r.n); }
  void opOpAssign (string op: "+")(ModInt r) { this.n = sum(this.get, r.n); }
  void opOpAssign (string op: "-")(ModInt r) { this.n = sub(this.get, r.n); }
  auto opOpAssign (string op)(long r) { return this.opOpAssign!op( ModInt(r) ); }
  auto opBinary (string op: "+")(ModInt r) { return ModInt(sum(this.get, r.n)); }
  auto opBinary (string op: "-")(ModInt r) { return ModInt(sub(this.get, r.n)); }
  auto opBinary (string op: "*")(ModInt r) { return ModInt(mul(this.get, r.n)); }
  auto opBinary (string op: "/")(ModInt r) { return ModInt(div(this.get, r.n)); }
  auto opBinary (string op: "^^")(ModInt r) { return ModInt(pow(this.get, r.n)); }
  auto opBinary (string op)(long r) { return this.opBinary!op(ModInt(r)); }
  auto opBinaryRight (string op)(long l) { return ModInt(l).opBinary!op(this); }
  long get () { return this.n; }
  long sum (long l, long r) { return (l + r) % M; } long sub (long l, long r) { return (l + M - r) % M; }
  long div (long l, long r) { return (l * pow(r, M - 2)) % M; } long mul (long l, long r) { return (l * r) % M; }
  long pow (long l, long r) { if (r == 1) return l; if (r & 1) return (l * pow(l, r - 1)) % M; return pow(l, r/2)^^2 % M; }
}
// algorithm
class Dijkstra {
  struct Edge { uint to; long cost; }
  struct P { long dist; uint vt; }
  uint V; Edge[][] G; long[] d; PQueue!(P, "a.dist>b.dist") que;
  this (uint n) { V = n; G.length = n; d.length = n; }
  void insertEdge (uint s, uint t, long cost) { G[s] ~= Edge(t, cost); }
  void run (uint s) { initBeforeRun(s);while(!que.empty()){P p=que.removeAny;if(d[p.vt]<p.dist)continue;foreach(e;G[p.vt]){updateDist(p.vt, e);}} }
  private void initBeforeRun (uint s) { d[0..$] = long.max; d[s] = 0; que.clear; que.insert(P(0, s)); }
  private void updateDist (uint v, Edge e) { if(d[e.to]>d[v]+e.cost){d[e.to]=d[v]+e.cost;que.insert(P(d[e.to],e.to));} }
}
class Combination {
  private long[] f; private long m = MOD; private long len = 2_010_101;
  this () { this.f=new long[](len);f[0]=1;foreach(i; 1..len) f[i] = (f[i - 1] * i)%m; }
  mint nCk (long n, long k) { mint a=f[n];mint b=f[n-k];mint c=f[k];mint bc=b*c;return a/bc; }
  mint nHk (long n, long k) { if(k<0)return mint(0);mint a=f[n+k-1];mint b=f[k];mint c=f[n-1]; mint bc=b*c; return a/bc; }
}
