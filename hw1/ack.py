import sys

def ack(m, n):
	if m == 0:
		return n + 1
	elif n == 0 and m > 0:
		return ack(m-1, 1)
	else:
		return ack(m-1, ack(m, n - 1))
def main():
	print(ack(int(sys.argv[1]), int(sys.argv[2])))

main()