method CountCharacters(s: string) returns (count: int)
  ensures count >= 0
  ensures count == |s|
{
  count := |s|;
}

method CountCharactersTest(){
  var res1:=CountCharacters("python programming");
  print(res1);print("\n");
  assert res1==18;
  var res2:=CountCharacters("language");
  assert res2==8;
  print(res2);print("\n");
  var res3:=CountCharacters("words");
  print(res3);print("\n");
  assert res3==5;
}

method Main(){
  CountCharactersTest();
}