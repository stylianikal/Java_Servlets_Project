import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Hashing {


    public String Sha_512(String pwd, byte[] salt) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("SHA-512");
        md.reset();
        md.update(salt);
        byte[] bytes = md.digest(pwd.getBytes());

        return bytesToStringHex(bytes);
    }

    private final char[] hexArray = "0123456789ABCDEF".toCharArray();
    //metatrepi ton sindiasmo digest+salt se stringhex kai apothikevete to stringhex sto database
    private String bytesToStringHex(byte[] bytes){

        char[] hexChars = new char[bytes.length * 2];
        for (int i = 0 ; i < bytes.length; i++){
            int v = bytes[i] & 0xFF;
            hexChars[i * 2] = hexArray[v >>> 4];
            hexChars[i * 2 + 1] = hexArray[v & 0x0F];
        }

        return new String(hexChars);
    }
    //dimiourgia monadikou salt
    public byte[] createSalt() throws NoSuchAlgorithmException {

        byte[] salt = new byte[16];
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");

        sr.nextBytes(salt);

        return salt;
    }
}