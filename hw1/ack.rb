def ack(m, n)
  if m == 0
	return n + 1
  elsif n == 0 and m > 0
	return ack(m - 1, 1)
  else
	return ack(m - 1, ack(m, n - 1))
  end
end

def main()
	puts ack(ARGV[0].to_i, ARGV[1].to_i)
end

main()