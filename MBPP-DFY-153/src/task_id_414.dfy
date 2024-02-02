method AnyValueExists(seq1: seq<int>, seq2: seq<int>) returns (result: bool)
    ensures result <==> (exists i :: 0 <= i < |seq1| && seq1[i] in seq2)
{
    result := false;
    for i := 0 to |seq1|
        invariant 0 <= i <= |seq1|
        invariant result <==> (exists k :: 0 <= k < i && seq1[k] in seq2)
    {
        if seq1[i] in seq2 {
            result := true;
            break;
        }
    }
}