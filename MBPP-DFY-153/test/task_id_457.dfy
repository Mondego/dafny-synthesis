method MinLengthSublist(s: seq<seq<int>>) returns (minSublist: seq<int>)
  requires |s| > 0
  ensures minSublist in s
  ensures forall sublist :: sublist in s ==> |minSublist| <= |sublist|
{
  minSublist := s[0];
  for i := 1 to |s|
    invariant 0 <= i <= |s|
    invariant minSublist in s[..i]
    invariant forall sublist :: sublist in s[..i] ==> |minSublist| <= |sublist|
  {
    if |s[i]| < |minSublist| {
      minSublist := s[i];
    }
  }
}

method MinLengthSublistTest(){
  var s1:seq<seq<int>> :=[[1],[1,2],[1,2,3]];
  var res1:=MinLengthSublist(s1);
  print(res1);print("\n");
              //expected [1]

  var s2:seq<seq<int>> :=[[1,1],[1,1,1],[1,2,7,8]];
  var res2:=MinLengthSublist(s2);
  print(res2);print("\n");
              //expected [1,1]

  var s3:seq<seq<int>> :=[[1,2,3],[3,4],[11,12,14]];
  var res3:=MinLengthSublist(s3);
  print(res3);print("\n");
              //expected [3,4]
}

method Main(){
  MinLengthSublistTest();
}
