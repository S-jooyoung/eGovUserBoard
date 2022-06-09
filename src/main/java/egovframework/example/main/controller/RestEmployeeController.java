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

import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("employeeListController");
		List<HashMap> list = employeeService.getEmployeeList(param);

		return list;
	}
	
	@GetMapping("/employee/detail/{empNo}")
	public HashMap<String, Object> getEmployeeDetail(@PathVariable Long empNo) {
		System.out.println("employeeDetailController");
		HashMap<String, Object> detail = employeeService.getEmployeeDetail(empNo);
		
		return detail;
	}
	
	@PostMapping("/employee/regist")
	public void registEmployee(@RequestParam(name = "file", required = false) MultipartFile file, @RequestParam(required = false) HashMap<String, Object> param) throws IOException {
		System.out.println("employeeRegistController");
		Object picture = null;
		
		if(file != null) {
			System.out.println("fileRegistController");
			picture = fileService.registFile(fileService.uploadForm(file));
			param.put("picture", picture);
		}
		
		employeeService.registEmployee(param);
	}
	
	@GetMapping("/employee/delete/{empNo}")
	public int deleteEmployee(@PathVariable Long empNo) {
		System.out.println("employeeDeleteController");
		int delete = employeeService.deleteEmployee(empNo);
		
		return delete;
	}
	
	
	@PostMapping("/employee/modify/{empNo}")
	public void modifyEmployee(@RequestParam HashMap<String, Object> param) {
		System.out.println("employeeModifyController");
		employeeService.modifyEmployee(param);
	}
	
	
}
