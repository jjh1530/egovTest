package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVO;

public interface TestDao {

	//원래 전체 리스트
	//public List<TestVO> selectTest() throws Exception;

	public List<TestVO> selectTest(Search search) throws Exception;
	
	public int getTestListCnt(Search search) throws Exception;
	
	public TestVO testBoardDetail(int idx) throws Exception;

	public int testBoardWrite(TestVO vo) throws Exception;

	public void testBoardDelete(int idx) throws Exception;

	public void testBoardUpdate(TestVO vo) throws Exception;

	public void testCount(int idx) throws Exception;

	public List<TestVO> selectList() throws Exception;
}
	
