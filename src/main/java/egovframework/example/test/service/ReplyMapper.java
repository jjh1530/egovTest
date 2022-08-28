package egovframework.example.test.service;

import java.util.List;

import egovframework.example.test.vo.ReplyVO;

public interface ReplyMapper {

	public void replyInsert(ReplyVO vo) throws Exception;

	public List<ReplyVO> replyBoard(int num) throws Exception;
}
