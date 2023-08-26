
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
void inarr (T = int)(ref T[] arr){ arr = readln.split.to!(T[]); }
void inelm(L...)(ref L A){ auto l = readln.split; foreach(i, T; L) A[i]=l[i].to!T; }
void appendElm(L...)(ref L A){ auto l = readln.split; foreach(i, T; L) A[i]~=l[i].to!(typeof(A[i].front)); }
void instr(ref string s) { s = readln.chomp; }
string instr() { return readln.chomp; }
// comparison
bool chmin (T=long)(ref T a, const T b) { if(a>b) {a=b; return true;} return false; }
bool chmax (T=long)(ref T a, const T b) { if(a<b) {a=b; return true;} return false; }
// data structure
alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
class UnionFind {
  int[] par, rank;
  this(int n) { par.length = rank.length = n; foreach(i; 0..n) par[i] = i; }
  int find(int x) { if (par[x] == x) return x; else return par[x] = find(par[x]); }
  void unite(int x, int y) { x = find(x); y = find(y); if (x==y) return; if (rank[x] < rank[y]) par[x] = y; else { par[y] = x; if (rank[x] == rank[y]) rank[x]++; } }
  bool same(int x, int y) { return find(x) == find(y); }
}
alias mint = ModInt!(MOD);
struct ModInt (long M) { 
  long n;
  this(T)(T n) {this.n = n%M;}
  void opUnaray (string OP)() { if (OP == "++") this.n = sum(this.n, 1); if (OP == "--") this.n = sub(this.n, 1); }
  void opOpAssign (string OP)(ModInt r) { if (OP == "+")  this.n = sum(this.n, r.n); if (OP == "-")  this.n = sub(this.n, r.n); if (OP == "*")  this.n = mul(this.n, r.n); if (OP == "/")  this.n = div(this.n, r.n); if (OP == "^^") this.n = pow(this.n, r.n); }
  void opOpAssign (string OP)(long r) { this.opOpAssign!OP( ModInt(r) ); }
  void opAssign( long r ){ this.n = r; }
  auto opBinary( string OP )( ModInt r ) { this.opOpAssign!OP(r); return this; }
  auto opBinary( string OP )( long r ){ return this.opBinary!OP( ModInt(r) ); }
  auto opBinaryRight( string OP )( long l ){ return ModInt(l).opBinary!OP(this); }
  string toString() { return this.n.to!string; }
  long sum (long l, long r) { return (l + r) % M; } long sub (long l, long r) { return (l + M - r) % M; }
  long div (long l, long r) { return (l * pow(r, M - 2)) % M; } long mul (long l, long r) { return (l * r) % M; }
  long pow (long l, long r) { if (r == 1) return l; if (r & 1) return (l * pow(l, r - 1)) % M; return pow(l, r/2)^^2 % M; }
}
