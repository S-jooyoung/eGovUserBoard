package egovframework.example.main.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.dao.EmployeeDAO;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService{
	
	@Resource(name="employeeDAO")
    private EmployeeDAO employeeDAO;

	
	@Override
	public List<HashMap> getEmployeeList(HashMap<String, Object> map) {
		System.out.println("employeeListService");
		// TODO Auto-generated method stub
		return employeeDAO.getEmployeeList(map);
	}

	@Override
	public void registEmployee(HashMap<String, Object> map) throws Exception {
		System.out.println("employeeRegistService");
		// TODO Auto-generated method stub
		
		for(Map.Entry<String, Object> p : map.entrySet()) {
			map.replace(p.getKey(), transSetEncoder(toString(p.getValue())));
		}
		
		employeeDAO.registEmployee(map);
	}

	@Override
	public void modifyEmployee(HashMap<String, Object> map) {
		System.out.println("employeeModifyService");
		// TODO Auto-generated method stub
		employeeDAO.modifyEmployee(map);
	}

	@Override
	public HashMap<String, Object> getEmployeeDetail(Long empNo) {
		System.out.println("employeeDetailService");
		// TODO Auto-generated method stub
		return employeeDAO.getEmployeeDetail(empNo);
	}

	@Override
	public int deleteEmployee(Long empNo) {
		
		System.out.println("employeeDeleteService");
		// TODO Auto-generated method stub
		return employeeDAO.deleteEmployee(empNo);
	}
	
	private String transSetEncoder(String param) throws UnsupportedEncodingException {
		return new String(param.getBytes("8859_1"), "utf-8");
	}
	
	private String toString(Object param) {
		return String.valueOf(param);
	}
}


