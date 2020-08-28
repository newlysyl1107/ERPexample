package erp.com.a.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import erp.com.a.model.StaffSkillVO;
import erp.com.a.model.StaffVO;
import erp.com.a.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="main")
	public String main() {
			
		return "main/main";
	}
	
	// 검색페이지
	@RequestMapping(value="staffSearch")
	public String staffSearch(Model model) {
		
		List<StaffVO> list = service.showAllResult();
		
		model.addAttribute("list", list);
		
		return "search/staff_search_form";
	}
	
	// 모두 검색
	@RequestMapping(value="showAllResult")
	public String showAllResult(Model model) {
		
		List<StaffVO> list = service.showAllResult();
		
		model.addAttribute("list", list);
		
		return "search/staff_search_all";
	}
	
	
	// 등록페이지
	@RequestMapping(value="insertStaffPage")
	public String insertStaffPage() {
		
		return "search/staff_input_form";
	}
	
	
	// 등록
	@RequestMapping(value="insertStaff", method = RequestMethod.POST)
	public String insertStaff(StaffVO staffVO, int[] skillArray) {
		
		System.out.println("컨트롤러");
		
		StaffSkillVO staffSkillVO = new StaffSkillVO();
		System.out.println("staffVO = " + staffVO);
		
		staffSkillVO.setStaffNo(service.insertStaff(staffVO));
		for(int i = 0; i < skillArray.length; i++){
		    staffSkillVO.setSkillCode(skillArray[i]);
		    service.insertStaffSkill(staffSkillVO);
		}
		
		return "redirect:/member/staffSearch";
	}
	


}


/*	@ResponseBody
@RequestMapping(value="showAllResult")
public Object showAllResult(Model model) {
	
	HashMap<String, Object> result = new HashMap<>();

	List<StaffVO> list = service.showAllResult();
	
	System.out.println(list.size());
	result.put("status", "success");
	result.put("data", list);

	Gson gson = new Gson();
	String json = gson.toJson(list);
	System.out.println(json);
	
	System.out.println("list = " + list);

	return result;		
}*/

