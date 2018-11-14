package app.common;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * Created by landy on 2017/12/8.
 */
public class PasswordGen {
    public static final String DEFAULT_PASS = "000000";

    public static String genDefaultPass() {
        return genPass(DEFAULT_PASS);
    }

    public static String genPass(String pass) {
        Md5Hash hash = new Md5Hash(pass, null, 2);
        return hash.toString();
    }

    public static void main(String[] args) {
        System.out.println(genDefaultPass());
    }
}
