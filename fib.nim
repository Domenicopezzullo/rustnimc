
proc fib(n: int32, memo: var seq[int32]): int32 {.inline.} =
  if n < 2:
    return n
  if memo[n] != -1:
    return memo[n];
  memo[n] = fib(n-1, memo) + fib(n-2,memo)
  return memo[n]

let n: int32 = 10
var memo = newSeq[int32](n+1)
for n in mitems(memo):
  n = -1

var acc: int32 = 0
for _ in 0..1_000_000:
  acc += fib(int32(n), memo)
echo acc
