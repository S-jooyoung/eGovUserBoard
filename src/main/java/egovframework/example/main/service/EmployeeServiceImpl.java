package egovframework.example.main.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.dao.EmployeeDAO;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Resource(name = "employeeDAO")
	private EmployeeDAO employeeDAO;

	@Override
	public List<HashMap<String, Object>> getEmployeeList(HashMap<String, Object> map) {

		return employeeDAO.getEmployeeList(map);
	}

	@Override
	public int getEmployeeCount() {

		return employeeDAO.getEmployeeCount();
	}

	@Override
	public void registEmployee(HashMap<String, Object> map) throws Exception {

		for (Map.Entry<String, Object> p : map.entrySet()) {
			map.replace(p.getKey(), transSetEncoder(toString(p.getValue())));
		}
		
		

		employeeDAO.registEmployee(map);
	}

	@Override
	public void modifyEmployee(HashMap<String, Object> map) throws Exception {

		for (Map.Entry<String, Object> p : map.entrySet()) {
			map.replace(p.getKey(), transSetEncoder(toString(p.getValue())));
		}

		employeeDAO.modifyEmployee(map);
	}

	@Override
	public HashMap<String, Object> getEmployeeDetail(Long empNo) {
		return employeeDAO.getEmployeeDetail(empNo);
	}

	@Override
	public int deleteEmployee(Long empNo) {

		return employeeDAO.deleteEmployee(empNo);
	}

	private String transSetEncoder(String param) throws UnsupportedEncodingException {
		return new String(param.getBytes("8859_1"), "utf-8");
	}

	private String toString(Object param) {
		return String.valueOf(param);
	}

}
