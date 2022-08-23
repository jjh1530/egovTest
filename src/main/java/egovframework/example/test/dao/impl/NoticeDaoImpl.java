package egovframework.example.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.dao.NoticeDao;
import egovframework.example.test.service.MainMapper;
import egovframework.example.test.service.NoticeMapper;
import egovframework.example.test.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> noticeList() throws Exception {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		return mapper.noticeList();
	}
	
	@Override
	public NoticeVO noticeDetail(int num) throws Exception {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		return mapper.noticeDetail(num);
	}
}
