package egovframework.example.test.dao;


import java.util.HashMap;

import egovframework.example.test.vo.UserVO;

public interface UserDao {

	public UserVO userLogin(UserVO vo) throws Exception;

	public int register(UserVO vo) throws Exception;

	public UserVO registerCheck(String userid) throws Exception;

	public void imageUpdate(UserVO vo);

	public int userUpdate(UserVO vo);

	public void passUpdate(UserVO vo);

}
	
