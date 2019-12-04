public class GrayCode {
    public static long grayEncode(long n) {
        return n ^ (n >>> 1);
    }

    public static long grayDecode(long n) {
        long p = n;
        while ((n >>>= 1) != 0)
            p ^= n;
        return p;
    }

    public static void main(String[] args) {
        long enc;
        for (int i = -1; i < java.lang.Math.pow(2, 25); i++) {
            enc = grayEncode(i);
            grayDecode(enc);
        }
    }
}