package egovframework.example.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.main.service.EmployeeService;
import egovframework.example.main.service.FileService;

@RestController
public class RestEmployeeController {
	
	@Resource(name="employeeService")
	private EmployeeService employeeService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	@GetMapping("/employee/list")
	public List<HashMap> getEmployeeList(@RequestParam(required = false) HashMap<String, Object> param) {
		List<HashMap> list = employeeService.getEmployeeList(param);
		
		return list;
	}
	
	@GetMapping("/employee/detail/{empIdx}")
	public HashMap<String, Object> getEmployeeDetail(@PathVariable Long empIdx) {
		HashMap<String, Object> detail = employeeService.getEmployeeDetail(empIdx);
		
		return detail;
	}
	
	@PostMapping("/employee")
	public void registEmployee(@RequestParam(name = "file", required = false) MultipartFile file, @RequestParam(required = false) HashMap<String, Object> param) throws IOException {
		Object picture = null;
		
		if(file != null) {
			picture = fileService.registFile(fileService.uploadForm(file));
			param.put("picture", picture);
		}
		
		employeeService.registEmployee(param);
	}
	
	@PutMapping("/employee/modify/{empIdx}")
	public void modifyEmployee(@PathVariable Long empIdx, @RequestBody HashMap<String, Object> param) {
		param.put("empIdx", empIdx);
		employeeService.modifyEmployee(param);
	}
}
