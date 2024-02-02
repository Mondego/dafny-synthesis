method HasOnlyOneDistinctElement(a: array<int>) returns (result: bool)
  requires a != null
  ensures result ==> forall i, j :: 0 <= i < a.Length && 0 <= j < a.Length ==> a[i] == a[j]
  ensures !result ==> exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && a[i] != a[j]
{
  if a.Length == 0 {
    return true;
  }

  var firstElement := a[0];
  result := true;

  for i := 1 to a.Length
    invariant 1 <= i <= a.Length
    invariant result ==> forall k :: 0 <= k < i ==> a[k] == firstElement
  {
    if a[i] != firstElement {
      result := false;
      break;
    }
  }
}

method HasOnlyOneDistinctElementTest(){
  var a1:= new int[] [1,1,1];
  var res1:=HasOnlyOneDistinctElement(a1);
  print(res1);print("\n");
              //assert res1==true;

  var a2:= new int[] [1,2,1,2];
  var res2:=HasOnlyOneDistinctElement(a2);
  print(res2);print("\n");
              //assert res2==false;

  var a3:= new int[] [1,2,3,4,5];
  var res3:=HasOnlyOneDistinctElement(a3);
  print(res3);print("\n");
              //assert res3==false;


}

method Main(){
  HasOnlyOneDistinctElementTest();
}
