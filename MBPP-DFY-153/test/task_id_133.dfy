function sumNegativesTo( a:array<int>, n:int ) : int
  requires a != null;
  requires 0 <= n && n <= a.Length;
  decreases n;
  reads a;
{
  if (n == 0) then 0 else if a[n-1] < 0 then sumNegativesTo(a, n-1) + a[n-1] else sumNegativesTo(a, n-1)
}

method SumOfNegatives(a: array<int>) returns (result: int)
  ensures result == sumNegativesTo(a, a.Length)
{
  result := 0;
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant result == sumNegativesTo(a, i)
  {
    if a[i] < 0 {
      result := result + a[i];
    }
  }
}

method SumOfNegativesTest(){
  var a1:= new int[] [2, 4, -6, -9, 11, -12, 14, -5, 17];
  var out1:=SumOfNegatives(a1);
  print(out1); print("\n");
               //assert out1==-32;

  var a2:= new int[] [10,15,-14,13,-18,12,-20];
  var out2:=SumOfNegatives(a2);
  print(out2); print("\n");
               //assert out2==-52;

  var a3:= new int[] [19, -65, 57, 39, 152,-639, 121, 44, 90, -190];
  var out3:=SumOfNegatives(a3);
  print(out3); print("\n");
               //assert out3==-894;

}

method Main(){
  SumOfNegativesTest();
}
