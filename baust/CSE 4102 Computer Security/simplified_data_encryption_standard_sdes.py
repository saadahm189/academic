# Table appy
def apply_table(inp, table):
    res = ""
    for i in table:
        res += inp[i - 1]
    return res

# Left shift
def left_shift(data):
    return data[1:] + data[0]

# XOR process
def xor(a, b):
    res = ""
    for i in range(len(a)):
        if a[i] == b[i]:
            res += "0"
        else:
            res += "1"
    return res

# S-Box Appy
def apply_sbox(s, data):
    row = int("0b" + data[0] + data[-1], 2)
    col = int("0b" + data[1:3], 2)
    return bin(s[row][col])[2:]

# Encryption Function
def function(expansion, s0, s1, key, message):
    left = message[:4]
    right = message[4:]
    temp = apply_table(right, expansion)
    print("EP applied:",temp)
    temp = xor(temp, key)
    print("xor with key:",temp)
    l = apply_sbox(s0, temp[:4]) 
    print("S0:",l)
    r = apply_sbox(s1, temp[4:])
    print("S1:",r)
    l = "0" * (2 - len(l)) + l 
    r = "0" * (2 - len(r)) + r
    temp = apply_table(l + r, p4_table)
    print("P4 applied:",temp)
    temp = xor(left, temp)
    print("xor left+temp:",temp)
    return temp + right

# Main Function:
key = input("Enter 10 bit key: ")
message = input("Enter 8 bit message: ")

p8_table = [6, 3, 7, 4, 8, 5, 10, 9]
p10_table = [3, 5, 2, 7, 4, 10, 1, 9, 8, 6]
p4_table = [2, 4, 3, 1]
IP = [2, 6, 3, 1, 4, 8, 5, 7]
IP_inv = [4, 1, 3, 5, 7, 2, 8, 6]
expansion = [4, 1, 2, 3, 2, 3, 4, 1]
s0 = [[1, 0, 3, 2], [3, 2, 1, 0], [0, 2, 1, 3], [3, 1, 3, 2]]
s1 = [[0, 1, 2, 3], [2, 0, 1, 3], [3, 0, 1, 0], [2, 1, 0, 3]]

# key generation
temp = apply_table(key, p10_table)
print("P10 applied:",temp)
left = temp[:5]
right = temp[5:]
left = left_shift(left)
print("LS-1 L applied:",left)
right = left_shift(right)
print("LS-1 R applied:",right)
key1 = apply_table(left + right, p8_table)
print("Key 1:",key1)
left = left_shift(left)
right = left_shift(right)
left = left_shift(left)
print("LS-2 L applied:",left)
right = left_shift(right)
print("LS-2 R applied:",right)
key2 = apply_table(left + right, p8_table)
print("Key 2:",key2)

# encryption
temp = apply_table(message, IP)
print("IP applied:",temp)
temp = function(expansion, s0, s1, key1, temp)
temp = temp[4:] + temp[:4]
temp = function(expansion, s0, s1, key2, temp)
CT = apply_table(temp, IP_inv)
print("Cipher text is:", CT)

# decryption
temp = apply_table(CT, IP)
temp = function(expansion, s0, s1, key2, temp)
temp = temp[4:] + temp[:4]
temp = function(expansion, s0, s1, key1, temp)
PT = apply_table(temp, IP_inv)
print("Plain text after decypting is:", PT)