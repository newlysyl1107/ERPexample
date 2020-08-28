package erp.com.a.dao;

import java.util.List;
import java.util.Map;

import erp.com.a.model.StaffSkillVO;
import erp.com.a.model.StaffVO;

public interface MemberDAO {

	public List<StaffVO> showAllResult();

	public List<StaffVO> show();

	public int insertStaff(StaffVO vo);

	public void insertStaffSkill(StaffSkillVO staffSkillVO);

}
