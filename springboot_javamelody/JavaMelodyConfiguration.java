package com.github.maximegris.monitoring;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.embedded.ServletContextInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

import net.bull.javamelody.MonitoringFilter;
import net.bull.javamelody.Parameter;
import net.bull.javamelody.SessionListener;

/**
 * Class of configuration of JavaMelody's monitoring.
 */
@Configuration
@ImportResource("classpath:net/bull/javamelody/monitoring-spring.xml")
public class JavaMelodyConfiguration implements ServletContextInitializer {

	/**
	 * Init servlet.
	 */
	@Override
	public void onStartup(final ServletContext servletContext) throws ServletException {
		servletContext.addListener(new SessionListener());
	}

	/**
	 * Add JavaMelody filter
	 *
	 * @return the filter of servlet
	 */
	@Bean
	public FilterRegistrationBean javaMelody() {
		final FilterRegistrationBean javaMelody = new FilterRegistrationBean();
		javaMelody.setFilter(new MonitoringFilter());
		javaMelody.setName("monitoring");

		// https://github.com/javamelody/javamelody/wiki/UserGuide#6-optional-parameters
		javaMelody.addInitParameter(Parameter.LOG.getCode(), Boolean.toString(true));
		// Charts resolution
		javaMelody.addInitParameter(Parameter.RESOLUTION_SECONDS.getCode(), "300");
		// URI path
		javaMelody.addInitParameter(Parameter.MONITORING_PATH.getCode(), "/monitoring");
		// Auth user profil
		javaMelody.addInitParameter(Parameter.AUTHORIZED_USERS.getCode(), "login:password");

		javaMelody.addUrlPatterns("/*");
		return javaMelody;
	}
}