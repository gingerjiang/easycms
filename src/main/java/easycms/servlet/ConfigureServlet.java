package easycms.servlet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import easycms.base.BaseServlet;
import easycms.common.obj.Ajax;
import easycms.obj.Cfg;
import easycms.obj.Field;
import easycms.obj.Node;
import easycms.obj.Subject;
import easycms.service.CfgService;
import easycms.service.DataService;
import easycms.service.FieldService;
import easycms.service.SubjectService;

@WebServlet("/cms/configure")
public class ConfigureServlet extends BaseServlet {

	@Inject
	CfgService cfgService;
	@Inject
	SubjectService subjectService;
	@Inject
	FieldService fieldService;
	@Inject
	DataService dataService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = getDefaultString("action", "", request);
		try {
			switch (action) {
			case "loadSubjectTree":
				loadSubjectTree(request, response);
				break;
			case "formField":
				formField(request, response);
				break;
			case "saveField":
				saveField(request, response);
				break;
			case "loadField":
				loadField(request, response);
				break;
			case "delField":
				delField(request, response);
				break;
			case "formSubject":
				formSubject(request, response);
				break;
			case "saveSubject":
				saveSubject(request, response);
				break;
			case "delSubject":
				delSubject(request, response);
				break;
			case "copySubject":
				copySubject(request, response);
				break;
			default:
				index(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.write(new Ajax(false, "出现错误" + e.getMessage()), response);
		}
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		forward(prefix + "configure/index.jsp", request, response);
	}
	
	private void formField(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Field field = new Field();
		Integer subjectId  = Integer.parseInt(request.getParameter("subjectId"));
		field.setSubjectId(subjectId);
		
		Cfg tableCfg = new Cfg();
		tableCfg.setC(3);
		List<Cfg> types = cfgService.findList(tableCfg);
		request.setAttribute("types", types);
		tableCfg.setC(1);
		List<Cfg> maps = cfgService.findList(tableCfg);
		request.setAttribute("maps", maps);
		String id = request.getParameter("id");
		
		if (StringUtils.isNumeric(id)) {
			field = fieldService.get(Integer.parseInt(id));
		} else {
			Integer seq = fieldService.maxSeq(subjectId);
			seq = (null == seq ? 0 : seq);
			field.setSeq(seq + 10);
		}
		request.setAttribute("entity", field);
		forward(prefix + "configure/field.jsp", request, response);
	}
	private void loadSubjectTree(HttpServletRequest request, HttpServletResponse response) {
		List<Node> list = subjectService.findTree();
		this.write(list, response);
	}
	
	private void saveField(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Field field = new Field();
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			field.setId(Integer.parseInt(id));
		}
		String subjectId = request.getParameter("subjectId");
		field.setSubjectId(Integer.parseInt(subjectId));
		
		String name = request.getParameter("name");
		field.setName(name);
		String type = request.getParameter("type");
		field.setType(type);
		String mappingData = request.getParameter("mappingData");
		field.setMappingData(mappingData);
		
		String sql = request.getParameter("sql");
		field.setSql(sql);
		
		String seq = request.getParameter("seq");
		if (StringUtils.isNumeric(seq)) {
			field.setSeq(Integer.parseInt(seq));
		}
		String width = request.getParameter("width");
		if (StringUtils.isNumeric(width)) {
			field.setWidth(Integer.parseInt(width));
		}
		String allowBlank = request.getParameter("allowBlank");
		field.setAllowBlank(allowBlank);
		String listShow = request.getParameter("listShow");
		field.setListShow(listShow);
		String remark = request.getParameter("remark");
		field.setRemark(remark);
		
		fieldService.save(field);
		this.write(new Ajax(true, "保存成功"), response);
	}		

	private void loadField(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String subjectId = request.getParameter("subjectId");
		Field tableField = new Field();
		tableField.setSubjectId(Integer.parseInt(subjectId));
		List<Field> list = fieldService.findList(tableField);
		this.write(list, response);
	}
	
	
	private void delField(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		fieldService.delete(ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	
	
	
	private void formSubject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Subject subject = new Subject();
		String id = request.getParameter("id");
		
		if (StringUtils.isNumeric(id)) {
			subject = subjectService.get(Integer.parseInt(id));
		} else {
			//新增时的父节点
			Integer parentId = getInteger("parentId", request);
			subject.setParentId(parentId);
			List<Subject> childs = subjectService.getByParentId(parentId);
			if (null != childs) {
				subject.setSeq(10 * childs.size());
			}
		}
		request.setAttribute("entity", subject);
		
		forward(prefix + "configure/subject.jsp", request, response);
	}
	
	private void saveSubject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Subject subject = new Subject();
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			subject.setId(Integer.parseInt(id));
		}
		String parentId = request.getParameter("parentId");
		if (StringUtils.isNumeric(parentId)) {
			subject.setParentId(Integer.parseInt(parentId));
		}
		String name = request.getParameter("name");
		subject.setName(name);
		String tableName = request.getParameter("tableName");
		subject.setTableName(tableName);
		String seq = request.getParameter("seq");
		if (StringUtils.isNumeric(seq)) {
			subject.setSeq(Integer.parseInt(seq));
		}
		String remark = request.getParameter("remark");
		subject.setRemark(remark);
		
		subjectService.save(subject);
		this.write(new Ajax(true, "保存成功"), response);
	}		
	private void delSubject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		subjectService.delete(id);
		this.write(new Ajax(true, "删除成功"), response);
	}
	private void copySubject(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		subjectService.copy(id);
		this.write(new Ajax(true, "删除成功"), response);
	}
}
