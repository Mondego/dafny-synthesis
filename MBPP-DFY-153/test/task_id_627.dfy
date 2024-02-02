/**
  * Find the smallest missing number from a sorted list of natural numbers.
  */
method SmallestMissingNumber(s: seq<int>) returns (v: int)
  requires forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
  requires forall i :: 0 <= i < |s| ==> s[i] >= 0
  ensures 0 <= v
  ensures v !in s
  ensures forall k :: 0 <= k < v ==> k in s
{
  v := 0;
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant 0 <= v <= i
    invariant v !in s[..i]
    invariant forall k :: 0 <= k < v && s[k] != v ==> k in s[..i]
  {
    if s[i] > v
    {
      break;
    }
    else
    {
      if s[i] == v
      {
        v := v + 1;
      }
    }
  }
  assert forall k :: 0 <= k < v && s[k] != v ==> k in s;
}



method SmallestMissingNumberTest(){
  var a1:seq<int>:= [0,1,2,3];
  var out1:=SmallestMissingNumber(a1);
  print(out1);print("\n");
              //assert out1==-2;

  var a2:seq<int>:= [0,1,2,6,9];
  var out2:=SmallestMissingNumber(a2);
  print(out2);print("\n");
              //assert out2==1;

  var a3:seq<int>:= [2,3,5,8,9];
  var out3:=SmallestMissingNumber(a3);
  print(out3);print("\n");
              //assert out3==-2;

}

method Main(){
  SmallestMissingNumberTest();
}
