/**
 * Find the smallest missing number from a sorted list of natural numbers.
 */
method SmallestMissingNumber(s: seq<int>) returns (v: int)
{
    v := 0;
    for i := 0 to |s|
    {
        if s[i] > v
        {
            break;
        }
        else
        {
            if s[i] == v 
            {
                v := v + 1;
            }
        }
    }
    assert forall k :: 0 <= k < v && s[k] != v ==> k in s;
}
