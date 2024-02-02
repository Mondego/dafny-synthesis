method ClosestSmaller(n: int) returns (m: int)
  requires n > 0
  ensures m + 1 == n
{
  m := n - 1;
}

method ClosestSmallerTest(){
  var res1:=ClosestSmaller(11);
  print(res1); print("\n");
  assert res1==10;

  var res2:=ClosestSmaller(7);
  assert res2==6;
  print(res2); print("\n");

  var res3:=ClosestSmaller(12);
  assert res3==11;
  print(res3); print("\n");

}

method Main(){
  ClosestSmallerTest();
}