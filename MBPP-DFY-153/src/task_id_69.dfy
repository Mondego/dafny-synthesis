method ContainsSequence(list: seq<seq<int>>, sub: seq<int>) returns (result: bool)
    ensures result <==> (exists i :: 0 <= i < |list| && sub == list[i])
{
    result := false;
    for i := 0 to |list|
        invariant 0 <= i <= |list|
        invariant result <==> (exists k :: 0 <= k < i && sub == list[k])
    {
        if sub == list[i] {
            result := true;
            break;
        }
    }
}