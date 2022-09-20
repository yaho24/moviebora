package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service1.CommandProcess;

public class LoginForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);  // index 21번째 주소

		request.setAttribute("prevUrl", prevUrl);
		
		return "loginForm";
	}

}
 