method RotateLeftBits(n: bv32, d: int) returns (result: bv32)
  requires 0 <= d < 32
  ensures result == ((n << d) | (n >> (32 - d)))
{
  result := ((n << d) | (n >> (32 - d)));
}


method RotateLeftBitsTest(){
  var res1:=RotateLeftBits(16,2);
  print(res1);print("\n");
  assert res1==64;

  var res2:=RotateLeftBits(10,2);
  print(res2);print("\n");
  assert res2==40;

  var res3:=RotateLeftBits(99,3);
  print(res3);print("\n");
  assert res3==792;

}

method Main(){
  RotateLeftBitsTest();
}
