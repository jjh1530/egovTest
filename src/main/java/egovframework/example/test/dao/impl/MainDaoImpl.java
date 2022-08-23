package egovframework.example.test.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.test.dao.MainDao;
import egovframework.example.test.service.MainMapper;
import egovframework.example.test.vo.NoticeVO;

@Repository
public class MainDaoImpl implements MainDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> notice() throws Exception {
		MainMapper mapper = sqlSession.getMapper(MainMapper.class);
		return mapper.notice();
	}
}
