method SplitStringIntoChars(s: string) returns (v: seq<char>)
  ensures |v| == |s|
  ensures forall i :: 0 <= i < |s| ==> v[i] == s[i]
{
  v := [];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant |v| == i
    invariant forall k :: 0 <= k < i ==> v[k] == s[k]
  {
    v := v + [s[i]];
  }
}





method SplitStringIntoCharsTest(){

  var res1:=SplitStringIntoChars("python");
  print(res1);print("\n");
              //expected ['p','y','t','h','o','n']

  var res2:=SplitStringIntoChars("Name");
  print(res2);print("\n");
              //expected ['N','a','m','e']

  var res3:=SplitStringIntoChars("program");
  print(res3);print("\n");
              //expected ['p','r','o','g','r','a','m']


}

method Main(){
  SplitStringIntoCharsTest();
}
