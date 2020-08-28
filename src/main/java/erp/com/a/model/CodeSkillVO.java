package erp.com.a.model;

public class CodeSkillVO {
	
	private int skill_code;
	private String skill_name;
	
	public CodeSkillVO() {
		// TODO Auto-generated constructor stub
	}

	public int getSkill_code() {
		return skill_code;
	}

	public void setSkill_code(int skill_code) {
		this.skill_code = skill_code;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}

	public CodeSkillVO(int skill_code, String skill_name) {
		super();
		this.skill_code = skill_code;
		this.skill_name = skill_name;
	}

	@Override
	public String toString() {
		return "CodeSkillVO [skill_code=" + skill_code + ", skill_name=" + skill_name + "]";
	}
	
	
}
