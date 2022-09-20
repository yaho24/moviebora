package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class ConfirmEmail implements CommandProcess {

		public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String msg="";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(email);
		if(member==null) msg="사용가능한 Email 입니다";
		else msg = "이미 사용중인 Email 입니다.";
		request.setAttribute("msg", msg);
		return "confirmEmail";
	}

}
