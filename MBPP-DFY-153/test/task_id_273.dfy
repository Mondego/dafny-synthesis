method SubtractSequences(a: seq<int>, b: seq<int>) returns (result: seq<int>)
  requires |a| == |b|
  ensures |result| == |a|
  ensures forall i :: 0 <= i < |result| ==> result[i] == a[i] - b[i]
{
  result := [];
  var i := 0;
  while i < |a|
    invariant 0 <= i <= |a|
    invariant |result| == i
    invariant forall k :: 0 <= k < i ==> result[k] == a[k] - b[k]
  {
    result := result + [a[i] - b[i]];
    i := i + 1;
  }
}

method SubtractSequencesTest(){
  var s1: seq<int> := [10, 4, 5];
  var s2: seq<int> := [2, 5, 18];
  var res1:=SubtractSequences(s1,s2);
  print(res1);print("\n");
              //expected [8, -1, -13];


  var s3: seq<int> := [11, 2, 3];
  var s4: seq<int> := [24, 45 ,16];
  var res2:=SubtractSequences(s3,s4);
  print(res2);print("\n");
              //expected [-13, -43, -13];


  var s5: seq<int> := [7, 18, 9];
  var s6: seq<int> := [10, 11, 12];
  var res3:=SubtractSequences(s5,s6);
  print(res3);print("\n");
              //expected [-3, 7, -3];

}

method Main(){
  SubtractSequencesTest();
}