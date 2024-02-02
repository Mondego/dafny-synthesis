method InsertBeforeEach(s: seq<string>, x: string) returns (v: seq<string>)
  ensures |v| == 2 * |s|
  ensures forall i :: 0 <= i < |s| ==> v[2*i] == x && v[2*i + 1] == s[i]
{
  v := [];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |v| == 2 * i
    invariant forall j :: 0 <= j < i ==> v[2*j] == x && v[2*j + 1] == s[j]
  {
    v := v + [x, s[i]];
  }
}

method PrintSeq(v: seq<string>){
  print("[");
  for i := 0 to |v|
  {
    if(i<|v|){
      print(v[i]);
      print(",");
    }
  }
  print("]");
}



method InsertBeforeEachTest(){
  var s1: seq<string> := ["Red", "Green", "Black"];
  var res1:=InsertBeforeEach(s1,"c");
  PrintSeq(res1);print("\n");
                 //expected ["c", "Red", "c", "Green", "c", "Black"];


  var s2: seq<string> := ["python", "java"];
  var res2:=InsertBeforeEach(s2,"program");
  PrintSeq(res2);print("\n");
                 // expected ["program", "python", "program", "java"];

  var s3: seq<string> := ["happy", "sad"];
  var res3:=InsertBeforeEach(s3,"laugh");
  PrintSeq(res3);print("\n");
                 // expected ["laugh", "happy", "laugh", "sad"];

}

method Main(){
  InsertBeforeEachTest();
}