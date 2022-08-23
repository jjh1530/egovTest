package egovframework.example.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.test.service.MainService;
import egovframework.example.test.vo.NoticeVO;

@Controller
public class MainControlelr {

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/main.do")
	public String main(Model model, NoticeVO vo)throws Exception {
		
		List<NoticeVO> notice = mainService.notice();
		model.addAttribute("notice", notice);
		
		return "main";
	}
}
