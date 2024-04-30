method DifferenceMinMax(a: array<int>) returns (diff: int)
  requires a.Length > 0
  ensures diff == Max(a[..]) - Min(a[..])
{
  var minVal := a[0];
  var maxVal := a[0];

  for i := 1 to a.Length
    invariant 1 <= i <= a.Length
    invariant minVal <= maxVal
    invariant forall k :: 0 <= k < i ==> minVal <= a[k] && a[k] <= maxVal
    invariant minVal == Min(a[..i])
    invariant maxVal == Max(a[..i])
  {
    if a[i] < minVal {
      minVal := a[i];
    } else if a[i] > maxVal {
      maxVal := a[i];
    }
    assert a[..i+1][..i] == a[..i];
  }
  assert a[..a.Length] == a[..];
  diff := maxVal - minVal;
}

// The order of the recursion in these two functions
// must match the order of the iteration in the algorithm above
function Min(a: seq<int>) : int
  requires |a| > 0
{
  if |a| == 1 then a[0]
  else
    var minPrefix := Min(a[..|a|-1]);
    if a[|a|-1] <= minPrefix then a[|a|-1] else Min(a[..|a|-1])
}

function Max(a: seq<int>) : int
  requires |a| > 0
{
  if |a| == 1 then a[0]
  else
    var maxPrefix := Max(a[..|a|-1]);
    if a[|a|-1] >= maxPrefix then a[|a|-1] else Max(a[..|a|-1])
}


method DifferenceMinMaxTest(){
  var a1:= new int[] [1,2,3,4];
  var out1:=DifferenceMinMax(a1);
  expect out1==3;

  var a2:= new int[] [4,5,12];
  var out2:=DifferenceMinMax(a2);
  expect out2==8;

  var a3:= new int[] [9,2,3];
  var out3:=DifferenceMinMax(a3);
  expect out3==7;

}

method Main(){
  DifferenceMinMaxTest();
}
