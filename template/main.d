void main()
{

}
     
import std;
const long mod = 10^^9+7;
const long inf = 10L^^18+1;

alias instr = () => readln.chomp;
T inone(T=int)(){return readln.chomp.to!T;}
void inelm(L...)(ref L A){ auto l = readln.split;
	foreach(i, T; L) A[i]=l[i].to!T; }
T[] inarr(T = int)(){ return readln.split.to!(T[]); }
int c2i(char c){ return c.to!string.to!int; }

// Prime factorization
long[long] primeFactorize(long n)
{
	long[long] res;
	for(long i=2; i*i <= n; i++)
	{
		if(n%i != 0) continue;
		long tmp;
		while(n%i==0)
		{
			tmp++;
			n /= i;
		}
		res[i] += tmp;
	}
	if( n!=1 ) res[n]++; 
	return res;
}
