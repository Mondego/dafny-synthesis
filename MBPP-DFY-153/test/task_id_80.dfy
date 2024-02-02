method TetrahedralNumber(n: int) returns (t: int)
  requires n >= 0
  ensures t == n * (n + 1) * (n + 2) / 6
{
  t := n * (n + 1) * (n + 2) / 6;
}

method TetrahedralNumberTest(){
  var res1:=TetrahedralNumber(5);
  print(res1); print("\n");
  assert res1==35;
  
  var res2:=TetrahedralNumber(6);
  print(res2); print("\n");
  assert res2==56;
  
  var res3:=TetrahedralNumber(7);
  print(res3); print("\n");
  assert res3==84;
}

method Main(){
  TetrahedralNumberTest();
}