package dao;

import java.io.Reader;
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

	public int getTotal(String id) // 별점 먹인 수 
	{
		return (int)session.selectOne("starsns.getTotal", id);
	}

	public List<Stars> StarsList(String id) // 별점 먹인 영화 리스트
	{
		return session.selectList("starsns.starsList", id);
	}
}