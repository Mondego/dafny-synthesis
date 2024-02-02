method CountLists(lists: seq<seq<int>>) returns (count: int)
    ensures count >= 0
    ensures count == |lists|
{
    count := |lists|;
}