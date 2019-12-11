function encode(number) {
    return number ^ (number >> 1)
}

function decode(encodedNumber) {
    let number = encodedNumber

    while (encodedNumber >>= 1) {
        number ^= encodedNumber
    }

    return number
}

for (let number = 0; number < Math.pow(2, 20); number++) {
    const grayCode = encode(number)
    const decodedGrayCode = decode(grayCode)
}
