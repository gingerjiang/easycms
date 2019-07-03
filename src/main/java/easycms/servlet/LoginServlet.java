package easycms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import easycms.base.BaseServlet;
@WebServlet("/login")
public class LoginServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login doGet");
		String username = getString("username", request);
		if (StringUtils.isEmpty(username)) {
			request.setAttribute("msg", "请输入账号！");
			forward("/login.jsp", request, response);
			return;
		}
		String password = request.getParameter("password");
		if (StringUtils.isEmpty(password)) {
			request.setAttribute("msg", "请输入密码！");
			forward("/login.jsp", request, response);
			return;
		}
		Subject currentUser = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		try {
			currentUser.login(token);
			System.out.println("认证成功");
			redirect("cms/home", response);
		} catch (AuthenticationException e) {
			e.printStackTrace();
			System.out.println("认证失败");
			request.setAttribute("msg", "账号密码错误！");
			forward("/login.jsp", request, response);
			return;
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
}
