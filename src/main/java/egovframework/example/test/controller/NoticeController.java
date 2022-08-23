package egovframework.example.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.test.service.NoticeService;
import egovframework.example.test.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/testNoticeList.do")
	public String noticeList(Model model) throws Exception {
		
		List<NoticeVO> list = noticeService.noticeList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "testNoticeList";
	}
	
	@RequestMapping(value="/testNoticeDetail.do")
	public String noticeDetail(Model model, int nidx) throws Exception {
		
		NoticeVO vo = noticeService.noticeDetail(nidx);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		
		
		return "testNoticeDetail";
	}
}
