package egovframework.example.test.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.UserDao;
import egovframework.example.test.service.UserService;
import egovframework.example.test.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserVO userLogin(UserVO vo) throws Exception {
		return userDao.userLogin(vo);
	}

	@Override
	public int register(UserVO vo) throws Exception {
		return userDao.register(vo);
	}
}