method CountNonEmptySubstrings(s: string) returns (count: int)
  ensures count >= 0
  ensures count == (|s| * (|s| + 1)) / 2 // Formula for the number of non-empty substrings of a string
{
  count := (|s| * (|s| + 1)) / 2;
}

method CountNonEmptySubstringsTest(){
  var res1:=CountNonEmptySubstrings("abc");
  print(res1);print("\n");
  assert res1==6;

  var res2:=CountNonEmptySubstrings("abcd");
  print(res2);print("\n");
  assert res2==10;

  var res3:=CountNonEmptySubstrings("abcde");
  print(res3);print("\n");
  assert res3==15;

}

method Main(){
  CountNonEmptySubstringsTest();
}