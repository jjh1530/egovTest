package egovframework.example.test.controller;



import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.service.ReplyService;
import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.ReplyVO;
import egovframework.example.test.vo.Search;
import egovframework.example.test.vo.TestVO;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;

	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value="/testBoardList.do")
	public String testBoardList(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range
			,@RequestParam(required=false,defaultValue="title")String searchType
			,@RequestParam(required=false,defaultValue="")String keyword1
			,@RequestParam(required=false,defaultValue="")String keyword2
			,@RequestParam(required=false,defaultValue="")String keyword3
			,@ModelAttribute("search")Search search) throws Exception {
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword1(keyword1);
		search.setKeyword2(keyword2);
		search.setKeyword3(keyword3);
		
		//전체 게시글 개수
		int listCnt = testService.getTestListCnt(search);
		
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);
		
		//페이징
		model.addAttribute("pagination", search);
		model.addAttribute("keyword1", keyword1);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("keyword3", keyword3);
		
		//게시글 화면 출력
		model.addAttribute("vo", testService.selectTest(search));
		model.addAttribute("listCnt", listCnt);
		
		return "testBoardList";
	}
	
	@RequestMapping(value="/testBoardDetail.do")
	public String testBoardDetail(int idx, Model model, HttpSession session,HttpServletRequest request) throws Exception{
		
		TestVO vo = testService.testBoardDetail(idx);
		model.addAttribute("vo", vo);
		
		String writer = vo.getWriter();
		String userid = (String) session.getAttribute("userid");
		
		if (userid == null || userid == "") {
			userid ="guest";
			System.out.println("게스트");
		}
		
		if (userid != null || userid != "") {
			if (!userid.equals(writer)) {
				testService.testCount(idx);
			}
		}
		List<ReplyVO> list = replyService.replyBoard(idx);
		model.addAttribute("reply", list);
		
		return "testBoardDeatil";
	}
	
	@RequestMapping(value="/testBoardWriteForm.do")
	public String testBoardWriteForm() {
		
		return "testBoardWriteForm";
	}
	
	@RequestMapping(value="/testBoardWrite.do")
	public String testBoardWrite(TestVO vo, HttpServletRequest request) throws Exception {
		
		String filename = null;
		//String uploadPath = "/wogns4324/tomcat/webapps/file_repo" ;
		String uploadPath = request.getServletContext().getRealPath("file_repo");
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println(uploadFile);
		if (!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFilename);
			UUID uuid = UUID.randomUUID();
			filename = uuid + "." +ext;
			uploadFile.transferTo(new File(uploadPath +"/" + filename));
			System.out.println(uploadPath);
		}
		
		vo.setFilename(filename);
		
		testService.testBoardWrite(vo);
		
		return "redirect:testBoardList.do";
	}
	
	@RequestMapping(value="/testBoardDelete.do")
	public String testBoardDelete(int idx,RedirectAttributes rttr) throws Exception{
		
		testService.testBoardDelete(idx);
		rttr.addFlashAttribute("msgType","삭제");
		rttr.addFlashAttribute("msg","삭제되었습니다.");
		
		return "redirect:testBoardList.do";
	}
	
	@RequestMapping(value="/testBoardUpdateForm.do")
	public String testBoardUpdateForm(TestVO vo, Model model) throws Exception {
		TestVO tvo = testService.testBoardDetail(vo.getIdx());
		model.addAttribute("vo", tvo);
		return "testBoardUpdateForm";
	}
	
	@RequestMapping(value="/testBoardUpdate.do")
	public String testBoardUpdate(TestVO vo,RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
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
			testService.testBoardUpdate(vo);
			rttr.addFlashAttribute("msgType","수정");
			rttr.addFlashAttribute("msg","수정되었습니다.");
		}
		testService.testBoardUpdate(vo);
		rttr.addFlashAttribute("msgType","수정");
		rttr.addFlashAttribute("msg","수정되었습니다.");
		
		return "redirect:testBoardList.do";
	}

	@RequestMapping(value="/replyInsert.do")
	public String replyInsert(ReplyVO vo,RedirectAttributes re) throws Exception{
		
		re.addAttribute("idx",vo.getIdx());
		replyService.replyInsert(vo);
		return "redirect:testBoardDetail.do";
	}
	
	
}
