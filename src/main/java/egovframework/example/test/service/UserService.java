package egovframework.example.test.service;


import egovframework.example.test.vo.UserVO;

public interface UserService {

	public UserVO userLogin(UserVO vo) throws Exception;
	
	public int register(UserVO vo) throws Exception;
}
