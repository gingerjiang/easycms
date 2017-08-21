package com.j4.cms.servlet;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.j4.base.BaseServlet;
import com.j4.cms.obj.Column;
import com.j4.cms.obj.Data;
import com.j4.cms.obj.Model;
import com.j4.cms.obj.Node;
import com.j4.cms.service.CfgService;
import com.j4.cms.service.ColumnService;
import com.j4.cms.service.CountService;
import com.j4.cms.service.DataService;
import com.j4.cms.service.ModelService;
import com.j4.common.obj.Ajax;
import com.j4.common.obj.Pager;
import com.j4.util.EhcacheUtil;
import com.j4.util.JsonUtil;

@WebServlet("/cms")
public class ManageServlet extends BaseServlet {

	@Inject
	CfgService cfgService;
	@Inject
	ModelService modelService;
	@Inject
	ColumnService columnService;
	@Inject
	DataService dataService;
	@Inject
	CountService countService;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		try {
			if (StringUtils.isEmpty(action)) {
				index(request, response);
			} else if ("toHome".equals(action)) {
				toHome(request, response);
			} else if ("loadModelTree".equals(action)) {
				loadModelTree(request, response);
			} else if ("toDataList".equals(action)) {
				toDataList(request, response);
			} else if ("loadData".equals(action)) {
				loadData(request, response);
			} else if ("toDataForm".equals(action)) {
				toDataForm(request, response);
			} else if ("saveData".equals(action)) {
				saveData(request, response);
			} else if ("delData".equals(action)) {
				delData(request, response);
			} else if ("pubData".equals(action)) {
				pubData(request, response);
			} else if ("backData".equals(action)) {
				backData(request, response);
			}
			//页面统计
			else if ("numModelCode".equals(action)) {
				numModelCode(request, response);
			}
			else if ("numMonth".equals(action)) {
				numMonth(request, response);
			}
			else if ("clearCache".equals(action)) {
				clearCache(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			this.write(new Ajax(false, "出现错误"+e.getMessage()), response);
		}
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Node> list = modelService.menu();
		//构造菜单
		request.setAttribute("menus", list);
		request.getRequestDispatcher(prefix + "manage/index.jsp").forward(request, response);
	}

	
	public void toHome(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getRequestDispatcher(prefix + "manage/home.jsp").forward(request, response);
	}

	private void loadModelTree(HttpServletRequest request, HttpServletResponse response) throws Exception {

		List<Node> list = modelService.findTree();

		this.write(list, response);
	}

	private void toDataList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		Column column = new Column();
		column.setModelId(model.getId());
		column.setListShow("1");
		List<Column> columns = columnService.findList(column);
		List<Map<String, Object>> colModel = getColModel(columns);
		request.setAttribute("colModel", JsonUtil.toJson(colModel));
		request.setAttribute("model", model);
		request.getRequestDispatcher(prefix + "manage/dataList.jsp").forward(request, response);
	}

	private List<Map<String, Object>> getColModel(List<Column> columns) {
		List<Map<String, Object>> cols = Lists.newArrayList();
		Map<String, Object> idKey = Maps.newHashMap();
		idKey.put("label", "主键");
		idKey.put("name", "id");
		idKey.put("key", true);
		idKey.put("hidden", true);
		cols.add(idKey);
		for (Column c : columns) {
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

	

	private void toDataForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		Column column = new Column();
		column.setModelId(model.getId());
		List<Column> columns = columnService.findList(column);

		request.setAttribute("columns", columns);
		request.setAttribute("model", model);
		
		Data entity = new Data();
		String id =  request.getParameter("id");
		if (StringUtils.isNotEmpty(id) && StringUtils.isNumeric(id)) {
			entity.setTableName(model.getTableName());
			entity.setId(Integer.parseInt(id));
			entity = dataService.get(entity);
		}
		request.setAttribute("entity", entity);
		request.getRequestDispatcher(prefix + "manage/dataForm.jsp").forward(request, response);
	}
	private void loadData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String modelId= request.getParameter("modelId");
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		Data entity = new Data();
		Pager<Data> pager = new Pager<Data>();
		pager.setPage(Integer.parseInt(page));
		pager.setRows(Integer.parseInt(rows));

		Model model = modelService.get(Integer.parseInt(modelId));
		entity.setTableName(model.getTableName());
		entity.setModelId(model.getId());
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
		int modelId = Integer.parseInt(request.getParameter("modelId"));
		data.setModelId(modelId);
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
		
		Model model = modelService.get(modelId);
		data.setTableName(model.getTableName());
		dataService.save(data);	
		this.write(new Ajax(true, "保存成功！"), response);
	}
	private void delData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		
		dataService.delete(model, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	private void pubData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		
		dataService.pub(model, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	private void backData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		
		dataService.back(model, ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	
	
	private void numModelCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = countService.numModelCode();
		this.write(map, response);
	}
	private void numMonth(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = countService.numMonth();
		this.write(map, response);
	}
	private void clearCache(HttpServletRequest request, HttpServletResponse response) {
		EhcacheUtil.clearCache();
		this.write(new Ajax(true, "清除成功"), response);
	}
}
