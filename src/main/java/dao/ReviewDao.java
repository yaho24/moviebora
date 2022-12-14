package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review;
import model.Stars;

public class ReviewDao 
{
	private static ReviewDao instance = new ReviewDao();
	
	private ReviewDao() { }
	
	public static ReviewDao getInstance()
	{
		return instance;
	}
	
	private static SqlSession session;
	
	static
	{
		try
		{
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			//	openSession(true) : 입력/삭제/수정 후에 commit : 뭔지모름 ㅋㅋ
			session = ssf.openSession(true);
			// reader.close(); : 얘도 왜들어가있는지 모름
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
	}

	public int getTotal(String memberId) 
	{
		return (int)session.selectOne("reviewns.getTotal", memberId);
	}

	public List<Review> ReviewList(String memberId) 
	{
		return session.selectList("reviewns.reviewList", memberId);
	}

	public List<Review> reviewPageList(int memberNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("memberNo", memberNo);
		reviewMap.put("startRow", startRow);
		reviewMap.put("endRow", endRow);
	    
		return (List<Review>) session.selectList("reviewns.reviewPageList", reviewMap);
	}
}