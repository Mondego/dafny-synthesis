predicate IsLowerCase(c : char)
{
  97 <= c as int <= 122
}

predicate IsUpperCase(c : char)
{
  65 <= c as int <= 90
}

predicate IsLowerUpperPair(c : char, C : char)
{
  (c as int) == (C as int) + 32
}

predicate IsUpperLowerPair(C : char, c : char)
{
  (C as int) == (c as int) - 32
}

function ShiftMinus32(c : char) :  char
{
  ((c as int - 32) % 128) as char
}

function Shift32(c : char) :  char
{
  ((c as int + 32) % 128) as char
}

method ToggleCase(s: string) returns (v: string)
  ensures |v| == |s|
  ensures forall i :: 0 <= i < |s| ==>  if IsLowerCase(s[i]) then IsLowerUpperPair(s[i], v[i]) else if IsUpperCase(s[i]) then IsUpperLowerPair(s[i], v[i]) else v[i] == s[i]
{
  var s' : string := [];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |s'| == i
    invariant forall k :: 0 <= k < i &&  IsLowerCase(s[k]) ==> IsLowerUpperPair(s[k], s'[k])
    invariant forall k :: 0 <= k < i &&  IsUpperCase(s[k]) ==> IsUpperLowerPair(s[k], s'[k])
    invariant forall k :: 0 <= k < i && !IsLowerCase(s[k]) && !IsUpperCase(s[k]) ==> s[k] == s'[k]
  {
    if IsLowerCase(s[i])
    {
      s' := s' + [ShiftMinus32(s[i])];
    }
    else if IsUpperCase(s[i])
    {
      s' := s' + [Shift32(s[i])];
    }
    else
    {
      s' := s' + [s[i]];
    }
  }
  return s';
}

method ToggleCaseTest(){
  var out1:=ToggleCase("Python");
  print(out1);print("\n");
  assert out1=="pYTHON";

  var out2:=ToggleCase("Pangram");
  print(out2);print("\n");
  assert out2=="pANGRAM";

  var out3:=ToggleCase("LIttLE");
  print(out3);print("\n");
  assert out3=="liTTle";

}

method Main(){
  ToggleCaseTest();
}
