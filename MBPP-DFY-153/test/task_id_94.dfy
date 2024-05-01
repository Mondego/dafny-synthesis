method MinSecondValueFirst(s: array<seq<int>>) returns (firstOfMinSecond: int)
  requires s.Length > 0
  requires forall i :: 0 <= i < s.Length ==> |s[i]| >= 2
  ensures exists i :: 0 <= i < s.Length && firstOfMinSecond == s[i][0] &&
                      (forall j :: 0 <= j < s.Length ==> s[i][1] <= s[j][1])
{
  var minSecondIndex := 0;
  for i := 1 to s.Length
    invariant 0 <= i <= s.Length
    invariant 0 <= minSecondIndex < i
    invariant forall j :: 0 <= j < i ==> s[minSecondIndex][1] <= s[j][1]
  {
    if s[i][1] < s[minSecondIndex][1]
    {
      minSecondIndex := i;
    }
  }
  firstOfMinSecond := s[minSecondIndex][0];
}

method MinSecondValueFirstTest(){
  
  var s1:array<seq<int>> := new seq<int>[] [[1, 3], [5, 7], [9, 11], [13, 15]];
  var res1:=MinSecondValueFirst(s1);
  expect res1==1;

  var s2:array<seq<int>> := new seq<int>[][[1, 4], [5, 1], [9, 11], [13, 15]];
  var res2:=MinSecondValueFirst(s2);
  expect res2==5;

  var s3:array<seq<int>> := new seq<int>[][[1, 4], [5, 1], [9, -1], [13, 15]];
  var res3:=MinSecondValueFirst(s3);
  expect res3==9;

}

method Main(){
  MinSecondValueFirstTest();
}