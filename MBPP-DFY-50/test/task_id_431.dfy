method HasCommonElement(a: array<int>, b: array<int>) returns (result: bool)
  requires a != null && b != null
  ensures result ==> exists i, j :: 0 <= i < a.Length && 0 <= j < b.Length && a[i] == b[j]
  ensures !result ==> forall i, j :: 0 <= i < a.Length && 0 <= j < b.Length ==> a[i] != b[j]
{
  result := false;
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant !result ==> forall k, j :: 0 <= k < i && 0 <= j < b.Length ==> a[k] != b[j]
  {
    for j := 0 to b.Length
      invariant 0 <= j <= b.Length
      invariant !result ==> forall k :: 0 <= k < j ==> a[i] != b[k]
    {
      if a[i] == b[j] {
        result := true;
        return;
      }
    }
  }
}

method HasCommonElementTest(){
  var a1:= new int[] [1,2,3,4,5];
  var a2:= new int[] [5,6,7,8,9];
  var out1:=HasCommonElement(a1,a2);
  print(out1);print("\n");
              //assert out1==true;

  var a3:= new int[] [1,2,3,4,5];
  var a4:= new int[] [6,7,8,9];
  var out2:=HasCommonElement(a3,a4);
  print(out2);print("\n");
              //assert out2==false;

  var a5:= new int[] [1,0,1,0];
  var a6:= new int[] [2,0,1];
  var out3:=HasCommonElement(a5,a6);
  print(out3);print("\n");
              //assert out3==true;


}

method Main(){
  HasCommonElementTest();
}
