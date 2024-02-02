predicate IsVowel(c: char)
{
  c in {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'}
}

method CountVowelNeighbors(s: string) returns (count: int)
  ensures count >= 0
  ensures count == | set i: int | 1 <= i < |s|-1 && IsVowel(s[i-1]) && IsVowel(s[i+1]) |
{
  var vowels := set i: int | 1 <= i < |s|-1 && IsVowel(s[i-1]) && IsVowel(s[i+1]);
  count := |vowels|;
}


method IsVowelTest(){
  var out1:=CountVowelNeighbors("bestinstareels");
  print(out1);print("\n");
              //assert out1==7;

//   var out2:=CountVowelNeighbors("partofthejourneyistheend");
//   print(out2);print("\n");
//               //assert out2==12;

//   var out3:=CountVowelNeighbors("amazonprime");
//   print(out3);print("\n");
//               //assert out3==5;
}

method Main(){
  IsVowelTest();
}
