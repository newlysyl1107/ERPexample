package erp.com.a.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import erp.com.a.model.StaffSkillVO;
import erp.com.a.model.StaffVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession session;
	
	String nameSpace = "search.";

	@Override
	public List<StaffVO> showAllResult() {
		return session.selectList(nameSpace + "selectAll");
	}

	@Override
	public List<StaffVO> show() {
		return session.selectList(nameSpace + "show");
	}

	@Override
	public int insertStaff(StaffVO vo) {
		return session.insert(nameSpace + "insertStaff", vo);
	}

	@Override
	public void insertStaffSkill(StaffSkillVO staffSkillVO) {
		session.insert(nameSpace + "insertStaffSkill", staffSkillVO);
	}
	
}
