predicate IsLowerCase(c : char)
{
  97 <= c as int <= 122
}

predicate IsLowerUpperPair(c : char, C : char)
{
  (c as int) == (C as int) + 32
}

function ShiftMinus32(c : char) :  char
{
  ((c as int - 32) % 128) as char
}

method ToUppercase(s: string) returns (v: string)
  ensures |v| == |s|
  ensures forall i :: 0 <= i < |s| ==>  if IsLowerCase(s[i]) then IsLowerUpperPair(s[i], v[i]) else v[i] == s[i]
{
  var s' : string := [];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |s'| == i
    invariant forall k :: 0 <= k < i &&  IsLowerCase(s[k]) ==> IsLowerUpperPair(s[k], s'[k])
    invariant forall k :: 0 <= k < i && !IsLowerCase(s[k]) ==> s[k] == s'[k]
  {
    if IsLowerCase(s[i])
    {
      s' := s' + [ShiftMinus32(s[i])];
    }
    else
    {
      s' := s' + [s[i]];
    }
  }
  return s';
}


method ToUppercaseTest(){
  var out1:=ToUppercase("person");
  assert out1=="PERSON";

  var out2:=ToUppercase("final");
  assert out2=="FINAL";

  var out3:=ToUppercase("Valid");
  assert out3=="VALID";

}

method Main(){
  ToUppercaseTest();
}
