predicate IsEven(n: int)
{
  n % 2 == 0
}

method IsProductEven(a: array<int>) returns (result: bool)
  ensures result <==> exists i :: 0 <= i < a.Length && IsEven(a[i])
{
  result := false;
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant result <==> exists k :: 0 <= k < i && IsEven(a[k])
  {
    if IsEven(a[i])
    {
      result := true;
      break;
    }
  }
}

method IsProductEvenTest(){
  
  var a1:= new int[] [1,2,3];
  var out1:=IsProductEven(a1);
  expect out1==true;

  var a2:= new int[] [1,2,1,4];
  var out2:=IsProductEven(a2);
  expect out2==true;

  var a3:= new int[] [1,1];
  var out3:=IsProductEven(a3);
  expect out3==false;

}

method Main(){
  IsProductEvenTest();
}
