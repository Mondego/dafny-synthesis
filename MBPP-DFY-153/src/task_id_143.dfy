method CountArrays(arrays: seq<array<int>>) returns (count: int)
    ensures count >= 0
    ensures count == |arrays|
{
    count := |arrays|;
}