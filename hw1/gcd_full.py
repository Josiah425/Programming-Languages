import sys

def gcdR(i, j):
	if i % j == 0:
	  return j
	else:
	  return gcdR(j, i % j)
	  
def gcdI(i, j):
  while i != j:
    if i > j:
      i = i - j
    else:
      j = j - i
  return i

def main():
	print(gcdR(int(sys.argv[1]), int(sys.argv[2])))
	print(gcdI(int(sys.argv[1]), int(sys.argv[2])))

main()