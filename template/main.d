

void solve() {

}

void main() {
  // 入力

  // 前処理
  init();

  // 解答
  solve().witeln();
}

void init() {

}

import std;
const long mod = 10^^9+7;
const long inf = 10L^^18+1;

alias PQueue(T, alias less="a<b") = BinaryHeap!(Array!T, less);
string instr() { return readln.chomp; }
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
  void unite(int x, int y) 
  {
    x = find(x); y = find(y);
    if(x==y) return;
    if(rank[x] < rank[y]) par[x] = y;
    else { par[y] = x; if (rank[x] == rank[y]) rank[x]++; }
  }
  bool same(int x, int y) { return find(x) == find(y); }
}

struct Edge{ uint to;long cost; }
struct P{ long dist; uint vt; }
class Dijkstra {
  uint V; Edge[][] G; long[] d;
  this(uint n) { V = n; G.length = d.length = V; }
  void insert_edge(uint s, uint t, long cost) { G[s] ~= Edge(t, cost); }
  void run(uint s) {
    d[0..$] = 100_000_000_000; 
    d[s] = 0;
    PQueue!(P, "a.dist>b.dist") que; que.insert( P(0, s) );

    while(!que.empty()) {
      P p = que.removeAny; uint v = p.vt;
      if(d[v]<p.dist) continue;
      foreach(e; G[v]) {
        if(d[e.to]>d[v]+e.cost) { d[e.to] = d[v] + e.cost;
        que.insert( P(d[e.to], e.to) );
        }
      }
    }
  }
}

double DegToRad(double degree) {
  return degree * PI / 180.0;
}

double RadToDeg(double radian) {
  return radian * 180.0 / PI;
}
