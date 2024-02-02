method IsLengthOdd(s: string) returns (result: bool)
  ensures result <==> |s| % 2 == 1
{
  result := |s| % 2 == 1;
}

method IsLengthOddTest(){
  var res1:= IsLengthOdd("Hadoop");
  print(res1); print("\n");
  assert res1==false;
  
  var res2:= IsLengthOdd("great");
  print(res2); print("\n");
  assert res2==true;
  
  var res3:= IsLengthOdd("structure");
  print(res3); print("\n");
  assert res3==true;


}

method Main(){
  IsLengthOddTest();

}