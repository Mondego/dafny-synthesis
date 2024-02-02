method ExtractRearChars(l: seq<string>) returns (r: seq<char>)
  requires forall i :: 0 <= i < |l| ==> |l[i]| > 0
  ensures |r| == |l|
  ensures forall i :: 0 <= i < |l| ==> r[i] == l[i][|l[i]| - 1]
{
  var rearChars: seq<char> := [];
  for i := 0 to |l|
    invariant 0 <= i <= |l|
    invariant |rearChars| == i
    invariant forall k :: 0 <= k < i ==> rearChars[k] == l[k][|l[k]| - 1]
  {
    rearChars := rearChars + [l[i][|l[i]| - 1]];
  }
  return rearChars;
}

method ExtractRearCharsTest(){
  var s1: seq<string> := ["Mers", "for", "Vers"];
  var res1:=ExtractRearChars(s1);
  print(res1);print("\n");
              //expeced ['s', 'r', 's']

  var s2: seq<string> := ["Avenge", "for", "People"];
  var res2:=ExtractRearChars(s2);
  print(res2);print("\n");
              //expeced ['e', 'r', 'e']

  var s3: seq<string> := ["Gotta", "get", "go"];
  var res3:=ExtractRearChars(s3);
  print(res3);print("\n");
              //expeced ['a', 't', 'o']

}

method Main(){
  ExtractRearCharsTest();
}