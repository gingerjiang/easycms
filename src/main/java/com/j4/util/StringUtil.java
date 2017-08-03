package com.j4.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * StringUtil
 * 
 */
public class StringUtil {
	public StringUtil() {
	}

	/**
	 * @param source
	 *            需要处理的字符串
	 * @param oldString
	 *            需要被替换的字符
	 * @param newString
	 *            替换后的字符
	 * @return 比如 需要替换字符串中的? String str = "Who am I ?"; replace(str,"?","%3F");
	 */
	public static String replace(String source, String oldString, String newString) {
		StringBuffer output = new StringBuffer();
		int lengthOfSource = source.length();
		int lengthOfOld = oldString.length();
		int posStart = 0;
		int pos; //
		while ((pos = source.indexOf(oldString, posStart)) >= 0) {
			output.append(source.substring(posStart, pos));
			output.append(newString);
			posStart = pos + lengthOfOld;
		}
		if (posStart < lengthOfSource) {
			output.append(source.substring(posStart));
		}
		return output.toString();
	}

	/**
	 * @param resource
	 *            需要处理的字符串
	 * @param �������
	 *            1-2 /3 .4 5
	 *            _6,7<8>9+10%11*12(13)14=15\16|17!18@19#20$21^22&23[
	 *            24]25{26}27;28:29'30"31?
	 * @return 返回替换后的字符串
	 */
	public static String changesc(String resource) {
		String changeString = "";
		changeString = resource;
		if (changeString.indexOf("-") > -1) {// 1-替换 破折号 反斜杠 点好 空格 下划线 逗号 分号
			changeString = StringUtil.replace(changeString, "-", "_1");
		}
		if (changeString.indexOf("/") > -1) {// 2 /
			changeString = StringUtil.replace(changeString, "/", "_2");
		}
		if (changeString.indexOf(".") > -1) {// 3 .
			changeString = StringUtil.replace(changeString, ".", "_3");
		}
		if (changeString.indexOf(" ") > -1) {// 4
			changeString = StringUtil.replace(changeString, " ", "_4");
		}
		if (changeString.indexOf("_") > -1) {// 5 _
			changeString = StringUtil.replace(changeString, "_", "_5");
		}
		if (changeString.indexOf(",") > -1) {// 6,
			changeString = StringUtil.replace(changeString, ",", "_6");
		}
		if (changeString.indexOf("<") > -1) {// 7<
			changeString = StringUtil.replace(changeString, "<", "_7");
		}
		if (changeString.indexOf(">") > -1) {// 8>
			changeString = StringUtil.replace(changeString, ">", "_8");
		}
		if (changeString.indexOf("+") > -1) {// 9+
			changeString = StringUtil.replace(changeString, "+", "_9");
		}
		if (changeString.indexOf("%") > -1) {// 10%
			changeString = StringUtil.replace(changeString, "%", "_10");
		}
		if (changeString.indexOf("*") > -1) {// 11*
			changeString = StringUtil.replace(changeString, "*", "_11");
		}
		if (changeString.indexOf("(") > -1) {// 12(
			changeString = StringUtil.replace(changeString, "(", "_12");
		}
		if (changeString.indexOf(")") > -1) {// 13)
			changeString = StringUtil.replace(changeString, ")", "_13");
		}
		if (changeString.indexOf("=") > -1) {// 14=
			changeString = StringUtil.replace(changeString, "=", "_14");
		}
		if (changeString.indexOf("\\") > -1) {// 15\
			changeString = StringUtil.replace(changeString, "\\", "_15");
		}
		if (changeString.indexOf("|") > -1) {// 16|
			changeString = StringUtil.replace(changeString, "|", "_16");
		}
		if (changeString.indexOf("!") > -1) {// 17!
			changeString = StringUtil.replace(changeString, "!", "_17");
		}
		if (changeString.indexOf("@") > -1) {// 18@
			changeString = StringUtil.replace(changeString, "@", "_18");
		}
		if (changeString.indexOf("#") > -1) {// 19#
			changeString = StringUtil.replace(changeString, "#", "_19");
		}
		if (changeString.indexOf("$") > -1) {// 20$
			changeString = StringUtil.replace(changeString, "$", "_20");
		}
		if (changeString.indexOf("^") > -1) {// 21^
			changeString = StringUtil.replace(changeString, "^", "_21");
		}
		if (changeString.indexOf("&") > -1) {// 22&
			changeString = StringUtil.replace(changeString, "&", "_22");
		}
		if (changeString.indexOf("[") > -1) {// 23[
			changeString = StringUtil.replace(changeString, "[", "_23");
		}
		if (changeString.indexOf("]") > -1) {// 24]
			changeString = StringUtil.replace(changeString, "]", "_24");
		}
		if (changeString.indexOf("{") > -1) {// 25{
			changeString = StringUtil.replace(changeString, "{", "_25");
		}
		if (changeString.indexOf("}") > -1) {// 26}
			changeString = StringUtil.replace(changeString, "}", "_26");
		}
		if (changeString.indexOf(";") > -1) {// 27;
			changeString = StringUtil.replace(changeString, ";", "_27");
		}
		if (changeString.indexOf(":") > -1) {// 28:
			changeString = StringUtil.replace(changeString, ":", "_28");
		}
		if (changeString.indexOf("'") > -1) {// 29'
			changeString = StringUtil.replace(changeString, "'", "_29");
		}
		if (changeString.indexOf("\"") > -1) {// 30"
			changeString = StringUtil.replace(changeString, "\"", "_30");
		}
		if (changeString.indexOf("?") > -1) {// 31?
			changeString = StringUtil.replace(changeString, "?", "_31");
		}

		return changeString;

	}

	public static boolean isNumberic(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	/**
	 * 将传入的字符串转换为十六进制字符串
	 * 
	 * @param str
	 *            String , 待转换的字符串
	 * @return String , 转换完成的十六进制字符串
	 */
	public static String toHex(String str) {
		StringBuffer buff = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			if (Character.isLetter(str.charAt(i)) || Character.isDigit(str.charAt(i))) {
				buff.append(str.charAt(i));
			} else {
				buff.append(Integer.toHexString(str.charAt(i)));
			}
		}

		return buff.toString();
	}

	public static List<String> getImg(String s) {
		String regex;
		List<String> list = new ArrayList<String>();
		regex = "src=\"(.*?)\"";
		Pattern pa = Pattern.compile(regex, Pattern.DOTALL);
		Matcher ma = pa.matcher(s);
		while (ma.find()) {
			list.add(ma.group());
		}
		return list;
	}

	/**
	 * 返回存有图片地址的数组
	 * 
	 * @param tar
	 * @return
	 */
	public static String[] getImgaddress(String tar) {
		List<String> imgList = getImg(tar);

		String res[] = new String[imgList.size()];

		if (imgList.size() > 0) {
			for (int i = 0; i < imgList.size(); i++) {
				int begin = imgList.get(i).indexOf("\"") + 1;
				int end = imgList.get(i).lastIndexOf("\"");
				String url[] = imgList.get(i).substring(begin, end).split("/");
				res[i] = url[url.length - 1];
			}
		} else {
		}
		return res;
	}
}
