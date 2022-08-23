package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> noticeList() throws Exception;
	
	public NoticeVO noticeDetail(int num) throws Exception;
}
