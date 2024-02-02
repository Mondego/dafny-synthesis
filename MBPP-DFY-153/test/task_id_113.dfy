predicate IsDigit(c: char)
{
  48 <= c as int <= 57
}

method IsInteger(s: string) returns (result: bool)
  ensures result <==> (|s| > 0) && (forall i :: 0 <= i < |s| ==> IsDigit(s[i]))
{
  result := true;
  if |s| == 0 {
    result := false;
  } else {
    for i := 0 to |s|
      invariant 0 <= i <= |s|
      invariant result <==> (forall k :: 0 <= k < i ==> IsDigit(s[k]))
    {
      if !IsDigit(s[i]) {
        result := false;
        break;
      }
    }
  }
}

method IsIntegerTest(){
  var res1:=IsInteger("python");
  print(res1); print("\n");
               //assert res1==false;
  var res2:=IsInteger("1");
  print(res2); print("\n");
               //assert res2==true;
  var res3:=IsInteger("12345");
  print(res3); print("\n");
               //assert res3==true;

}

method Main(){
  IsIntegerTest();
}