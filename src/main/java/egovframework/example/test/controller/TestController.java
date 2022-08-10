package egovframework.example.test.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.test.service.TestService;
import egovframework.example.test.vo.TestVO;

@Controller
public class TestController {
	
	@Autowired
	TestService testService;

	@RequestMapping(value="/testBoardList.do")
	public String testBoardList(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range
			,@RequestParam(required=false,defaultValue="title")String searchType
			,@RequestParam(required=false)String keyword
			,@ModelAttribute("search")egovframework.example.test.vo.Search search) throws Exception {
		
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 게시글 개수
		int listCnt = testService.getTestListCnt(search);
		
		//검색 후 페이지
		search.pageInfo(page, range, listCnt);
		
		//페이징
		model.addAttribute("pagination", search);
		model.addAttribute("keyword", keyword);
		
		//게시글 화면 출력
		model.addAttribute("vo", testService.selectTest(search));
		model.addAttribute("listCnt", listCnt);
		
		return "testBoardList";
	}
	
	@RequestMapping(value="/testBoardDetail.do")
	public String testBoardDetail(int idx, Model model, HttpSession session) throws Exception{
		
		TestVO vo = testService.testBoardDetail(idx);
		model.addAttribute("vo", vo);
		
		String writer = vo.getWriter();
		String userid = (String) session.getAttribute("userid");
		
		if (!userid.equals(writer)) {
			testService.testCount(idx);
		}
		
		
		return "testBoardDeatil";
	}
	
	@RequestMapping(value="/testBoardWriteForm.do")
	public String testBoardWriteForm() {
		
		return "testBoardWriteForm";
	}
	
	@RequestMapping(value="/testBoardWrite.do")
	public String testBoardWrite(TestVO vo) throws Exception {
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
	public String testBoardUpdate(TestVO vo,RedirectAttributes rttr) throws Exception {
		testService.testBoardUpdate(vo);
		rttr.addFlashAttribute("msgType","수정");
		rttr.addFlashAttribute("msg","수정되었습니다.");
		
		return "redirect:testBoardList.do";
	}
	
}
