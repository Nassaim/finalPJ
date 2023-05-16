package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		System.out.println("CustomLogoutSuccessHandler...");

		if (authentication != null && authentication.getDetails() != null) {
			try {
				String name = authentication.getName();
				System.out.println(name);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.setStatus(HttpServletResponse.SC_OK);
		response.sendRedirect("/");

	}
}
