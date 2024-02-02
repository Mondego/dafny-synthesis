method StartAndEndWithSameChar(s: string) returns (result: bool)
  requires |s| > 0
  ensures result <==> s[0] == s[|s| - 1]
{
  result := s[0] == s[|s| - 1];
}

method StartAndEndWithSameCharTest(){

  var res1:=StartAndEndWithSameChar("abba");
  print(res1);print("\n");
  assert res1==true;

  var res2:=StartAndEndWithSameChar("a");
  print(res2);print("\n");
  assert res2==true;

  var res3:=StartAndEndWithSameChar("abcd");
  print(res3);print("\n");
  assert res3==false;


}

method Main(){
  StartAndEndWithSameCharTest();
}