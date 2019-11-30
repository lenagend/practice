package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import condition.RankCondition;
import logic.Service_Member;
import logic.Service_Novel;
import model.Member;
import model.Reply_novel;

@Controller
public class ReplyController {
	@Autowired
	private Service_Novel sn;
	
	@Autowired
	private Service_Member sm;
	
	@RequestMapping(value="/reply/reply.html")
	public ModelAndView reply(Integer epi_number, Integer pni, Integer bno, String reply,
			HttpSession session) {
		//댓글인 경우
		Member loginMember = (Member)session.getAttribute("LOGINMEMBER");
		RankCondition rc = (RankCondition)session.getAttribute("memberRank");
		
		Reply_novel rn = new Reply_novel();
		Integer maxRno = sn.maxRno();
		if(maxRno == null) maxRno =0;
		
		rn.setRno(maxRno+1);
		rn.setBno(bno);
		rn.setContent(reply);
		rn.setNickname(loginMember.getNickname());
		rn.setR_point(rc.getUr().getR_point());
		rn.setParent_no(0);
		rn.setOrder_no(0);
		
		sn.insertReply(rn);
		
		//novel_board 댓글카운트 1증가
		sn.addReplCnt(bno);
		
		//r_point 1 증가
		sm.AddR_point(loginMember.getEmail());
		
		ModelAndView mav = new ModelAndView("replyResult");
		mav.addObject("epi_number",epi_number);
		mav.addObject("pni",pni);
		mav.addObject("bno",bno);
		return mav;
	}
	
	@RequestMapping(value="/reply/reReply.html")
	public ModelAndView reReply(Integer epi_number, Integer pni, Integer bno, String reply, Integer parent_no,
			Integer rno,HttpSession session) {
		//대댓글인 경우
		Member loginMember = (Member)session.getAttribute("LOGINMEMBER");
		RankCondition rc = (RankCondition)session.getAttribute("memberRank");
		
		Reply_novel rn = new Reply_novel();
		Integer maxRno = sn.maxRno();
		if(maxRno == null) maxRno =0;
		
		rn.setRno(maxRno+1);
		rn.setBno(bno);
		rn.setContent(reply);
		rn.setNickname(loginMember.getNickname());
		rn.setR_point(rc.getUr().getR_point());
		rn.setParent_no(rno);
		rn.setOrder_no(sn.getOrder_no(rn));
		
		
		
		
		sn.insertReply(rn);
		
		sn.addReplCnt2(rno);
		
		ModelAndView mav = new ModelAndView("replyResult");
		mav.addObject("epi_number",epi_number);
		mav.addObject("pni",pni);
		mav.addObject("bno",bno);
		return mav;
	}
	
	@RequestMapping(value="/reply/deleteReply.html")
	public ModelAndView deleteReply(Integer epi_number, Integer pni, Integer bno, Integer rno) {
		
		
		
		
		Reply_novel rn = new Reply_novel();
		Integer maxRno = sn.maxRno();
		if(maxRno == null) maxRno =0;
		
		rn.setRno(rno);
		rn.setContent("<font color='red'>삭제된 댓글입니다</font>");
	
		//db에서 업데이트
		sn.deleteReply(rn);
		
		ModelAndView mav = new ModelAndView("replyResult");
		mav.addObject("epi_number",epi_number);
		mav.addObject("pni",pni);
		mav.addObject("bno",bno);
		return mav;
	}
}
