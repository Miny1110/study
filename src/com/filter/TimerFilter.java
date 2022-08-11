package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class TimerFilter implements Filter{

	private FilterConfig config;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		long before = System.currentTimeMillis();
		
		chain.doFilter(request, response);
		/*클라이언트의 요청이 req에 있고 서버가 넘겨줄 값이 resp에 담겨있다.
		체인이 없으면 첫번째 필터에서 다음으로 값이 넘어가지 않는다.*/
		
		long after = System.currentTimeMillis();
		
		String uri;
		
		if(request instanceof HttpServletRequest) {
			
			HttpServletRequest req = (HttpServletRequest)request;
			
			uri = req.getRequestURI();
			
			//config.getServletContext().log(uri + ":" + (after-before) + "ms");
			
			System.out.println(uri + ":" + (after-before) + "ms");
			
		}
		
		
		
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
	}

	
	
	
}
