package easycms.front.servlet;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.thymeleaf.context.WebContext;

import easycms.base.BaseServlet;
import easycms.service.DataService;
import easycms.service.SubjectService;
@WebServlet("/front/cafe")
public class CafeServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	DataService dataService;
	@Inject
	SubjectService subjectService;
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		try {
			WebContext ctx = new WebContext(request, response, getServletContext());
			//ctx.getResponse().setCharacterEncoding("utf-8");
			if (StringUtils.isEmpty(action)) {
				index(ctx);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//this.write(new Ajax(false, "出现错误！"), response); 
	}
	
	public void index(WebContext ctx) throws Exception {
		ctx.setVariable("helloword","CafeHome");
		engine.process("cafe/index.html",ctx, ctx.getResponse().getWriter());
	}

}
