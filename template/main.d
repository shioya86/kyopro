
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

alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
string instr() { return readln.chomp; }
T inone(T=int)(){return readln.chomp.to!T;}
void inelm(L...)(ref L A){ auto l = readln.split; foreach(i, T; L) A[i]=l[i].to!T; }
void appendElm(L...)(ref L A){ auto l = readln.split; foreach(i, T; L) A[i]~=l[i].to!(typeof(A[i].front)); }
T[] inarr (T = int)(){ return readln.split.to!(T[]); }
T toNum (T=int)(char c){ return (c-'0').to!T; }
bool chmin (T=long)(ref T a, const T b) { if(a>b) {a=b; return true;} return false; }
bool chmax (T=long)(ref T a, const T b) { if(a<b) {a=b; return true;} return false; }

class UnionFind {
  int[] par, rank;
  this(int n) { par.length = rank.length = n; foreach(i; 0..n) par[i] = i; }
  int find(int x) { if (par[x] == x) return x; else return par[x] = find(par[x]); }
  void unite(int x, int y) {
    x = find(x); y = find(y);
    if (x==y) return;
    if (rank[x] < rank[y]) par[x] = y;
    else { par[y] = x; if (rank[x] == rank[y]) rank[x]++; }
  }
  bool same(int x, int y) { return find(x) == find(y); }
}

double degToRad(double degree) { return degree * PI / 180.0; }

double radToDeg(double radian) { return radian * 180.0 / PI; }

T getDigitLen(T)(T n) { return n.to!string.length; }

T getSumDigit(T)(T n) {
	T ret;
	foreach(e; n.to!string) ret += e - '0';	
	return ret;
}

string zfill (string str, int num) {
  if (num <= str.length) return str;
  return "0".repeat(num-str.length).join ~ str;
}

long factorial(long n, long mod=MOD) {
  if (n == 0) return 1;
  return n*factorial(n-1) % mod;
}

Tuple!(long, long)[] primeFactorize (long n) {
  Tuple!(long, long)[] res;
  for (long p=2; p*p <= n; ++p) {
    if ( n%p ) continue;
    int num;
    while ( n%p == 0 ) { ++num; n/=p; }
    res ~= Tuple!(long, long)(p, num);
  }
  if (n != 1) res ~= Tuple!(long, long)(n, 1);
  return res;
}

long[] divisor (long n) {
  long[] res;
  for (int i=1; 1L*i^^2 <= n; ++i) if (n%i == 0) {
    res ~= i;
    if (i*i != n) res ~= (n/i);
  }
  return res;
}
