predicate IsEven(n: int)
{
  n % 2 == 0
}

predicate IsOdd(n: int)
{
  n % 2 != 0
}

method FirstEvenOddDifference(a: array<int>) returns (diff: int)
  requires a.Length >= 2
  requires exists i :: 0 <= i < a.Length && IsEven(a[i])
  requires exists i :: 0 <= i < a.Length && IsOdd(a[i])
  ensures exists i, j :: 0 <= i < a.Length && 0 <= j < a.Length && IsEven(a[i]) && IsOdd(a[j]) && diff == a[i] - a[j] &&
                         (forall k :: 0 <= k < i ==> IsOdd(a[k])) && (forall k :: 0 <= k < j ==> IsEven(a[k]))
{
  var firstEven: int := -1;
  var firstOdd: int := -1;

  for i := 0 to a.Length
    invariant 0 <= i <= a.Length
    invariant (firstEven == -1 || (0 <= firstEven < i && IsEven(a[firstEven])))
    invariant (firstOdd == -1 || (0 <= firstOdd < i && IsOdd(a[firstOdd])))
    invariant firstEven == -1 ==> (forall k :: 0 <= k < i ==> !IsEven(a[k]))
    invariant firstOdd == -1 ==> (forall k :: 0 <= k < i ==> !IsOdd(a[k]))
    invariant firstEven != -1 ==> (forall k :: 0 <= k < firstEven ==> IsOdd(a[k]))
    invariant firstOdd != -1 ==> (forall k :: 0 <= k < firstOdd ==> IsEven(a[k]))
  {
    if firstEven == -1 && IsEven(a[i])
    {
      firstEven := i;
    }
    if firstOdd == -1 && IsOdd(a[i])
    {
      firstOdd := i;
    }
    if firstEven != -1 && firstOdd != -1
    {
      break;
    }
  }
  diff := a[firstEven] - a[firstOdd];
}

method FirstEvenOddDifferenceTest(){
  var a1:= new int[] [1,3,5,7,4,1,6,8];
  var out1:=FirstEvenOddDifference(a1);
  expect out1==3;
  
  var a2:= new int[] [1,2,3,4,5,6,7,8,9,10];
  var out2:=FirstEvenOddDifference(a2);
  expect out2==1;

  var a3:= new int[] [1,5,7,9,10];
  var out3:=FirstEvenOddDifference(a3);
  expect out3==9;

}

method Main(){
  FirstEvenOddDifferenceTest();
}
