package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	 
	public static MemberDao getInstance() {
		return instance;
	}

	private static SqlSession session;
		static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
				reader.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// joinResult, IdConfirm, LoginResult
		public Member select(String id) {
			return (Member) session.selectOne("memberns.select", id);
		}
		
		// confirmNick_nm
		public Member confirmNick(String nick_nm) {
			return (Member) session.selectOne("memberns.confirmNick", nick_nm);
		}
		
		// joinResult
		public int insert(Member member) {			
			return session.insert("memberns.insert", member);
		}
		
		// FindIdResult
		public Member findId(String name, String phone) {
//			System.out.println("name= "+name);
//			System.out.println("phone= "+phone);
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("name", name);
			hm.put("phone", phone);
			return (Member) session.selectOne("memberns.findId", hm);
		}
		
		// FindPwResult
		public Member findPassword(String id, String name) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("id", id);
			hm.put("name", name);
			return (Member) session.selectOne("memberns.findPassword", hm);
		}
		
		// UpdateResult
		public int update(Member member) {
			return session.update("memberns.update", member);
		}

		// Delete
		public int delete(int mno) {
			return session.update("memberns.delete", mno);
		}
		
		//AdminMember - 전체 회원정보 조회
		public List<Member> list(int startRow, int endRow) {
			HashMap<String, Integer> hm = new HashMap<>();
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
			return (List<Member>)session.selectList("memberns.list",hm);
		}
		
		//AdminMember - 총 회원수
		public int getTotal() {
			return (int) session.selectOne("memberns.getTotal");
		}
		
		// 다른 테이블에서 회원번호를 활용한 닉네임 찾기
		public String selectNick(int mno) {
			return (String) session.selectOne("memberns.selectNick", mno);
		}
		
		// 다른 테이블에서 세션 아이디를 활용한 회원번호 찾기
		public int selectMno(String id) {
			return (int) session.selectOne("memberns.selectMno", id);
		}
		
		// mno로 회원 정보 조회
		public Member select(int mno) {
			return (Member) session.selectOne("memberns.selectReserve", mno);
		}
		
		// adminFindMember 관리자계정으로 member 검색
		public List<Member> searchMember(String searchKey, String searchValue) {
			HashMap<String, String> hm = new HashMap<>();
			hm.put("searchKey", searchKey);
			hm.put("searchValue", searchValue);
			return (List<Member>)session.selectList("memberns.searchMember",hm);
		}

}
