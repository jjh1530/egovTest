package egovframework.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVO;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;

	@RequestMapping(value="/test.do")
	public String test(Model model) throws Exception {
		
		TestVO vo =testService.selectTest();
		model.addAttribute("vo", vo);
		return "test";
	}
}
