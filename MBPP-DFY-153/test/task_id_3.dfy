method IsNonPrime(n: int) returns (result: bool)
  requires n >= 2
  ensures result <==> (exists k :: 2 <= k < n && n % k == 0)
{
  result := false;
  var i := 2;
  while i <= n/2
    invariant 2 <= i
    invariant result <==> (exists k :: 2 <= k < i && n % k == 0)
  {
    if n % i == 0
    {
      result := true;
      break;
    }
    i := i + 1;
  }
}


method IsNonPrimeTest(){
  var res1:=IsNonPrime(2);
  print(res1);print("\n");
              //assert res1==false;
  var res2:=IsNonPrime(10);
  print(res2);print("\n");
              //assert res2==true;

  var res3:=IsNonPrime(35);
  print(res3);print("\n");
              //assert res3==true;
}

method Main(){
  IsNonPrimeTest();
}