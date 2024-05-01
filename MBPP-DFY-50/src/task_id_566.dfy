method SumOfDigits(number: nat) returns (sum: nat)
  requires number >= 0
  ensures sum >= 0
  ensures sum == SumDigits(number)
{
  sum := 0;
  var n: nat := number;

  // Let's find out the number of digits, which is the same as powers of ten for the given number
  ghost var ndigits := NumberOfDigits(number);
  X(number);
  assert Power10(ndigits) > number;

  ghost var PowersOfTen := seq(ndigits+1, i requires 0 <= i <= ndigits => Power10(i));
  ghost var pmax := Power10(ndigits);
  ghost var p := PowersOfTen[0];
  assert pmax == PowersOfTen[|PowersOfTen|-1];
  assert pmax > number;

  // Let's compute the values of n
  ghost var ValuesOfn := seq(ndigits+1, i requires 0 <= i <= ndigits => number / PowersOfTen[i]);
  assert forall j :: 0 < j <= ndigits ==> ValuesOfn[j] == ValuesOfn[j-1]/10;
  assert ValuesOfn[0] == number;
  //DivIsZero();
  assert ValuesOfn[|ValuesOfn|-1] == number/pmax == 0;

  assert ValuesOfn[0] == n;
  assert PowersOfTen[0] == p;
  ghost var i := 0;
  while n > 0
    //        invariant 1 <= p <= pmax
    //        invariant n in ValuesOfn
    invariant 0 <= i <= ndigits
    invariant ValuesOfn[i] == n
    invariant PowersOfTen[i] == p
    invariant sum >= 0
    invariant sum == SumDigits(number % p)
  {
    assert ValuesOfn[i] == n;
    var digit := n % 10;
    sum := sum + digit;
    n := n / 10;
    i := i + 1;
    //        assert ValuesOfn[i] == ValuesOfn[i-1]/10;
    //        assert ValuesOfn[i] == n;
    p := PowersOfTen[i]; //p * 10;
    assert n == 0 ==> p == pmax;
  }
  assert n == 0;
  //    assert i == ndigits;
  assert p == pmax;
  NumberIdentity(number, p);
  assert number == number % p;
}

//lemma DivIsZero()
//  ensures forall num, den : nat :: den >= 1 && num < den ==> num/den == 0

lemma X(x: nat)
  ensures Power10(NumberOfDigits(x)) > x
{
  if x <= 9
  {
    assert NumberOfDigits(x) == 1;
    assert Power10(NumberOfDigits(x)) == 10;
    assert Power10(NumberOfDigits(x)) > x;
  }
  else // >= 10
  {
    assert NumberOfDigits(x) >= 2;
    X(x/10);
    assert NumberOfDigits(x) == NumberOfDigits(x/10) + 1;
    assert Power10(NumberOfDigits(x)) == Power10(NumberOfDigits(x/10)) * 10;
    assert Power10(NumberOfDigits(x)) > x;
  }
}

lemma NumberIdentity(number: nat, pmax: nat)
  requires pmax == Power10(NumberOfDigits(number))
  ensures number == number % pmax
{
  if NumberOfDigits(number) == 1
  {
    assert 0 <= number <= 9;
    assert pmax == 10;
    assert number == number % pmax;
  }
  else // > 1
  {
    assert pmax == Power10(NumberOfDigits(number)) ==> pmax/10 == Power10(NumberOfDigits(number/10));
    NumberIdentity(number/10, pmax/10);
    assert number >= 10;
    assert pmax >= 100;
    assert number < pmax;
    assert forall n, m :: 0 < n < m <= pmax ==> n%m == n;
    assert number == number % pmax;
  }

}


lemma InIntValues(n: nat)
  ensures 0 in IntValues(n)
  ensures n in IntValues(n)
  ensures n/10 in IntValues(n)
{}

// ghost function ValuesOfn(number: nat, ndigits: nat) : (r: seq<nat>)
// {
//   seq(ndigits+1, i requires 0 <= i <= ndigits => number / PowersOfTen[i])
// }

ghost function IntValues(n: int) : (r: seq<int>)
  requires n >= 0
  ensures 0 in r
  ensures n in r
  ensures n/10 in r
  //    ensures forall p :: p in powersOfTen ==> n/p in r
{
  if n == 0 then [0]
  else [n] + IntValues(n/10)
}

function Power10(n: nat): (r: nat)
  ensures r >= 1
  ensures n > 0 ==> r % 10 == 0
{
  if (n == 0) then 1 else 10 * Power10(n-1)
}

function NumberToSeq(number: int) : seq<int>
  requires number >= 0
{
  if number == 0 then []
  else [number % 10] + NumberToSeq(number/10)
}

function Sum(digits: seq<int>) : int
{
  if |digits| == 0 then 0 else digits[0] + Sum(digits[1..])
}

function SumDigits(n: nat) : nat
{
  var ndigits := NumberOfDigits(n);
  var p := Power10(ndigits-1);
  SumDigitsRecursive(n, p)
}

function SumDigitsRecursive(n: nat, p: nat) : (r: nat)
{
  if n == 0 || p == 0 then 0
  else
    var leftMostDigit := n/p;
    var rest := n%p;
    leftMostDigit + SumDigitsRecursive(rest, p/10)

}

function NumberOfDigits(n: nat) : (r: nat)
  ensures r >= 1
  ensures r == 1 <==> 0 <= n <= 9
{
  if 0 <= n <= 9 then 1 else 1+NumberOfDigits(n/10)
}