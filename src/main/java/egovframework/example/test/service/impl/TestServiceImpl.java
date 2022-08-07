package egovframework.example.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVO;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao testDao;
	
	@Override
	public TestVO selectTest() throws Exception {
		return testDao.selectTest();
	}
}
