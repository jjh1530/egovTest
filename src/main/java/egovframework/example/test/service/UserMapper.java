package egovframework.example.test.service;

import egovframework.example.test.vo.UserVO;

public interface UserMapper {

	public UserVO userLogin(UserVO vo) throws Exception;
	
	public int register(UserVO vo) throws Exception;
}
