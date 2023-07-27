method IsSublist(sub: seq<int>, main: seq<int>) returns (result: bool)
{
    if |sub| > |main| {
        return false;
    }

    for i := 0 to |main| - |sub| + 1
    {
        if sub == main[i..i + |sub|] {
            result := true;
        }
    }
    result := false;
}
