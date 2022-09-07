package egovframework.example.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(value="/registerCheck.do")
	@ResponseBody
	public String registerCheck(String userid) throws Exception {
		
		UserVO vo = userService.registerCheck(userid);
		if (vo != null || userid.equals("")) {
			return "0";
		}
		return "1";
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
	
	@RequestMapping("userDetailForm.do")
	public String userDetailForm() {
		
		return "userDetailForm";
	}
	
	@RequestMapping(value="/testImageUploadForm.do")
	public String testImageUploadForm() {
		return "testImageUploadForm";
	}
	
	@RequestMapping(value="/testImageUpload.do")
	public String testImageUpload(UserVO vo,HttpServletRequest request ) throws Exception {
		
		String filename = null;
		String uploadPath = request.getServletContext().getRealPath("file_repo");
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFilename);
			UUID uuid = UUID.randomUUID();
			filename = uuid + "." +ext;
			uploadFile.transferTo(new File(uploadPath +"/" + filename));
			vo.setFilename(filename);
		}else {
			userService.imageUpdate(vo);
		}
		userService.imageUpdate(vo);
		
		return "redirect:/testBoardList.do";
	}
	
	@RequestMapping(value="/testUserUpdateForm.do")
	public String testUserUpdateForm() {
		
		return "testUserUpdateForm";
	}
	
	@RequestMapping(value="/testUserUpdate.do")
	public String testUserUpdate(UserVO vo, HttpServletRequest request,RedirectAttributes rttr) throws Exception{
		String email = request.getParameter("email_id");
		String domain = request.getParameter("email_domain");
		vo.setUseremail(email+"@" + domain);
		int result =userService.userUpdate(vo);
		if (result == 1) {
			rttr.addFlashAttribute("msgType","수정");
			rttr.addFlashAttribute("msg","수정되었습니다.");
		}else {
			rttr.addFlashAttribute("msgType","수정실패");
			rttr.addFlashAttribute("msg","수정 실패하였습니다.");
		}
		
		return "redirect:/testBoardList.do";
	}
	@RequestMapping(value="/userPassUpdate.do")
	public String userPassUpdate(UserVO vo,RedirectAttributes rttr) throws Exception {
		
		userService.passUpdate(vo);
		rttr.addFlashAttribute("msgType","수정");
		rttr.addFlashAttribute("msg","비밀번호가 변경되었습니다.");
		return "redirect:/userDetailForm.do";
	}
}
