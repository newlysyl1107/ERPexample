package erp.com.a.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import erp.com.a.model.SearchVO;
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
		
		List<SearchVO> list = service.showAllResult();
		
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "search/staff_search_form";
	}
	
	// 모두 검색
	@RequestMapping(value="showAllResult")
	public String showAllResult(Model model) {
		
		List<SearchVO> list = service.showAllResult();
		
		model.addAttribute("list", list);
		
		return "search/staff_search_all";
	}
	
	
	// 등록페이지
	@RequestMapping(value="insertStaffPage")
	public String insertStaffPage() {
		
		return "search/staff_input_form";
	}
	
	
	// 등록
	@ResponseBody
	@RequestMapping(value="insertStaff", method = RequestMethod.POST)
	public Map<String, String> insertStaff(StaffVO staffVO, int[] skillArray) {
		
		System.out.println("컨트롤러");
		
		StaffSkillVO staffSkillVO = new StaffSkillVO();
		System.out.println("staffVO = " + staffVO);
		
		staffSkillVO.setStaffNo(service.insertStaff(staffVO));
		for(int i = 0; i < skillArray.length; i++){
		    staffSkillVO.setSkillCode(skillArray[i]);
		    service.insertStaffSkill(staffSkillVO);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("msg", "저장했습니다.");
		
		return result;
	}
	
	
	// 수정페이지
	@RequestMapping(value="updelStaff/{staffNo}")
	public String updelStaff(@PathVariable int staffNo, Model model) {
		
		// 선택한 직원 정보
		StaffVO userInfo = service.selectStaff(staffNo);
		
		// 선택한 직원 스킬정보
//		StaffSkillVO skill = service.selectSkill(staffNo);
		
		
		
		// 졸업일 분할
		String graduateDay = userInfo.getGraduateDay();
		String year = graduateDay.substring(0, 4);
		String month = graduateDay.substring(5, 7);
		if(Integer.parseInt(month) < 10) {
			String notZeroMonth = month.substring(1,2);
			model.addAttribute("notZeroMonth", notZeroMonth);
		}
		String day = graduateDay.substring(8, 10);
		if(Integer.parseInt(day) < 10) {
			String notZeroDay = day.substring(1,2);
			model.addAttribute("notZeroDay", notZeroDay);
		}
		
		System.out.println("날짜 자름 = " + year + month + day);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);

		
		// 주민번호 분할
		String juminNo = userInfo.getJuminNo();
		String front = juminNo.substring(0,6);
		String back = juminNo.substring(7,14);
		
		model.addAttribute("front", front);
		model.addAttribute("back", back);
		
		model.addAttribute("userInfo", userInfo);
		
		System.out.println("선택한 Staff 정보 = " + userInfo);
		
		return "search/staff_updel_form";
	}
	
	// 수정
	// @RequestMapping(value="updateStaff")
	
	
	// 삭제
	@ResponseBody
	@RequestMapping(value="deleteStaff/{staffNo}", method = RequestMethod.GET)
	public Map<String, String> deleteStaff(@PathVariable int staffNo) {
		
		System.out.println("삭제 컨트롤러");
		service.deleteStaff(staffNo);
		
		System.out.println("삭제함");
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("msg", "삭제되었습니다.");
		
		return result;
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

