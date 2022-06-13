package egovframework.example.main.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.main.service.EmployeeService;
import egovframework.example.main.service.FileService;

@RestController
public class RestEmployeeController {

	@Resource(name = "employeeService")
	private EmployeeService employeeService;

	@Resource(name = "fileService")
	private FileService fileService;

	@GetMapping("/employee/list")
	public List<HashMap> getEmployeeList(@RequestParam(required = false) HashMap<String, Object> param)
			throws Exception {
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

	@GetMapping("/employee/delete/{empNo}")
	public int deleteEmployee(@PathVariable Long empNo) {
		System.out.println("employeeDeleteController");
		int delete = employeeService.deleteEmployee(empNo);

		return delete;
	}

	@PostMapping("/employee/regist")
	public void registEmployee(@RequestParam(name = "profile_pt", required = false) MultipartFile file,
			@RequestParam(required = false) HashMap<String, Object> param) throws Exception {
		System.out.println("employeeRegistController");
		Object picture = null;

		if (file != null) {
			System.out.println("fileRegistController");
			picture = fileService.registFile(fileService.uploadForm(file));
			param.put("picture_r", picture);
		}

		employeeService.registEmployee(param);
	}

	@PostMapping("/employee/modify/{empNo}")
	public void modifyEmployee(@RequestParam(name = "profile_pt", required = false) MultipartFile file,
			@RequestParam(required = false) HashMap<String, Object> param) throws Exception {
		System.out.println("employeeModifyController");
		Object picture = null;

		if (file != null) {
			System.out.println("fileModifyController");
			picture = fileService.registFile(fileService.uploadForm(file));
			param.put("picture_r", picture);
		}

		employeeService.modifyEmployee(param);
	}

}
