package egovframework.example.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.test.service.UserService;
import egovframework.example.test.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/testLoginForm.do")
	public String testLoginForm() {
		
		return "testLoginForm";
	}
	
	@RequestMapping(value="/testLogin.do")
	@ResponseBody
	public String testLogin(UserVO vo,HttpSession session) throws Exception {
		
		String message ="";
		
		UserVO uvo= userService.userLogin(vo);
		if(uvo != null) {
			session.setMaxInactiveInterval(1800);
			session.setAttribute("userSession", uvo);
			session.setAttribute("userid", uvo.getUserid());
			message = "ok";
		}
		
		return message;
	}
	
	@RequestMapping(value="/testLogout.do")
	public String testLogout(HttpSession session) {
		
		session.invalidate();
		
		return  "redirect:/testBoardList.do";
	}
	
	@RequestMapping(value="/userRegisterForm.do")
	public String userRegisterForm() {
		
		return "userRegisterForm";
	}
	
	@RequestMapping(value="userRegister.do")
	@ResponseBody
	public String userRegister(UserVO vo) throws Exception{
		
		String message ="";
		int result = userService.register(vo);
		if (result == 1) {
			message ="ok";
		}
		return message;
	}
}
