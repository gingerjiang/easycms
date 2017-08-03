package com.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class Text {

	public static void main(String[] args) {
		File file = new File("E:/z");
		//System.out.println(txt2String(file));
		File[] fs = file.listFiles();
		for (int i = 0; i < 1; i++) {
			System.out.println(txt2String(fs[i]));
		}

	}

	/**
	 * 读取txt文件的内容
	 * 
	 * @param file
	 *            想要读取的文件对象
	 * @return 返回文件内容
	 */
	public static String txt2String(File file) {
		StringBuilder result = new StringBuilder();
		String reg="^\\d+$";
		try {
			InputStreamReader read = new InputStreamReader(new FileInputStream(file), "GBK");// 考虑到编码格式
			BufferedReader bufferedReader = new BufferedReader(read);
			String lineTxt = null;
			int i = 0;
			int a = 1;
			System.out.println("52en.me提醒：版权归原字幕组所有，仅供学习交流使用，严禁用于商业用途");
			while ((lineTxt = bufferedReader.readLine()) != null) {
				int ss = 0;
				if (lineTxt.matches(reg)) {
					continue;
				}
				ss++;
				if (lineTxt.contains("-->")) {
					continue;
				}
				ss++;
				if("".equals(lineTxt.trim())) {
					continue;
				}
				
				ss++;
				i++;
				//System.out.println(i+">>"+lineTxt);
				if (i % 252 == 0) {
					//System.out.print(i+"--");
					//System.out.println(a++ +">"+lineTxt);
					System.out.println("更多字幕www.52en.me qq3550672899");
				}
				if (i % 2 == 0) {
					//System.out.print(i+">>");
					//System.out.println(a++ +">"+lineTxt);
				}
				if (i % 2 != 0) {
					//System.out.print(i+"--");
					//System.out.println(a++ +">"+lineTxt);
					System.out.println(a++ +">"+lineTxt);
				}
			}
			System.out.println("更多字幕www.52en.me qq3550672899");
			read.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}

}
