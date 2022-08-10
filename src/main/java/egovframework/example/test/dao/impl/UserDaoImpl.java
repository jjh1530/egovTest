package egovframework.example.test.dao.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.dao.UserDao;
import egovframework.example.test.service.UserMapper;
import egovframework.example.test.vo.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public UserVO userLogin(UserVO vo) throws Exception {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.userLogin(vo);
	}
	
	@Override
	public int register(UserVO vo) throws Exception {
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		return mapper.register(vo);
	}
}
