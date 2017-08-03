package com.j4.jsoup;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
	    String url = "http://elllo.org/video/VM051.htm";
	    Document doc = Jsoup.connect(url)
	    		.header("Accept", "*/*")
				.header("Accept-Encoding", "gzip, deflate")
				.header("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3")
				.header("Referer", "https://www.baidu.com/")
				.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0")
				.timeout(5000)
	    		.get();
	    Elements divs = doc.select("#content table tr");
	    List<String> titles = new ArrayList<>();
	    List<String> contens = new ArrayList<>();
	    try {
			for (Element element : divs) {
				//System.out.println(element.toString());
				/*Element td1 = element.select("td:eq(0)").first();
				String href = td1.select("a").attr("href");*/
				Element td2 = element.select("td:eq(1)").first();
				String text = td2.select("a").text();
				String href = td2.select("a").attr("href");
				//System.out.println(href +">>"+ text);
				if (StringUtils.isEmpty(href)) {
					continue;
				}
				
				//http://elllo.org/video/M001/M001Athletes.htm
				doc = Jsoup.connect("http://elllo.org/video/"+href)
			    		.header("Accept", "*/*")
						.header("Accept-Encoding", "gzip, deflate")
						.header("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3")
						.header("Referer", "https://www.baidu.com/")
						.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0")
						.timeout(5000)
			    		.get();
				href = href.replace(".htm", "");
				href = href.replace("M051/M", "<font color='red'>@</font>");
				titles.add(href +">>"+ text);
				String ees = doc.select(".transcript").html();
				//System.out.println(ees);
				contens.add(ees);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    System.out.println(titles.size());
	    System.out.println(contens.size());
	    for (int i = titles.size()-1; i >=0; i--) {
	    	System.out.println(titles.get(i));
	    	System.out.println(contens.get(i));
	    }
	}

}
