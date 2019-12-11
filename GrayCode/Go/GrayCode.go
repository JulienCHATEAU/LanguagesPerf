package main

import "math"

func enc(b int) int {
    return b ^ b>>1
}

func dec(g int) (b int) {
    for ; g != 0; g >>= 1 {
        b ^= g
    }
    return
}

func main() {
	it := int(math.Pow(2, 20))
    for b := 0; b < it; b++ {
        g := enc(b)
        dec(g)
    }
}
