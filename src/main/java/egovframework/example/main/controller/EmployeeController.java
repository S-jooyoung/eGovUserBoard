package egovframework.example.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmployeeController {
	
	@RequestMapping("/main.do")
	public String showIndexPage() {
		return "/main";
	}
}
