package com.j4.cms.servlet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.j4.base.BaseServlet;
import com.j4.cms.obj.Node;
import com.j4.cms.obj.Cfg;
import com.j4.cms.obj.Column;
import com.j4.cms.obj.Model;
import com.j4.cms.service.CfgService;
import com.j4.cms.service.DataService;
import com.j4.cms.service.ColumnService;
import com.j4.cms.service.ModelService;
import com.j4.common.obj.Ajax;

@WebServlet("/cms/table")
public class TableServlet extends BaseServlet {

	@Inject
	CfgService cfgService;
	@Inject
	ModelService modelService;
	@Inject
	ColumnService columnService;
	@Inject
	DataService dataService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		try {
			if (StringUtils.isEmpty(action)) {
				index(request, response);
			}
			else if ("loadModelTree".equals(action)) {
				loadModelTree(request, response);
			} else if ("formColumn".equals(action)) {
				formColumn(request, response);
			} else if ("saveColumn".equals(action)) {
				saveColumn(request, response);
			} else if ("loadColumn".equals(action)) {
				loadColumn(request, response);
			} else if ("delColumn".equals(action)) {
				delColumn(request, response);
			}
			else if ("formModel".equals(action)) {
				formModel(request, response);
			}  else if ("saveModel".equals(action)) {
				saveModel(request, response);
			}  else if ("delModel".equals(action)) {
				delModel(request, response);
			} 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.write(new Ajax(false, "出现错误"), response);
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getRequestDispatcher(prefix + "model/index.jsp").forward(request, response);
	}
	
	private void formColumn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Column column = new Column();
		String modelId  = request.getParameter("modelId");
		column.setModelId(Integer.parseInt(modelId));
		
		Cfg tableCfg = new Cfg();
		tableCfg.setC(3);
		List<Cfg> types = cfgService.findList(tableCfg);
		request.setAttribute("types", types);
		tableCfg.setC(1);
		List<Cfg> maps = cfgService.findList(tableCfg);
		request.setAttribute("maps", maps);
		String id = request.getParameter("id");
		
		if (StringUtils.isNumeric(id)) {
			column = columnService.get(Integer.parseInt(id));
		}
		request.setAttribute("entity", column);
		request.getRequestDispatcher(prefix + "model/formColumn.jsp").forward(request, response);
	}
	private void loadModelTree(HttpServletRequest request, HttpServletResponse response) {
		List<Node> list = modelService.findTree();
		this.write(list, response);
	}
	
	private void saveColumn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Column column = new Column();
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			column.setId(Integer.parseInt(id));
		}
		String modelId = request.getParameter("modelId");
		column.setModelId(Integer.parseInt(modelId));
		
		String name = request.getParameter("name");
		column.setName(name);
		String type = request.getParameter("type");
		column.setType(type);
		String mappingData = request.getParameter("mappingData");
		column.setMappingData(mappingData);
		String seq = request.getParameter("seq");
		if (StringUtils.isNumeric(seq)) {
			column.setSeq(Integer.parseInt(seq));
		}
		String width = request.getParameter("width");
		if (StringUtils.isNumeric(width)) {
			column.setWidth(Integer.parseInt(width));
		}
		String allowBlank = request.getParameter("allowBlank");
		column.setAllowBlank(allowBlank);
		String listShow = request.getParameter("listShow");
		column.setListShow(listShow);
		String remark = request.getParameter("remark");
		column.setRemark(remark);
		
		columnService.save(column);
		this.write(new Ajax(true, "保存成功"), response);
	}		

	private void loadColumn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String modelId = request.getParameter("modelId");
		Column tableColumn = new Column();
		tableColumn.setModelId(Integer.parseInt(modelId));
		List<Column> list = columnService.findList(tableColumn);
		this.write(list, response);
	}
	
	
	private void delColumn(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String ids = request.getParameter("ids");
		columnService.delete(ids);
		this.write(new Ajax(true, "删除成功"), response);
	}
	
	
	
	private void formModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Model model = new Model();
		String id = request.getParameter("id");
		
		if (StringUtils.isNumeric(id)) {
			model = modelService.get(Integer.parseInt(id));
		} else {
			//新增时的父节点
			String parentId = request.getParameter("parentId");
			model.setParentId(Integer.parseInt(parentId));
		}
		request.setAttribute("entity", model);
		
		
		request.getRequestDispatcher(prefix + "model/formModel.jsp").forward(request, response);
	}
	
	private void saveModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Model model = new Model();
		String id = request.getParameter("id");
		if (StringUtils.isNotEmpty(id)) {
			model.setId(Integer.parseInt(id));
		}
		String parentId = request.getParameter("parentId");
		if (StringUtils.isNumeric(parentId)) {
			model.setParentId(Integer.parseInt(parentId));
		}
		String name = request.getParameter("name");
		model.setName(name);
		String tableName = request.getParameter("tableName");
		model.setTableName(tableName);
		String seq = request.getParameter("seq");
		if (StringUtils.isNumeric(seq)) {
			model.setSeq(Integer.parseInt(seq));
		}
		String remark = request.getParameter("remark");
		model.setRemark(remark);
		
		modelService.save(model);
		this.write(new Ajax(true, "保存成功"), response);
	}		
	private void delModel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		modelService.delete(id);
		this.write(new Ajax(true, "删除成功"), response);
	}
	
}
