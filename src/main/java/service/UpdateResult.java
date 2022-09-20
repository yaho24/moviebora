package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class UpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// member 생성
		Member member = new Member();

		// 이전 주소
		String prevUrl = request.getParameter("prevUrl");

		// 프로필 파일 업로드
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 2;

		String id = null;

		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			id = mr.getParameter("id");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String nick_nm = request.getParameter("nick_nm");
			String gender = request.getParameter("gender");
			String profile = request.getParameter("profile");
			// member에 수정내용 세팅
			member.setMemberId(id);
			member.setMemberEmail(email);
			member.setMemberPass(password);
			member.setMemberName(name);
			member.setMemberNickname(nick_nm);
			member.setMemberGender(gender);
			member.setMemberProfile(profile);;
			

		} catch (IOException e) {
			System.out.println("에러:" + e.getMessage());
		}

		// 세션에서 id 가져옴
		HttpSession session = request.getSession();
		id = (String) session.getAttribute("id");

		// memberDao 생성 및 update
		MemberDao md = MemberDao.getInstance();
		int result = md.update(member);
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		request.setAttribute("prevUrl", prevUrl);

		return "updateResult";
	}

}
