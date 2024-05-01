method CountEqualNumbers(a: int, b: int, c: int) returns (count: int)
  ensures count >= 0 && count <= 3
  ensures (count == 3) <==> (a == b && b == c)
  ensures (count == 2) <==> ((a == b && b != c) || (a != b && b == c) || (a == c && b != c))
  ensures (count == 1) <==> (a != b && b != c && a != c)
{
  count := 1;
  if (a == b) {
    count := count + 1;
  }
  if (a == c) {
    count := count + 1;
  }
  if (a != b && b == c) {
    count := count + 1;
  }
}

method CountEqualNumbersTest(){
  
  var res1:=CountEqualNumbers(1,1,1);
  expect res1==3;

  var res2:=CountEqualNumbers(-1,-2,-3);
  expect res2==1;

  var res3:=CountEqualNumbers(-1,-2,-3);
  expect res3==1;

}

method Main(){
  CountEqualNumbersTest();
}
