method NthOctagonalNumber(n: int) returns (octagonalNumber: int)
  requires n >= 0
  ensures octagonalNumber == n * (3 * n - 2)
{
  octagonalNumber := n * (3 * n - 2);
}


method NthOctagonalNumberTest() {
  var res1:= NthOctagonalNumber(5);
  print(res1);print("\n");
  assert res1==65;

  var res2:= NthOctagonalNumber(10);
  print(res2);print("\n");
  assert res2==280;

  var res3:= NthOctagonalNumber(15);
  print(res3);print("\n");
  assert res3==645;


}

method Main(){
  NthOctagonalNumberTest();
}