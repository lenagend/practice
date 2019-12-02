package logic;

import javax.servlet.http.HttpSession;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import model.Icon;
import model.Member;
import model.User_rank;

public interface Service_Member {
	// 로그인 회원가입 계정찾기
	Member loginResult(Member member);

	void putMember(Member member);

	Member checkEmail(String inputEmail);

	Integer checkNickname(String inputNickname);

	Member findEmailByPhone(String phone);

	public ModelAndView loginProcess(Member loginMember, HttpSession session, BindingResult br, String url);

	public void modifyMember(Member member);

	public void quitMember(String email);

	// 가입후 계급테이블에 인설트
	public void createRank(User_rank ur);

	public Integer maxSeq();

	// 계급관련
	public User_rank getRank(String email);

	public Icon getIcon(Integer icon_id);

	public void updateReaders(User_rank ur);

	public void AddR_point(String Email);

	public void AddW_point(String Email);

	public void rankProcess(Member loginMember, HttpSession session);

	public void AddW_point5(String Email);

	public String getW_icon_ImageByNickname(String nickname);

	public String getR_icon_ImageByNickname(String nickname);

	// 관리자
	Integer adminLogin(String email);

}
