package egovframework.example.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
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

	// 전체적으로 예제 따라서 그냥 한거임
	// @GetMapping("/employee/list/{num}") 이렇게 써도 됨 이렇게 할거면 바로 아래에 getEmployeeDetail
	// 참고 해보면 좋읗 듯
	@GetMapping("/employee/list")
	public List<HashMap> getEmployeeList(@RequestParam(required = false) HashMap<String, Object> param)
			throws Exception {
		System.out.println("employeeListController");

		// 게시물 총 개수
		int count = employeeService.getEmployeeCount();
		System.out.println("count : " + count);

		// 한 페이지에 출력할 게시물의 개수
		int postNum = 5;

		// num은 하단 페이지 번호 기본이 1
		// 프론트에서 던질 때 num이 꼭 있어야 함(기본이 1)
		// map 안에 든건 Object타입 임으로 toString을 통해 String로 변환후 parseInt로 int형으로 변환
		int num = Integer.parseInt(param.get("num").toString());

		// 디비에서 select해올때 조건으로 쓰임으로 param에 넣어야 함
		param.put("postNum", postNum);

		// 출력할 게시물
		int displayPost = (num - 1) * postNum;

		// 디비에서 select해올때 조건으로 쓰임으로 param에 넣어야 함
		param.put("displayPost", displayPost);

		// 하단 페이징 번호([게시물 총 개수 / 한 페이지에 출력할 개수]의 올림)
		// 이건 return에 포함시켜서 보내야함 (프론트에서 쓰임)
		int pageNum = (int) Math.ceil((double) count / postNum);

		List<HashMap> list = employeeService.getEmployeeList(param);
		
		HashMap<String, Integer> map1 = new HashMap<>();
		
		map1.put("pageNum", pageNum);
		list.add(map1);
		//데이터를 맵에 저장
		
		System.out.println("pageNum : " + pageNum);
		System.out.println("list : " + list);
		// 위에서 말했던거 처럼 pageNum 포함시켜서 보내야됨
		// Postman같은 api테스트 하는걸로 데이터 어떻게 오는지 보고 판단해서 넣는게 좋음.

		return list;
	}

	@GetMapping("/employee/detail/{empNo}")
	public HashMap<String, Object> getEmployeeDetail(@PathVariable Long empNo) {
		System.out.println("employeeDetailController");
		HashMap<String, Object> detail = employeeService.getEmployeeDetail(empNo);
		
		System.out.println("detail : " + detail);

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
