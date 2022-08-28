package egovframework.example.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.dao.ReplyDao;
import egovframework.example.test.service.ReplyMapper;
import egovframework.example.test.vo.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void replyInsert(ReplyVO vo) throws Exception {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class); 
		mapper.replyInsert(vo);
	}
	
	@Override
	public List<ReplyVO> replyBoard(int num) throws Exception {
		ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class); 
		return mapper.replyBoard(num);
	}
}
