package easycms.thymeleaf;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ITemplateResolver;
import org.thymeleaf.templateresolver.ServletContextTemplateResolver;

import easycms.thymeleaf.dialect.EasyDialect;
import easycms.util.ThymeleafUtil;

/**
 * Thymeleaf configuration.
 * 启动初始化模板引擎
 */
@WebListener
public class ThymeleafConfig implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
		TemplateEngine engine = templateEngine(sce.getServletContext());
		ThymeleafUtil.storeTemplateEngine(sce.getServletContext(), engine);
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}

	private TemplateEngine templateEngine(ServletContext servletContext) {
		TemplateEngine engine = new TemplateEngine();
		engine.setTemplateResolver(templateResolver(servletContext));
		engine.addDialect(new EasyDialect("data"));
		return engine;
	}

	private ITemplateResolver templateResolver(ServletContext servletContext) {
		ServletContextTemplateResolver resolver = new ServletContextTemplateResolver(servletContext);
		//路径
		resolver.setPrefix("template/");
		resolver.setCharacterEncoding("utf-8");
		//类型
		resolver.setTemplateMode(TemplateMode.HTML);
		resolver.setCacheable(false);
		return resolver;
	}
}
