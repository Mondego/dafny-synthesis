method AllCharactersSame(s: string) returns (result: bool)
  ensures result ==> forall i, j :: 0 <= i < |s| && 0 <= j < |s| ==> s[i] == s[j]
  ensures !result ==> (|s| > 1) && (exists i, j :: 0 <= i < |s| && 0 <= j < |s| && i != j && s[i] != s[j])
{
  if |s| <= 1 {
    return true;
  }

  var firstChar := s[0];
  result := true;

  for i := 1 to |s|
    invariant 0 <= i <= |s|
    invariant result ==> forall k :: 0 <= k < i ==> s[k] == firstChar
  {
    if s[i] != firstChar {
      result := false;
      break;
    }
  }
}


method AllCharactersSameTest(){
  var out1:=AllCharactersSame("python");
  print(out1);print("\n");
              //assert out1==false;

  var out2:=AllCharactersSame("aaa");
  print(out2);print("\n");
              //assert out2==true;

  var out3:=AllCharactersSame("data");
  print(out3);print("\n");
              //assert out3==false;

}

method Main(){
  AllCharactersSameTest();
}
