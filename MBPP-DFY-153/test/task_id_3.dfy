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
  expect res1==false;

  var res2:=IsNonPrime(10);
  expect res2==true;

  var res3:=IsNonPrime(35);
  expect res3==true;

}

method Main(){
  IsNonPrimeTest();
}