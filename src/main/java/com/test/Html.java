package com.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.lang.StringUtils;

public class Html {

	public static void main(String[] args) {
		String h = Html.getHtml("http://localhost:8080/cms/index");
		System.out.println(h);
		try {
			File f = new File("D:\\workspace\\cms\\src\\main\\webapp\\index.html");
			BufferedWriter o = new BufferedWriter(new FileWriter(f));
			o.write(h);
			o.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static String getHtml(String urlString) {
		try {
			StringBuffer html = new StringBuffer();
			URL url = new URL(urlString);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			String temp;
			while ((temp = br.readLine()) != null) {
				if (StringUtils.isNotBlank(temp)) {
					temp = temp.replaceAll("/cms/", "");
					html.append(temp).append("\n");
				}
			}
			br.close();
			isr.close();
			return html.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
