method ReplaceBlanksWithChar(s: string, ch: char) returns (v: string)
  ensures |v| == |s|
  ensures forall i :: 0 <= i < |s| ==> (s[i] == ' ' ==> v[i] == ch) && (s[i] != ' ' ==> v[i] == s[i])
{
  var s' : string := [];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |s'| == i
    invariant forall k :: 0 <= k < i ==> (s[k] == ' ' ==> s'[k] == ch) && (s[k] != ' ' ==> s'[k] == s[k])
  {
    if s[i] == ' '
    {
      s' := s' + [ch];
    }
    else
    {
      s' := s' + [s[i]];
    }
  }
  return s';
}

method ReplaceBlanksWithCharTest(){
  var res1:=ReplaceBlanksWithChar("hello people",'@');
  assert res1=="hello@people";
  
  var res2:=ReplaceBlanksWithChar("python program language",'$');
  
  assert res2=="python$program$language";
  var res3:=ReplaceBlanksWithChar("blank space",'-');
  
  assert res3=="blank-space";
}

method Main(){
  ReplaceBlanksWithCharTest();
}