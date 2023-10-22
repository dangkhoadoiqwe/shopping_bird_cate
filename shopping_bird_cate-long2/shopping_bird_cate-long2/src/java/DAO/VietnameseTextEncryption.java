/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author hailo
 */
public class VietnameseTextEncryption {

    public static String encrypt(String text, String secretKey) throws Exception {
        SecretKeySpec key = new SecretKeySpec(secretKey.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, key);

        byte[] encryptedText = cipher.doFinal(text.getBytes("UTF-8"));
        return Base64.encodeBase64String(encryptedText);
    }

    public static void main(String[] args) throws Exception {
        String vietnameseText = "chảo mao";
        String secretKey = "YourSecretKeyHere";
        String encryptedText = encrypt(vietnameseText, secretKey);

        System.out.println("Encrypted Text: " + encryptedText);
    }
}
