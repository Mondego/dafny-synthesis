//Write a method in Dafny to find the kth element in the given array using 1-based indexing.
method KthElement(arr: array<int>, k: int) returns (result: int)
  requires 1 <= k <= arr.Length
  ensures result == arr[k - 1]
{
  result := arr[k - 1];
}