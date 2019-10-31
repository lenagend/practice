package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SqlSession session;
	
	public User getUser(String id) {
		
		return session.selectOne("mapper.myMapper.getUser",id);
	}

	public String getPassword(String id) {
		
		return session.selectOne("mapper.myMapper.getPassword",id);
	}

	public Integer getIdCount(String id) {
	
		return session.selectOne("mapper.myMapper.checkId",id);
	}

}
