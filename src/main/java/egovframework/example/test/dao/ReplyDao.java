package egovframework.example.test.dao;

import java.util.List;

import egovframework.example.test.vo.ReplyVO;

public interface ReplyDao {

	public void replyInsert(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> replyBoard(int num) throws Exception;
}
