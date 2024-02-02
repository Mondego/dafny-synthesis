method FindMedian(a: array<int>, b: array<int>) returns (median: int)
    requires a != null && b != null
    requires a.Length == b.Length
    requires a.Length > 0
    requires forall i :: 0 <= i < a.Length - 1 ==> a[i] <= a[i + 1]
    requires forall i :: 0 <= i < b.Length - 1 ==> b[i] <= b[i + 1]
    ensures median == if (a.Length % 2 == 0) then (a[a.Length / 2 - 1] + b[0]) / 2 else a[a.Length / 2]
{
    if (a.Length % 2 == 0) {
        median := (a[a.Length / 2 - 1] + b[0]) / 2;
    } else {
        median := a[a.Length / 2];
    }
}

method FindMedianTest(){
var a1:= new int[] [1, 12, 15, 26, 38];
var a2:= new int[] [2, 13, 17, 30, 45];
var res1:=FindMedian(a1,a2,5);
assert res1==16.0;

var a3:= new int[] [2, 4, 8, 9];
var a4:= new int[] [7, 13, 19, 28];
var res2:=FindMedian(a3,a4,4);
assert res2==8.5;

var a5:= new int[] [3, 6, 14, 23, 36, 42];
var a6:= new int[] [2, 18, 27, 39, 49, 55];
var res3:=FindMedian(a5,a6,55);
assert res3==25.0;

}

method Main(){
    FindMedianTest();
}
