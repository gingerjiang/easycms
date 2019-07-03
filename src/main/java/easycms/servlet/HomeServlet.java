package easycms.servlet;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import easycms.base.BaseServlet;
import easycms.common.obj.Ajax;
import easycms.service.CfgService;
import easycms.service.CountService;
import easycms.service.DataService;
import easycms.service.FieldService;
import easycms.service.SubjectService;

@WebServlet("/cms/home")
public class HomeServlet extends BaseServlet {

	@Inject
	CfgService cfgService;
	@Inject
	SubjectService subjectService;
	@Inject
	FieldService fieldService;
	@Inject
	DataService dataService;
	@Inject
	CountService countService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = getDefaultString("action", "", request);
		try {
			switch (action) {
			case "numSubjectCode":
				numSubjectCode(request, response);
				break;
			case "numMonth":
				numMonth(request, response);
				break;
			case "clearCache":
				clearCache(request, response);
				break;
			default:
				index(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.write(new Ajax(false, "出现错误"+e.getMessage()), response);
		}
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    forward(prefix + "home/index.jsp", request, response);
	}

		
	private void numSubjectCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = countService.numSubjectCode();
		this.write(map, response);
	}
	private void numMonth(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = countService.numMonth();
		this.write(map, response);
	}
	private void clearCache(HttpServletRequest request, HttpServletResponse response) {
		this.write(new Ajax(true, "清除成功"), response);
	}
}
