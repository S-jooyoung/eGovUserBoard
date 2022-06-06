package egovframework.example.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import egovframework.example.main.service.BoardService;

@RestController
@RequestMapping("/api")
public class RestEmployeeController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@GetMapping("/employee/list")
	public List<Map> getEmployeeList(@RequestParam(required = false) Map<String, Object> param) {
		List<Map> list = boardService.getEmployeeList(param);
		
		return list;
	}
	
	@PostMapping("/employee")
	public void registEmployee(@RequestBody Map<String, Object> param) {
		boardService.registEmployee(param);
	}
	
	@PutMapping("/employee/modify/{empIdx}")
	public void modifyEmployee(@PathVariable int empIdx, @RequestBody Map<String, Object> param) {
		param.put("empIdx", empIdx);
		boardService.modifyEmployee(param);
	}
}
