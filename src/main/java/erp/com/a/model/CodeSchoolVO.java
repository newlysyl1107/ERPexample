package erp.com.a.model;

public class CodeSchoolVO {

	private int school_code;
	private String school_name;
	
	public CodeSchoolVO() {
		// TODO Auto-generated constructor stub
	}

	public CodeSchoolVO(int school_code, String school_name) {
		super();
		this.school_code = school_code;
		this.school_name = school_name;
	}

	public int getSchool_code() {
		return school_code;
	}

	public void setSchool_code(int school_code) {
		this.school_code = school_code;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	@Override
	public String toString() {
		return "CodeSchoolVO [school_code=" + school_code + ", school_name=" + school_name + "]";
	}
	
	
}
