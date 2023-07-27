method LastPosition(arr: array<int>, elem: int) returns (pos: int)
{
    pos := -1;
    for i := 0 to arr.Length - 1
    {
        if arr[i] == elem
        {
            pos := i;
        }
    }
}
