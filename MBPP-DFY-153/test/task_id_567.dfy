method IsSorted(a: array<int>) returns (sorted: bool)
  requires a.Length > 0
  ensures sorted <== forall i, j :: 0 <= i < j < a.Length ==> a[i] <= a[j]
  ensures !sorted ==> exists i, j :: 0 <= i < j < a.Length && a[i] > a[j]
{
  sorted := true;
  for i := 0 to a.Length - 1
    invariant 0 <= i < a.Length
    invariant sorted <== forall k, l :: 0 <= k < l < i ==> a[k] <= a[l]
    invariant !sorted ==> exists k :: 0 <= k < i && a[k] > a[k+1]
  {
    if a[i] > a[i + 1]
    {
      sorted := false;
      break;
    }
  }
  sorted := sorted;
}

method IsSortedTest(){
  var a1:= new int[] [1,2,4,6,8,10,12,14,16,17];
  var out1:=IsSorted(a1);
  expect out1==true;

  var a2:= new int[] [1, 2, 4, 6, 8, 10, 12, 14, 20, 17];
  var out2:=IsSorted(a2);
  expect out2==false;

  var a3:= new int[] [1, 2, 4, 6, 8, 10,15,14,20];
  var out3:=IsSorted(a3);
  expect out3==false;

}

method Main(){
  IsSortedTest();
}
