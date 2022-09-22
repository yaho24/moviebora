package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Stars;

public class StarsDao 
{
	private static StarsDao instance = new StarsDao();
	
	private StarsDao() { }
	
	public static StarsDao getInstance()
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

	public int getTotal(String memberId) // 별점 먹인 수 
	{
		return (int)session.selectOne("starsns.getTotal", memberId);
	}

	public List<Stars> StarsList(String memberId) // 별점 먹인 영화 리스트
	{
		return session.selectList("starsns.starsList", memberId);
	}

	public List<Stars> starsPageList(int memberNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> starsMap = new HashMap<>();
		starsMap.put("memberNo", memberNo);
		starsMap.put("startRow", startRow);
	    starsMap.put("endRow", endRow);
	    
		return (List<Stars>) session.selectList("starsns.starsPageList", starsMap);
	}

	public int getScore(int movieNo) 
	{
		System.out.println(" getStore movieNo ="+movieNo);
		return (int) session.selectOne("starsns.getScore", movieNo);
	}

	public int getCount(int movieNo) 
	{
		return (int) session.selectOne("starsns.getCount", movieNo);
	}

	public int average(int movieNo) 
	{
		return (int) session.selectOne("starsns.average", movieNo);
	}
}