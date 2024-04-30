method IsSublist(sub: seq<int>, main: seq<int>) returns (result: bool)
  ensures true <== (exists i :: 0 <= i <= |main| - |sub| && sub == main[i..i + |sub|])
{
  if |sub| > |main| {
    return false;
  }

  for i := 0 to |main| - |sub| + 1
    invariant 0 <= i <= |main| - |sub| + 1
    invariant true <== (exists j :: 0 <= j < i && sub == main[j..j + |sub|])
  {
    if sub == main[i..i + |sub|] {
      result := true;
    }
  }
  result := false;
}

method IsSublistTest(){
  var a1:seq<int>:= [1,4,3,5];
  var a2:seq<int>:= [1,2];
  var out1:=IsSublist(a2,a1);
  expect out1==false;

  var a3:seq<int>:=  [1,2,1];
  var a4:seq<int>:=  [1,2,1];
  var out2:=IsSublist(a4,a3);
  expect out2==false;

  var a5:seq<int>:=  [1,0,2,2];
  var a6:seq<int>:=  [0,2,2];
  var out3:=IsSublist(a6,a5);
  expect out3==false;

}

method Main(){
  IsSublistTest();
}
