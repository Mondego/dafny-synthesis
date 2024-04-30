function sumTo( a:array<int>, n:int ) : int
  requires a != null;
  requires 0 <= n && n <= a.Length;
  decreases n;
  reads a;
{
  if (n == 0) then 0 else sumTo(a, n-1) + a[n-1]
}

method ArraySum(a: array<int>) returns (result: int)
  ensures result == sumTo(a, a.Length)
{
  result := 0;
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant result == sumTo(a, i)
  {
    result := result + a[i];
  }
}

method ArraySumTest(){

  var a1:= new int[] [1, 2, 3];
  var out1:=ArraySum(a1);
  expect out1==6;

  var a2:= new int[] [15, 12, 13, 10];
  var out2:=ArraySum(a2);
  expect out2==50;

  var a3:= new int[] [0, 1, 2];
  var out3:=ArraySum(a3);
  expect out3==3;

}

method Main(){
  ArraySumTest();
}
