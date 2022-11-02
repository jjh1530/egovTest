package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVO;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao testDao;
	
	@Override
	public List<TestVO> selectTest(Search search) throws Exception {
		return testDao.selectTest(search);
	}
	
	@Override
	public int getTestListCnt(Search search) throws Exception {
		return testDao.getTestListCnt(search);
	}
	
	@Override
	public TestVO testBoardDetail(int idx) throws Exception {
		return testDao.testBoardDetail(idx);
	}
	
	@Override
	public int testBoardWrite(TestVO vo) throws Exception {
		return testDao.testBoardWrite(vo);
	}
	
	@Override
	public void testBoardDelete(int idx) throws Exception {
		testDao.testBoardDelete(idx);
	}
	@Override
	public void testBoardUpdate(TestVO vo) throws Exception {
		testDao.testBoardUpdate(vo);
	}
	
	@Override
	public void testCount(int idx) throws Exception {
		testDao.testCount(idx);
	}
	
	@Override
	public List<TestVO> selectList() throws Exception {
		return testDao.selectList();
	}
	
	@Override
	public int boardPassCheck(TestVO vo) throws Exception {
		return testDao.boardPassCheck(vo);
	}
	
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		testDao.replyDelete(vo);
	}
	
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		testDao.replyUpdate(vo);
	}
}
