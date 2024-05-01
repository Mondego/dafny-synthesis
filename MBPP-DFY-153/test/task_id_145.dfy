method MaxDifference(a: array<int>) returns (diff: int)
  requires a.Length > 1
  ensures forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] - a[j] <= diff
{
  var minVal := a[0];
  var maxVal := a[0];

  for i := 1 to a.Length
    invariant 1 <= i <= a.Length
    invariant minVal <= maxVal
    invariant forall k :: 0 <= k < i ==> minVal <= a[k] && a[k] <= maxVal
  {
    if a[i] < minVal {
      minVal := a[i];
    } else if a[i] > maxVal {
      maxVal := a[i];
    }
  }
  diff := maxVal - minVal;
}

method MaxDifferenceTest(){
  var a1:= new int[] [2,1,5,3];
  var out1:=MaxDifference(a1);
  expect out1==4;

  var a2:= new int[] [9,3,2,5,1];
  var out2:=MaxDifference(a2);
  expect out2==8;
  
  var a3:= new int[] [3,2,1];
  var out3:=MaxDifference(a3);
  expect out3==2;

}

method Main(){
  MaxDifferenceTest();
}