package egovframework.example.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.dao.TestDao;
import egovframework.example.test.service.TestMapper;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVO;

@Repository
public class TestDaoImpl implements TestDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<TestVO> selectTest(Search search) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectTest(search);
	}
	
	@Override
	public int getTestListCnt(Search search) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.getTestListCnt(search);
	}
	
	@Override
	public TestVO testBoardDetail(int idx) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.testBoardDetail(idx);
	}

	@Override
	public int testBoardWrite(TestVO vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.testBoardWrite(vo);
	}
	
	@Override
	public void testBoardDelete(int idx) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.testBoardDelete(idx);
	}
	
	@Override
	public void testBoardUpdate(TestVO vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.testBoardUpdate(vo);
	}
	
	@Override
	public void testCount(int idx) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.testCount(idx);
	}
	
	@Override
	public List<TestVO> selectList() throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.selectList();
	}
	
	@Override
	public int boardPassCheck(TestVO vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		return mapper.boardPassCheck(vo);
	}
	
	@Override
	public void replyDelete(ReplyVO vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.replyDelete(vo);
	}
	
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		mapper.replyUpdate(vo);
	}
}
