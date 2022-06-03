package egovframework.example.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.main.service.BoardService;

@Controller
public class mainController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/main.do")
	public ModelAndView showIndexPage(ModelAndView mav) throws Exception{
		
		List<Map> boards = boardService.getBoards();
		
		
		mav.addObject("boards", boards);
		
		
		mav.setViewName("main");
		return mav;
	}
}
