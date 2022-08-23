package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.NoticeDao;
import egovframework.example.test.service.NoticeService;
import egovframework.example.test.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return noticeDao.noticeList();
	}
	
	@Override
	public NoticeVO noticeDetail(int num) throws Exception {
		return noticeDao.noticeDetail(num);
	}

}
