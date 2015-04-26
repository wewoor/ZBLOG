package com.zblog.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Configer extends Properties {

	private static final long serialVersionUID = 1L;
	private static Configer instance;
	private static FileInputStream in;

	private Configer() {
		String path = this.getClass().getClassLoader()
				.getResource("config.properties").getPath();
		System.out.println("读取系统配置文件,path=" + path);
		File file = new File(path);
		try {
			in = new FileInputStream(file);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Configer getInstance() {
		if (instance == null) {
			synchronized (Configer.class) {
				if (instance == null) {
					instance = new Configer();
					try {
						instance.load(in);
					} catch (IOException e) {
						instance = null;
						e.printStackTrace();
					}
				}
			}
		}
		return instance;
	}

	public static void main(String[] arg) {
		System.out.println(Configer.getInstance().get("XJauthentication_WSDL"));
	}
}
