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