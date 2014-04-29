package com.zblog.util;

import java.io.IOException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

@SuppressWarnings("restriction")
public class CryptUtils {
	
	private static String Algorithm = "DES";
	private static byte[] DEFAULT_KEY=new byte[] {-53, 122, -42, -88, -110, -123, -60, -74};
	private static String VALUE_ENCODING="UTF-8";

	
	/**
	 * 生成密钥
	 * 
	 * @return byte[] 返回生成的密钥
	 * @throws exception
	 *             扔出异常.
	 */
	public static byte[] getSecretKey() throws Exception {
		KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
		SecretKey deskey = keygen.generateKey();
		return deskey.getEncoded();

	}

	/**
	 * 将指定的数据根据提供的密钥进行加密
	 * 
	 * @param input
	 *            需要加密的数据
	 * @param key
	 *            密钥
	 * @return byte[] 加密后的数据
	 * @throws Exception
	 */
	public static byte[] encryptData(byte[] input, byte[] key) throws Exception {
		
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(Cipher.ENCRYPT_MODE, deskey);
		byte[] cipherByte = c1.doFinal(input);
		return cipherByte;

	}
	
	/**
	 * 加密
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public static byte[] encryptData(byte[] input) throws Exception {
		return encryptData(input, DEFAULT_KEY);
	}

	/**
	 * 将给定的已加密的数据通过指定的密钥进行解密
	 * 
	 * @param input
	 *            待解密的数据
	 * @param key
	 *            密钥
	 * @return byte[] 解密后的数据
	 * @throws Exception
	 */
	public static byte[] decryptData(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, Algorithm);
		Cipher c1 = Cipher.getInstance(Algorithm);
		c1.init(Cipher.DECRYPT_MODE, deskey);
		byte[] clearByte = c1.doFinal(input);
		return clearByte;

	}
	
	/**
	 * 解密
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public static byte[] decryptData(byte[] input) throws Exception {
		return decryptData(input, DEFAULT_KEY);
	}

	/**
	 * 字节码转换成16进制字符串
	 * 
	 * @param byte[] b 输入要转换的字节码
	 * @return String 返回转换后的16进制字符串
	 */
	public static String byte2hex(byte[] bytes) {
		StringBuilder hs = new StringBuilder();
		for(byte b : bytes)
			hs.append(String.format("%1$02X", b));
		return hs.toString();
	}

	public static byte[] hex2byte(String content) {
		int l=content.length()>>1;
		byte[] result=new byte[l];
		for(int i=0;i<l;i++) {
			int j=i<<1;
			String s=content.substring(j, j+2);
			result[i]=Integer.valueOf(s, 16).byteValue();
		}
		return result;
	}
	
	/**
	 * 将字节数组转换为base64编码字符串
	 * @param buffer
	 * @return
	 */
	public static String bytesToBase64(byte[] buffer) {
		return Base64.encode(buffer);
	}
	
	/**
	 * 将base64编码的字符串解码为字节数组
	 * @param value
	 * @return
	 * @throws IOException 
	 */
	public static byte[] base64ToBytes(String value) throws IOException {
		return Base64.decode(value);
	}
	
	/**
	 * 加密给定的字符串
	 * @param value
	 * @return 加密后的base64字符串
	 */
	public static String encryptString(String value) {
		return encryptString(value, DEFAULT_KEY);
	}
	
	/**
	 * 根据给定的密钥加密字符串
	 * @param value 待加密的字符串
	 * @param key 以BASE64形式存在的密钥
	 * @return 加密后的base64字符串
	 * @throws IOException 
	 */
	public static String encryptString(String value, String key) throws IOException {
		return encryptString(value, base64ToBytes(key));
	}
	
	/**
	 * 根据给定的密钥加密字符串
	 * @param value 待加密的字符串
	 * @param key 字节数组形式的密钥
	 * @return 加密后的base64字符串
	 */
	public static String encryptString(String value, byte[] key) {
		try {
			byte[] data=value.getBytes(VALUE_ENCODING);
			data=CryptUtils.encryptData(data, key);
			return bytesToBase64(data);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 解密字符串
	 * @param value base64形式存在的密文
	 * @return 明文
	 */
	public static String decryptString(String value) {
		return decryptString(value, DEFAULT_KEY);
	}
	
	/**
	 * 解密字符串
	 * @param value base64形式存在的密文
	 * @param key base64形式存在的密钥
	 * @return 明文
	 * @throws IOException 
	 */
	public static String decryptString(String value, String key) throws IOException {
		String s=decryptString(value, base64ToBytes(key));
		return s; 
	}
	
	/**
	 * 解密字符串
	 * @param value base64形式存在的密文
	 * @param key 字节数据形式存在的密钥
	 * @return 明文
	 */
	public static String decryptString(String value, byte[] key) {
		try {
			byte[] data=base64ToBytes(value);
			data=CryptUtils.decryptData(data, key);
			return new String(data, VALUE_ENCODING);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}