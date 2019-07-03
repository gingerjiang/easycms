package easycms.front.servlet;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.thymeleaf.context.WebContext;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import easycms.base.BaseServlet;
import easycms.obj.Data;
import easycms.obj.Subject;
import easycms.service.DataService;
import easycms.service.SubjectService;
@WebServlet("/front/n52en")
public class N52enServlet extends BaseServlet {
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
		
		List<Data> dataList = dataService.findLimit(3, 20);
		Map<String, List<Data>> dataMap = Maps.newHashMap();
		int len = 4;//均分4份，用于前端页面显示数据
		int size = dataList.size();  
		int remaider = size % len; // (先计算出余数)
		int number = size / len; // 然后是商
		int offset = 0;// 偏移量
		for (int i = 0; i < len; i++) {
			List<Data> subList = Lists.newArrayList();
			if (remaider > 0) {
				subList = dataList.subList(i * number + offset, (i + 1) * number + offset + 1);
				remaider--;
				offset++;
			} else {
				subList = dataList.subList(i * number + offset, (i + 1) * number + offset);
			}
			dataMap.put("list" + i, subList);
		}
		ctx.setVariable("dataMap", dataMap);
		engine.process("w3layouts1/index.html",ctx, ctx.getResponse().getWriter());
	}
	public void list(WebContext ctx) throws Exception {
		int subjectId = getInt("subjectId", ctx.getRequest());
		List<Data> dataList = dataService.findList(subjectId);
		ctx.setVariable("dataList", dataList);
		engine.process("52en/list.html",ctx, ctx.getResponse().getWriter());
	}
	public void item(WebContext ctx) throws Exception {
		int subjectId = getInt("subjectId", ctx.getRequest());
		Subject subject = subjectService.get(subjectId);
		int dataId = getInt("dataId", ctx.getRequest());
		Data data = dataService.find(subjectId, dataId);
		ctx.setVariable("data", data);
		ctx.setVariable("subject", subject);
		engine.process("w3layouts1/item.html",ctx, ctx.getResponse().getWriter());
	}
}
