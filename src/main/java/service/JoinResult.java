package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class JoinResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String nick_nm = request.getParameter("nick_nm");
		String gender = request.getParameter("gender");
		String profile = request.getParameter("profile");
				
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberEmail(email);
		member.setMemberPass(password);
		member.setMemberName(name);
		member.setMemberNickname(nick_nm);
		member.setMemberGender(gender);
		member.setMemberProfile(profile);;
		
		MemberDao md = MemberDao.getInstance();
		Member m1 = md.select(id);
		int result = 0;
		if(m1 == null) result=md.insert(member);
		else result = -1;
		request.setAttribute("result", result);
		return "joinResult";
	}

}
