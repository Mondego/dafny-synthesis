method IsSublist(sub: seq<int>, main: seq<int>) returns (result: bool)
{
    if |sub| > |main| {
        return false;
    }

    for i := 0 to |main| - |sub| + 1
        invariant 0 <= i <= |main| - |sub| + 1
        invariant true <== (exists j :: 0 <= j < i && sub == main[j..j + |sub|])
    {
        if sub == main[i..i + |sub|] {
            result := true;
        }
    }
    result := false;
}
