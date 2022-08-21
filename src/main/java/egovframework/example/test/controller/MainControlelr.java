package egovframework.example.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainControlelr {

	@RequestMapping(value="/main.do")
	public String main() {
		
		return "main";
	}
}
