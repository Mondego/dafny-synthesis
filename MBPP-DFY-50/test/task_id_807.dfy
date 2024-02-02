predicate IsOdd(x: int)
{
  x % 2 != 0
}

method FindFirstOdd(a: array<int>) returns (found: bool, index: int)
  requires a != null
  ensures !found ==> forall i :: 0 <= i < a.Length ==> !IsOdd(a[i])
  ensures found ==> 0 <= index < a.Length && IsOdd(a[index]) && forall i :: 0 <= i < index ==> !IsOdd(a[i])
{
  found := false;
  index := 0;
  while (index < a.Length)
    invariant 0 <= index <= a.Length
    invariant !found ==> forall i :: 0 <= i < index ==> !IsOdd(a[i])
    invariant found ==> IsOdd(a[index - 1]) && forall i :: 0 <= i < index - 1 ==> !IsOdd(a[i])
  {
    if IsOdd(a[index])
    {
      found := true;
      return;
    }
    index := index + 1;
  }
}


method FindFirstOddTest(){

  var a1:= new int[] [1,3,5];
  var found1,out1:=FindFirstOdd(a1);
  print(a1[out1]);print("\n");
                  //assert out1==1;

  var a2:= new int[] [2,4,1,3];
  var found2,out2:=FindFirstOdd(a2);
  print(a2[out2]);print("\n");
                  //assert out2==1;

  var a3:= new int[] [8,9,1];
  var found3,out3:=FindFirstOdd(a3);
  print(a3[out3]);print("\n");
                  //assert out3==9;


}

method Main(){
  FindFirstOddTest();
}
