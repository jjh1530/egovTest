package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.MainDao;
import egovframework.example.test.service.MainService;
import egovframework.example.test.vo.NoticeVO;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mainDao;
	
	@Override
	public List<NoticeVO> notice() throws Exception {
		return mainDao.notice();
	}
}
