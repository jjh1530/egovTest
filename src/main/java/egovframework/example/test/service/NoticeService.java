package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList() throws Exception;

	public NoticeVO noticeDetail(int num) throws Exception;
}
