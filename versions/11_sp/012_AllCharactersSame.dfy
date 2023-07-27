method AllCharactersSame(s: string) returns (result: bool)
{
    if |s| <= 1 {
        return true;
    }

    var firstChar := s[0];
    result := true;

    for i := 1 to |s|
        invariant 0 <= i <= |s|
        invariant result ==> forall k :: 0 <= k < i ==> s[k] == firstChar
    {
        if s[i] != firstChar {
            result := false;
            break;
        }
    }
}
