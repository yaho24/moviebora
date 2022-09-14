package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Movie;
import model.Stars;

public class MovieDao 
{
	private static MovieDao instance = new MovieDao();
	
	private MovieDao() { }
	
	public static MovieDao getInstance()
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
	
	public String genre(Stars stars)
	{
		return (String)session.selectOne("moviens.genre", stars);
	}

	public List<Movie> RecommendList(String recommendGenre) 
	{
		return session.selectList("starsns.recommendList", recommendGenre);
	}
}