method ToCharArray(s: string) returns (a: array<char>)
  ensures a.Length == |s|
  ensures forall i :: 0 <= i < |s| ==> a[i] == s[i]
{
  a := new char[|s|];
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant a.Length == |s|
    invariant forall k :: 0 <= k < i ==> a[k] == s[k]
  {
    a[i] := s[i];
  }
}

method PrintArray(arr:array<char>)
{
  print("[");
  for i:= 0 to arr.Length{
    print(arr[i]);
    if (i<(arr.Length-1))
    {
      print(",");
    }
  }
  print("]");
  print("\n");

}

method ToCharArrayTest(){
  var e1: seq<char> := ['p', 'y', 't', 'h', 'o', 'n',' ','3', '.', '0'];
  var res1:=ToCharArray("python 3.0");
  PrintArray(res1);
  //expected ['p','y','t','h','o','n',' ','3','.','0']

  var e2: seq<char> := ['i', 't', 'e', 'm', '1'];
  var res2:=ToCharArray("item1");
  PrintArray(res2);
  //expected  ['i','t','e','m','1']

  var e3: seq<char> := ['1', '5', '.', '1', '0'];
  var res3:=ToCharArray("15.10");
  PrintArray(res3);
  //expected '1','5','.','1','0']

}

method Main(){
  ToCharArrayTest();
}