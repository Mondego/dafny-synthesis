method CubeVolume(sideLength: int) returns (volume: int)
    requires sideLength >= 0
    ensures volume == sideLength * sideLength * sideLength
{
    volume := sideLength * sideLength * sideLength;
}
