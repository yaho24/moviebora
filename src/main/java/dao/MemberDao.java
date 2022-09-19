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
	private MemberDao() { }
	 
	public static MemberDao getInstance() 
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
			session = ssf.openSession(true);
			reader.close();
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
	}		
			
	public Member select(int memberNo) 
	{		
		return (Member) session.selectOne("memberns.select", memberNo);
	}

	public int insert(Member member) 
	{		
		return session.insert("memberns.insert", member);
	}
}