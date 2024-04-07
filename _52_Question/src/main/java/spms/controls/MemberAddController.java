package spms.controls;

import java.util.Map;

import spms.dao.MemberDao;
import spms.vo.Member;

public class MemberAddController implements Controller{

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("member")==null) {
			System.out.println("MemberAddController::execute() - get요청");
			
			return "/member/MemberForm.jsp";
		}else {
			System.out.println("MemberAddController::execute() - post 오청");
			
			MemberDao memberDao = (MemberDao) model.get("memberDao");
			Member member = (Member) model.get("member");
			memberDao.insert(member);
			
			return "redirect:list.do";
		}
	}
}































