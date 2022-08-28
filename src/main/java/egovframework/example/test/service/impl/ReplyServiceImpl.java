package egovframework.example.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.test.dao.ReplyDao;
import egovframework.example.test.service.ReplyService;
import egovframework.example.test.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public void replyInsert(ReplyVO vo) throws Exception {
		replyDao.replyInsert(vo);
	}
	
	@Override
	public List<ReplyVO> replyBoard(int num) throws Exception {
		return replyDao.replyBoard(num);
	}
}
