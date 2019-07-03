package easycms.front.servlet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.thymeleaf.context.WebContext;

import easycms.base.BaseServlet;
import easycms.obj.Data;
import easycms.obj.Subject;
import easycms.service.DataService;
import easycms.service.SubjectService;
@WebServlet("/front/52en")
public class EnServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	DataService dataService;
	@Inject
	SubjectService subjectService;
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = getDefaultString("action", "", request);
		try {
			WebContext ctx = new WebContext(request, response, getServletContext());
			switch (action) {
			case "list":
				list(ctx);
				break;
			case "item":
				item(ctx);
				break;
			default:
				index(ctx);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void index(WebContext ctx) throws Exception {
		engine.process("52en/index.html",ctx, ctx.getResponse().getWriter());
	}
	public void list(WebContext ctx) throws Exception {
		int subjectId =getInt("subjectId", ctx.getRequest());
		List<Data> dataList = dataService.findList(subjectId);
		ctx.setVariable("dataList", dataList);
		engine.process("52en/list.html",ctx, ctx.getResponse().getWriter());
	}
	public void item(WebContext ctx) throws Exception {
		int subjectId = getInt("subjectId", ctx.getRequest());
		int dataId = getInt("dataId", ctx.getRequest());
		Data data = dataService.find(subjectId, dataId);
		ctx.setVariable("data", data);
		engine.process("52en/item.html",ctx, ctx.getResponse().getWriter());
	}
}
