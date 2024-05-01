function sumTo( a:array<int>, start:int, end:int ) : int
  requires a != null;
  requires 0 <= start && start <= end && end <= a.Length;
  decreases end;
  reads a;
{
  if (start == end) then 0 else sumTo(a, start, end-1) + a[end-1]
}

method SumInRange(a: array<int>, start: int, end: int) returns (sum: int)
  requires a != null
  requires 0 <= start && start <= end && end <= a.Length
  ensures sum == sumTo(a, start, end)
{
  sum := 0;
  for i := start to end
    invariant start <= i <= end
    invariant sum == sumTo(a, start, i)
  {
    sum := sum + a[i];
  }
}


method SumInRangeTest(){
  
  var a1:= new int[] [2,1,5,6,8,3,4,9,10,11,8,12];
  var out1:=SumInRange(a1,8,11);
  expect out1==29;

  var a2:= new int[] [2,1,5,6,8,3,4,9,10,11,8,12];
  var out2:=SumInRange(a2,5,8);
  expect out2==16;
              

  var a3:= new int[] [2,1,5,6,8,3,4,9,10,11,8,12];
  var out3:=SumInRange(a3,7,11);
  expect out3==38;
            
}

method Main(){
  SumInRangeTest();
}