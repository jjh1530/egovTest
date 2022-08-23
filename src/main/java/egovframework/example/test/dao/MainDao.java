package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.NoticeVO;


public interface MainDao {

	public List<NoticeVO> notice() throws Exception;
}
