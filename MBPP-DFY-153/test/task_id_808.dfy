method ContainsK(s: seq<int>, k: int) returns (result: bool)
  ensures result <==> k in s
{
  result := false;
  for i := 0 to |s|
    invariant 0 <= i <= |s|
    invariant result <==> (exists j :: 0 <= j < i && s[j] == k)
  {
    if s[i] == k {
      result := true;
      break;
    }
  }
}

method ContainsKTest(){
  var s1: seq<int> := [10, 4, 5, 6, 8];
  var res1:=ContainsK(s1,6);
  print(res1);print("\n");
  assert res1==true;

  var s2: seq<int> := [1, 2, 3, 4, 5, 6];
  var res2:=ContainsK(s2,7);
  print(res2);print("\n");
  assert res2==false;

  var s3: seq<int> := [7, 8, 9, 44, 11, 12];
  var res3:=ContainsK(s3,11);
  print(res3);print("\n");
  assert res3==true;

}

method Main(){
  ContainsKTest();
}
