package easycms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 编码设置过滤器
 * 
 */
public class CharsetEncodingFilter implements Filter {

    private String charsetEncoding;

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {
        request.setCharacterEncoding(charsetEncoding);
        response.setCharacterEncoding(charsetEncoding);
        filterChain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        charsetEncoding = config.getInitParameter("charsetEncoding");
    }

}
