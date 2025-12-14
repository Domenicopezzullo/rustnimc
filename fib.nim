import std/[os, strutils]

proc fib(n: int32, memo: var seq[int32]): int32 {.inline.} =
  if n < 2:
    return n
  if memo[n] != -1:
    return memo[n];
  memo[n] = fib(n-1, memo) + fib(n-2,memo)
  return memo[n]

let cmdline = os.commandLineParams()
if cmdline.len < 1:
  echo "Usage: fib_nim <n>"
  quit 1
let n = parseInt(cmdline[0]).int32
var memo = newSeq[int32](n+1)
for i in mitems memo:
  i = -1

var acc: int32 = 0
for _ in 1..1_000_000:
  acc = acc xor fib(int32(n), memo)
echo acc
