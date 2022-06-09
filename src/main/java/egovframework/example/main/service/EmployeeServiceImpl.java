package egovframework.example.main.service;

import java.util.HashMap;
import java.util.List;

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
	public void registEmployee(HashMap<String, Object> map) {
		System.out.println("employeeRegistService");
		// TODO Auto-generated method stub
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
}


