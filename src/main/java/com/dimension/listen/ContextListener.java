package com.dimension.listen;

import java.io.IOException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.dimension.serviceImpl.CaseAssitImpl;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * Application Lifecycle Listener implementation class SessionListen
 *
 */
@WebListener
public class ContextListener implements ServletContextListener  {
	private static WebApplicationContext context;
	private CaseAssitImpl caseAssit;
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		context = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
		caseAssit = (CaseAssitImpl) context.getBean("CaseAssitImpl");
		try {
			caseAssit.computeUseLDA();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {

	}
}
