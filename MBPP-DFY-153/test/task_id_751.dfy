method IsMinHeap(a: array<int>) returns (result: bool)
  requires a != null
  ensures result ==> forall i :: 0 <= i < a.Length / 2 ==> a[i] <= a[2*i + 1] && (2*i + 2 == a.Length || a[i] <= a[2*i + 2])
  ensures !result ==> exists i :: 0 <= i < a.Length / 2 && (a[i] > a[2*i + 1] || (2*i + 2 != a.Length && a[i] > a[2*i + 2]))
{
  result := true;
  for i := 0 to a.Length / 2
    invariant 0 <= i <= a.Length / 2
    invariant result ==> forall k :: 0 <= k < i ==> a[k] <= a[2*k + 1] && (2*k + 2 == a.Length || a[k] <= a[2*k + 2])
  {
    if a[i] > a[2*i + 1] || (2*i + 2 != a.Length && a[i] > a[2*i + 2]) {
      result := false;
      break;
    }
  }
}

method IsMinHeapTest(){
  var a1:= new int[] [1, 2, 3, 4, 5, 6];
  var res1:=IsMinHeap(a1);
  print(res1);print("\n");
              //assert res1==true;

  var a2:= new int[] [2, 3, 4, 5, 10, 15];
  var res2:=IsMinHeap(a2);
  print(res2);print("\n");
              //assert res2==true;

  var a3:= new int[] [2, 10, 4, 5, 3, 15];
  var res3:=IsMinHeap(a3);
  print(res3);print("\n");
              //assert res3==false;

}

method Main(){
  IsMinHeapTest();
}
