method IsPrime(n: int) returns (result: bool)
  requires n >= 2
  ensures result <==> (forall k :: 2 <= k < n ==> n % k != 0)
{
  result := true;
  var i := 2;
  while i <= n/2
    invariant 2 <= i
    invariant result <==> (forall k :: 2 <= k < i ==> n % k != 0)
  {
    if n % i == 0
    {
      result := false;
      break;
    }
    i := i + 1;
  }
}


method IsPrimeTest(){
  var out1:=IsPrime(13);
  print(out1);print("\n");
              //assert out1==true;


  var out2:=IsPrime(7);
  print(out2);print("\n");
              //assert out2==true;


  var out3:=IsPrime(1010);
  print(out3);print("\n");
              //assert out3==false;


}

method Main(){
  IsPrimeTest();
}
