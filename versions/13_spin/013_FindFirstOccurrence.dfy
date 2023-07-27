method FindFirstOccurrence(arr: array<int>, target: int) returns (index: int)
{
    index := -1;
    for i := 0 to arr.Length
    {
        if arr[i] == target
        {
            index := i;
            break;
        }
        if arr[i] > target
        {
            break;
        }
    }
}
