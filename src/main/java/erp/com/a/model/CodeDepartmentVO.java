package erp.com.a.model;

public class CodeDepartmentVO {
	
	private int department_code;
	private String department_name;
	
	public CodeDepartmentVO() {
		// TODO Auto-generated constructor stub
	}

	public int getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(int department_code) {
		this.department_code = department_code;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public CodeDepartmentVO(int department_code, String department_name) {
		super();
		this.department_code = department_code;
		this.department_name = department_name;
	}

	@Override
	public String toString() {
		return "CodeDepartmentVO [department_code=" + department_code + ", department_name=" + department_name + "]";
	}
	
	
}
