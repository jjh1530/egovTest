package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.NoticeVO;


public interface NoticeDao {

	public List<NoticeVO> noticeList() throws Exception;
	
	public NoticeVO noticeDetail(int num) throws Exception;
}
