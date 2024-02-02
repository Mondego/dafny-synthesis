method RotateLeftBits(n: bv32, d: int) returns (result: bv32)
    requires 0 <= d < 32
    ensures result == ((n << d) | (n >> (32 - d)))
{
    result := ((n << d) | (n >> (32 - d)));
}