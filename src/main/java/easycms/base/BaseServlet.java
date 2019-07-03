package easycms.base;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.thymeleaf.TemplateEngine;

import com.alibaba.fastjson.JSON;

import easycms.context.Injection;
import easycms.util.ThymeleafUtil;

public class BaseServlet extends HttpServlet {

    /**
     * 
     */
    protected TemplateEngine engine;

    private static final long serialVersionUID = 1L;

    protected static final String prefix = "/WEB-INF/views/";

    public void init() throws ServletException {
        super.init();
        Injection.INSTANCE.getInjector().injectMembers(this);
        engine = ThymeleafUtil.getTemplateEngine(getServletContext());
    }

    public String getString(String name, HttpServletRequest request) {
        return request.getParameter(name);
    }

    public String getDefaultString(String name, String defaultString, HttpServletRequest request) {
        return StringUtils.defaultString(request.getParameter(name), defaultString);
    }

    public Integer getInteger(String name, HttpServletRequest request) {
        String value = request.getParameter(name);
        if (StringUtils.isEmpty(value)) {
            return null;
        }
        return Integer.parseInt(value);
    }

    public int getInt(String name, HttpServletRequest request) {
        String value = request.getParameter(name);
        return Integer.parseInt(value);
    }

    public void write(String s, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(s);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (null != out) {
                out.close();
            }
        }

    }

    // 直接转json写出去
    public void write(Object o, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=utf-8");
            out = response.getWriter();
            out.print(JSON.toJSON(o));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

    public void forward(String url, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(url).forward(request, response);
    }

    public void redirect(String url, HttpServletResponse response) throws IOException {
        response.sendRedirect(url);
    }
}
