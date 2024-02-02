method AllElementsEqual(a: array<int>, n: int) returns (result: bool)
  requires a != null
  ensures result ==> forall i :: 0 <= i < a.Length ==> a[i] == n
  ensures !result ==> exists i :: 0 <= i < a.Length && a[i] != n
{
  result := true;
  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant result ==> forall k :: 0 <= k < i ==> a[k] == n
  {
    if a[i] != n {
      result := false;
      break;
    }
  }
}

method AllElementsEqualTest(){
  var a1:= new int[] [1, 3, 5, 7, 9, 2, 4, 6, 8];
  var res1:=AllElementsEqual(a1,3);
  print(res1);print("\n");
              //assert res1==false;

  var a2:= new int[] [1,1,1,1,1,1,1];
  var res2:=AllElementsEqual(a2,1);
  print(res2);print("\n");
              //assert res2==true;

  var a3:= new int[] [5,6,7,4,8];
  var res3:=AllElementsEqual(a3,6);
  print(res3);print("\n");
              //assert res3==false;


}

method Main(){
  AllElementsEqualTest();
}