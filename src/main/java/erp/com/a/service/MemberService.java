package erp.com.a.service;

import java.util.List;
import java.util.Map;

import erp.com.a.model.SearchVO;
import erp.com.a.model.StaffSkillVO;
import erp.com.a.model.StaffVO;

public interface MemberService {

	public List<SearchVO> showAllResult();

	public List<StaffVO> show();

	public int insertStaff(StaffVO vo);

	public void insertStaffSkill(StaffSkillVO staffSkillVO);

	public StaffVO selectStaff(int staffNo);

	public void deleteStaff(int staffNo);


}
