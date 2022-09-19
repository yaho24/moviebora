package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int genre(Stars stars)
	{
		return (int) session.selectOne("moviens.genre", stars);
	}

	public List<Movie> RecommendList(int recommendGenre) 
	{
		return session.selectList("moviens.recommendList", recommendGenre);
	}

	public List<Movie> moviePageList(int genreNo, int startRow, int endRow) 
	{
		Map<String, Integer> map = new HashMap<>();
		map.put("genreNo", genreNo);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
			
		return session.selectList("moviens.moviePageList", map);
	}
}