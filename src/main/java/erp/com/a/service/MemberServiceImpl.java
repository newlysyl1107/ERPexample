package erp.com.a.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import erp.com.a.dao.MemberDAO;
import erp.com.a.model.StaffSkillVO;
import erp.com.a.model.StaffVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;

	@Override
	public List<StaffVO> showAllResult() {
		return dao.showAllResult();
	}

	@Override
	public List<StaffVO> show() {
		return dao.show();
	}

	@Override
	public int insertStaff(StaffVO vo) {
		return dao.insertStaff(vo);
	}

	@Override
	public void insertStaffSkill(StaffSkillVO staffSkillVO) {
		dao.insertStaffSkill(staffSkillVO);
	}

	
}
