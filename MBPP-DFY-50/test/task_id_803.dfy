method IsPerfectSquare(n: int) returns (result: bool)
  requires n >= 0
  ensures result == true ==> (exists i: int :: 0 <= i <= n && i * i == n)
  ensures result == false ==> (forall a: int :: 0 < a*a < n ==> a*a != n)
{
  var i := 0;
  while (i * i < n)
    invariant 0 <= i <= n
    invariant forall k :: 0 <= k < i ==> k * k < n
  {
    i := i + 1;
  }
  return i * i == n;
}

method IsPerfectSquareTest(){

  var out1:=IsPerfectSquare(10);
  expect out1==false;

  var out2:=IsPerfectSquare(36);
  expect out2==true;

  var out3:=IsPerfectSquare(14);
  expect out3==false;

}

method Main(){
  IsPerfectSquareTest();
}
