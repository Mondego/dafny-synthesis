method AllSequencesEqualLength(sequences: seq<seq<int>>) returns (result: bool)
    ensures result <==> forall i, j :: 0 <= i < |sequences| && 0 <= j < |sequences| ==> |sequences[i]| == |sequences[j]|
{
    if |sequences| == 0 {
        return true;
    }

    var firstLength := |sequences[0]|;
    result := true;

    for i := 1 to |sequences|
        invariant 1 <= i <= |sequences|
        invariant result <==> forall k :: 0 <= k < i ==> |sequences[k]| == firstLength
    {
        if |sequences[i]| != firstLength {
            result := false;
            break;
        }
    }
}

method AllSequencesEqualLengthTest(){
    var s1:seq<seq<int>> :=[[11, 22, 33], [44, 55, 66]];
    var res1:=AllSequencesEqualLength(s1);
    expect res1==true;
    
    var s2:seq<seq<int>> :=[[1, 2, 3], [4, 5, 6, 7]];
    var res2:=AllSequencesEqualLength(s2);
    expect res2==false;
    
    var s3:seq<seq<int>> :=[[1, 2], [3, 4]];
    var res3:=AllSequencesEqualLength(s3);
    expect res3==true;
}

method Main(){
    AllSequencesEqualLengthTest();
}
