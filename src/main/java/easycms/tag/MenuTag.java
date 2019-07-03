package easycms.tag;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import easycms.context.Injection;
import easycms.obj.Node;
import easycms.service.SubjectService;

public class MenuTag extends BodyTagSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	SubjectService subjectService;
	
	String[] icons = {"icon-github-sign", "icon-lemon", "icon-twitter", "icon-facebook", "icon-group", "icon-cloud", "icon-magic", "icon-google-plus","icon-umbrella", "icon-bolt"};
	public MenuTag() {
	    Injection.INSTANCE.getInjector().injectMembers(this);
	}
	@Override
	public int doEndTag() throws JspException {
		try {
			ServletRequest request= pageContext.getRequest();
			String ctx = request.getServletContext().getContextPath();
			JspWriter out = pageContext.getOut();
			List<Node> list = subjectService.menu();
			StringBuffer html = new StringBuffer();
			for (Node node : list) {
			    int i = new Random().nextInt(1000) % 10;
				html.append("<li><a subjectId=\"").append(node.getId()).append("\" href=\"").append(ctx).append("/cms/content?action=toList&subjectId=").append(node.getId()).append("\"><i class=\"").append(icons[i]).append("\"></i>").append(node.getName()).append("\n");
				html.append("<span class=\"submenu-icon\"></span></a>").append("\n");
				recursive(node.getNodes(), html, ctx);
				html.append("</li>").append("\n");
			}
			out.println(html);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return EVAL_PAGE;
	}
	//递归处理子菜单
	private void recursive(List<Node> nodes, StringBuffer html, String ctx) {
		if (!nodes.isEmpty()) {
			html.append("<ul>").append("\n");
			for (Node ns : nodes) {
				html.append("<li><a subjectId=\"").append(ns.getId()).append("\" href=\"").append(ctx).append("/cms/content?action=toList&subjectId=").append(ns.getId()).append("\">").append(ns.getName());
				if(!ns.getNodes().isEmpty()) {
					html.append("<span class=\"submenu-icon\"></span>").append("\n");
				}
				html.append("</a>").append("\n");
				//递归处理子菜单
				recursive(ns.getNodes(), html, ctx);
				html.append("</li>").append("\n");
			}
			html.append("</ul>").append("\n");
		}
	}
}
