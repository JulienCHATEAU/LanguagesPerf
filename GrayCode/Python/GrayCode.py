def int2bin(n):
	'From positive integer to list of binary bits, msb at index 0'
	if n:
		bits = []
		while n:
			n,remainder = divmod(n, 2)
			bits.insert(0, remainder)
		return bits
	else: return [0]


def bin2int(bits):
	'From binary bits, msb at index 0 to integer'
	i = 0
	for bit in bits:
		i = i * 2 + bit
	return i

def bin2gray(bits):
    return bits[:1] + [i ^ ishift for i, ishift in zip(bits[:-1], bits[1:])]

def gray2bin(bits):
	b = [bits[0]]
	for nextb in bits[1:]: b.append(b[-1] ^ nextb)
	return b

for i in range(pow(2, 20)):
	enc = bin2gray(int2bin(i))
	gray2bin(enc)
