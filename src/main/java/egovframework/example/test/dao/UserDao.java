package egovframework.example.test.dao;


import egovframework.example.test.vo.UserVO;

public interface UserDao {

	public UserVO userLogin(UserVO vo) throws Exception;

	public int register(UserVO vo) throws Exception;

	public UserVO registerCheck(String userid) throws Exception;
}
	
