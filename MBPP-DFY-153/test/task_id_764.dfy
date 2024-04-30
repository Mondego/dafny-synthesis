predicate IsDigit(c: char)
{
  48 <= c as int <= 57
}


method CountDigits(s: string) returns (count: int)
  ensures count >= 0
  ensures count == | set i: int | 0 <= i < |s| && IsDigit(s[i])|
{
  var digits := set i: int | 0 <= i < |s| && IsDigit(s[i]);
  count := |digits|;
}


method CountDigitsTest(){

  var out1:=CountDigits("program2bedone");
  expect out1==1;

  var out2:=CountDigits("3wonders");
  expect out2==1;

  var out3:=CountDigits("3wond-1ers2");
  expect out3==3;

}

method Main(){
  CountDigitsTest();
}
