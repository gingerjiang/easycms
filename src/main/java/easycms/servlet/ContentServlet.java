package easycms.servlet;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import easycms.base.BaseServlet;
import easycms.common.obj.Ajax;
import easycms.common.obj.Pager;
import easycms.obj.Data;
import easycms.obj.Field;
import easycms.obj.Node;
import easycms.obj.Subject;
import easycms.service.CfgService;
import easycms.service.CountService;
import easycms.service.DataService;
import easycms.service.FieldService;
import easycms.service.SubjectService;

@WebServlet("/cms/content")
public class ContentServlet extends BaseServlet {

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
			/*case "loadSubjectTree":
				loadSubjectTree(request, response);
				break;*/
			case "toList":
				toList(request, response);
				break;
			case "loadData":
				loadData(request, response);
				break;
			case "toForm":
				toForm(request, response);
				break;
			case "saveData":
				saveData(request, response);
				break;
			case "delData":
				delData(request, response);
				break;
				
			case "pubData":
				pubData(request, response);
				break;
			case "backData":
				backData(request, response);
				break;
			default:
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.write(new Ajax(false, "出现错误"+e.getMessage()), response);
		}
	}


	private void loadSubjectTree(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Node> list = subjectService.findTree();

		this.write(list, response);
	}

	private void toList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String subjectId= request.getParameter("subjectId");
		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		Field field = new Field();
		field.setSubjectId(subject.getId());
		field.setListShow("1");
		List<Field> fields = fieldService.findList(field);
		List<Map<String, Object>> colSubject = getColSubject(fields);
		request.setAttribute("colModel", JSON.toJSONString(colSubject));
		request.setAttribute("subject", subject);
		forward(prefix + "content/list.jsp", request, response);
	}

	private List<Map<String, Object>> getColSubject(List<Field> fields) {
		List<Map<String, Object>> cols = Lists.newArrayList();
		Map<String, Object> idKey = Maps.newHashMap();
		idKey.put("label", "主键");
		idKey.put("name", "id");
		idKey.put("key", true);
		idKey.put("hidden", true);
		cols.add(idKey);
		for (Field c : fields) {
			Map<String, Object> col = Maps.newHashMap();
			col.put("label", c.getName());
			col.put("name", c.getMappingData());
			col.put("width", c.getWidth());
			cols.add(col);
		}
		
		Map<String, Object> createBy = Maps.newHashMap();
		createBy.put("label", "创建人");
		createBy.put("name", "createBy");
		createBy.put("width", 100);
		cols.add(createBy);
		Map<String, Object> createTime = Maps.newHashMap();
		createTime.put("label", "创建时间");
		createTime.put("name", "createTime");
		createTime.put("width", 140);
		cols.add(createTime);
		
		/*Map<String, Object> updateBy = Maps.newHashMap();
		updateBy.put("label", "更新人");
		updateBy.put("name", "updateBy");
		updateBy.put("width", 100);
		cols.add(updateBy);
		Map<String, Object> updateTime = Maps.newHashMap();
		updateTime.put("label", "更新时间");
		updateTime.put("name", "updateTime");
		updateTime.put("width", 140);
		cols.add(updateTime);*/
		return cols;
	}

	

	private void toForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String subjectId= request.getParameter("subjectId");
		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		Field field = new Field();
		field.setSubjectId(subject.getId());
		List<Field> fields = fieldService.findList(field);

		request.setAttribute("fields", fields);
		request.setAttribute("subject", subject);
		
		Data entity = new Data();
		String id =  request.getParameter("id");
		if (StringUtils.isNotEmpty(id) && StringUtils.isNumeric(id)) {
			entity.setTableName(subject.getTableName());
			entity.setId(Integer.parseInt(id));
			entity = dataService.get(entity);
		}
		request.setAttribute("entity", entity);
		forward(prefix + "content/form.jsp", request, response);
	}
	private void loadData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String subjectId= request.getParameter("subjectId");
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		Data entity = new Data();
		Pager<Data> pager = new Pager<Data>();
		pager.setPage(Integer.parseInt(page));
		pager.setRows(Integer.parseInt(rows));

		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		entity.setTableName(subject.getTableName());
		entity.setSubjectId(subject.getId());
		//查询条件
		String c1 = request.getParameter("c1");
		entity.setC1(c1);
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		
		if (StringUtils.isNotEmpty(date1)) {
			DateTime dt = new DateTime(date1);
			entity.setDate1(dt.toDate());
		}
		if (StringUtils.isNotEmpty(date2)) {
			DateTime dt = new DateTime(date2).plusDays(1);
			entity.setDate2(dt.toDate());
		}
		pager = dataService.findPage(pager, entity);

		this.write(pager, response);
	}
	private void saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Data data = new Data();
		String id = request.getParameter("id");
		//更新
		if (StringUtils.isNotEmpty(id) && StringUtils.isNumeric(id)) {
			data.setId(Integer.parseInt(id));
			data.setUpdateTime(new Date());
			data.setUpdateBy("admin");
		}
		//新增
		else {
			data.setCreateTime(new Date());
			data.setCreateBy("admin");
		}
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		data.setSubjectId(subjectId);
		data.setC1(request.getParameter("c1"));
		data.setC2(request.getParameter("c2"));
		data.setC3(request.getParameter("c3"));
		data.setC4(request.getParameter("c4"));
		data.setC5(request.getParameter("c5"));
		data.setC6(request.getParameter("c6"));
		data.setC7(request.getParameter("c7"));
		data.setC8(request.getParameter("c8"));
		data.setC9(request.getParameter("c9"));
		data.setC10(request.getParameter("c10"));
		data.setC11(request.getParameter("c11"));
		data.setC12(request.getParameter("c12"));
		data.setC13(request.getParameter("c13"));
		data.setC14(request.getParameter("c14"));
		data.setC15(request.getParameter("c15"));
		data.setC16(request.getParameter("c16"));
		
		Subject subject = subjectService.get(subjectId);
		data.setTableName(subject.getTableName());
		dataService.save(data);	
		this.write(new Ajax(true, "保存成功！"), response);
	}
	private void delData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String subjectId= request.getParameter("subjectId");
		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		
		dataService.delete(subject, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	private void pubData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String subjectId= request.getParameter("subjectId");
		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		
		dataService.pub(subject, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	private void backData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String subjectId= request.getParameter("subjectId");
		Subject subject = subjectService.get(Integer.parseInt(subjectId));
		
		dataService.back(subject, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
}
