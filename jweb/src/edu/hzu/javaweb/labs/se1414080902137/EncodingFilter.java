package com.logcd.filter;
import java.io.IOException;  
import javax.servlet.Filter;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;

public class EncodingFilter implements Filter {   
	  
    private String encoding = null;   
  
    public void destroy() {   
         encoding = null;   
     }   
  
    public void doFilter(ServletRequest request, ServletResponse response,   
             FilterChain chain) throws IOException, ServletException {   
         String encoding = getEncoding();   
        if (encoding == null){   
             encoding = "UTF-8";   
         }   
         request.setCharacterEncoding(encoding);// ��������������ָ���ı���   
         chain.doFilter(request, response);  
         
     }   
  
    public void init(FilterConfig filterConfig) throws ServletException {   
        this.encoding = filterConfig.getInitParameter("encoding");   
     }   
  
    private String getEncoding() {   
        return this.encoding;   
     }   
  
}  


