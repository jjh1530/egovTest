package egovframework.example.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVO;

@Controller
public class AjaxController {

	@Autowired
	TestService testService;
	
	@RequestMapping("/ajaxBoard.do")
	public String ajaxBoard() {
		return "ajaxBoard";
	}
	
	@RequestMapping("/ajaxList.do")
	@ResponseBody
	public List<TestVO> ajaxList() throws Exception {
		
		List<TestVO> list = testService.selectList();
		
		return list; // Json
	}
}