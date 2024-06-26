package spms.controls;

import java.util.Map;

import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

public class MemberAddController implements Controller, DataBinding{
	
	MemberDao memberDao;
	
	public MemberAddController setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public Object[] getDataBinders() {
		return new Object[] {
				"member", spms.vo.Member.class
		};
	}
	
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		//if(model.get("member") == null) {	//get 요청
		
		Member member = (Member)model.get("member");
		
		if(member.getEmail() == null) {
			System.out.println("MemberAddController::execute() - get 호출");
			return "/member/MemberForm.jsp";
		}else {		// post 요청
			System.out.println("MemberAddController::execute() - post 호출");
			
			//Member member = (Member)model.get("member");
			memberDao.insert(member);
			
			return "redirect:list.do";
		}
		
	}
}































