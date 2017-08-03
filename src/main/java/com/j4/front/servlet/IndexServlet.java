package com.j4.front.servlet;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.j4.base.BaseServlet;
import com.j4.cms.obj.Data;
import com.j4.cms.obj.Model;
import com.j4.cms.service.DataService;
import com.j4.cms.service.ModelService;
import com.j4.common.obj.Ajax;
import com.j4.util.StringUtil;
@WebServlet("/index")
public class IndexServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	DataService dataService;
	@Inject
	ModelService modelService;
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		try {
			if (StringUtils.isEmpty(action)) {
				index(request, response);
			}
			//列表
			else if ("list".equals(action)) {
				list(request, response);
			}
			//单条明细
			else if ("detail".equals(action)) {
				detail(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.write(new Ajax(false, "出现错误！"), response); 
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.common(request, response);
		//设置主题市场打开
		request.setAttribute("all_open", "all-open");
		
		//轮播图 34
		List<Data> sliders = dataService.findList(34);
		request.setAttribute("sliders", sliders);
		
		//中间3商品 35 查3条
		List<Data> mids = dataService.findLimit(35, 3);
		request.setAttribute("mids", mids);
		//本月热卖
		//抢购44  查10条
		List<Data> hots = dataService.findLimit(44, 10);
		request.setAttribute("hots", hots);
		
		//新上架  查24条
		List<Data> hots1= dataService.findLimit(37, 6);
		request.setAttribute("hots1", hots1);
		
		//特色  查24条
		List<Data> hots2= dataService.findLimit(38, 6);
		request.setAttribute("hots2", hots2);
		//经典  查24条
		List<Data> hots3= dataService.findLimit(39, 6);
		request.setAttribute("hots3", hots3);
		//本月热卖 end
		
		//热门商品
		//左侧轮播
		List<Data> ads = dataService.findLimit(45, 5);
		request.setAttribute("ads", ads);
		
		//手机
		List<Data> put1= dataService.findLimit(41, 16);
		request.setAttribute("put1", put1);
		
		//笔记本
		List<Data> put2= dataService.findLimit(42, 6);
		request.setAttribute("put2", put2);
		//台式机
		List<Data> put3= dataService.findLimit(43, 6);
		request.setAttribute("put3", put3);
		
		//热门商品 end
		request.getRequestDispatcher(prefix + "front/index.jsp").forward(request, response);
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		this.common(request, response);
		
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		request.setAttribute("model", model);
		//查询对应品类下的产品
		List<Data> list= dataService.findLimit(Integer.parseInt(modelId), 100);
		request.setAttribute("list", list);
		request.getRequestDispatcher(prefix + "front/list.jsp").forward(request, response);
	}
	public void detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String modelId= request.getParameter("modelId");
		Model model = modelService.get(Integer.parseInt(modelId));
		request.setAttribute("model", model);
		String id =  request.getParameter("id");
		Data data = new Data();
		data.setTableName(model.getTableName());
		data.setModelId(model.getId());
		data.setId(Integer.parseInt(id));
		data = dataService.get(data);
		request.setAttribute("data", data);
		request.getRequestDispatcher(prefix + "front/detail.jsp").forward(request, response);
	}
	public void common(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//主题市场   菜单
		List<Model> models = modelService.getByParentId(2);
		for (Model model : models) {
			List<Model> childs = modelService.getByParentId(model.getId());
			model.setChilds(childs);
		}
		request.setAttribute("models", models);
	}
}
