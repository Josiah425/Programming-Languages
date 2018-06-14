def gcdI(i, j)
  while i != j
    if i > j
      i = i - j
    else
      j = j - i
    end
  end
  return i
end

def gcdR(i, j)
  if i % j == 0
    return j
  else
    return gcdR(j, i % j)
  end
end

def main()
	puts gcdI(ARGV[0].to_i, ARGV[1].to_i)
	puts gcdR(ARGV[0].to_i, ARGV[1].to_i)
end

main()