package easycms.util;

import javax.servlet.ServletContext;

import org.thymeleaf.TemplateEngine;

public class ThymeleafUtil {
	
	private static final String TEMPLATE_ENGINE_ATTR = "easycms.thymeleaf3.TemplateEngineInstance";

	public static void storeTemplateEngine(ServletContext context, TemplateEngine engine) {
		context.setAttribute(TEMPLATE_ENGINE_ATTR, engine);
	}

	public static TemplateEngine getTemplateEngine(ServletContext context) {
		return (TemplateEngine) context.getAttribute(TEMPLATE_ENGINE_ATTR);
	}

}
