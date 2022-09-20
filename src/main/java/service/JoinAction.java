package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String memberNickname = request.getParameter("memberNickname");
		String password = request.getParameter("password");	
		String gender = request.getParameter("gender");
		String profile = request.getParameter("profile");
		
		Member member = new Member();	//member 화면에서 입력한 데이터를 받기 위한 객체(도시락)
		member.setMemberEmail(memberId);
		member.setMemberId(memberName);
		member.setMemberEmail(email);
		member.setMemberNickname(memberNickname);
		member.setMemberPass(password);
		member.setMemberGender(gender);
		member.setMemberProfile(profile);
		
		MemberDao md = MemberDao.getInstance();
		Member member1 = md.select(memberId);  // member2 DB에서 중복인지 확인하기 위한 객체
		if(member1 == null) result = md.insert(member1);
		else result = -1;   // 이미 있는 데이터
		request.setAttribute("result", result);
		return "join";
	}

}
