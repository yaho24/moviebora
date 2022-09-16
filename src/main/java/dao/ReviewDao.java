package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int getTotal(int memberNo) 
	{
		return (int)session.selectOne("reviewns.getTotal", memberNo);
	}

	public List<Review> ReviewList(int memberNo) 
	{
		return session.selectList("reviewns.reviewList", memberNo);
	}

	public List<Review> reviewPageList(int memberNo, int startRow, int endRow) 
	{
		Map<String, Integer> map = new HashMap<>();
		map.put("memberNo", memberNo);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
			
		return session.selectList("reviewns.reviewPageList", map);
	}
}