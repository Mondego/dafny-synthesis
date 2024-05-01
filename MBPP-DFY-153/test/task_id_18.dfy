method RemoveChars(s1: string, s2: string) returns (v: string)
  ensures |v| <= |s1|
  ensures forall i :: 0 <= i < |v| ==> (v[i] in s1) && !(v[i] in s2)
  ensures forall i :: 0 <= i < |s1| ==> (s1[i] in s2) || (s1[i] in v)
{
  var v' : string := [];
  for i := 0 to |s1|
    invariant 0 <= i <= |s1|
    invariant |v'| <= i
    invariant forall k :: 0 <= k < |v'| ==> (v'[k] in s1) && !(v'[k] in s2)
    invariant forall k :: 0 <= k < i ==> (s1[k] in s2) || (s1[k] in v')
  {
    if !(s1[i] in s2)
    {
      v' := v' + [s1[i]];
    }
  }
  return v';
}

method RemoveCharsTest(){
  var out1:=RemoveChars("probasscurve", "pros");
  expect out1=="bacuve";

  var out2:=RemoveChars("digitalindia", "talent");
  expect out2=="digiidi";

  var out3:=RemoveChars("exoticmiles", "toxic");
  expect out3=="emles";

}

method Main(){
  RemoveCharsTest();
}