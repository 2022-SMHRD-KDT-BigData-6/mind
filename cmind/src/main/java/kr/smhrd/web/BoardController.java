package kr.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.mapper.BoardMapper;

import kr.smhrd.model.MemberVO;

@Controller // front controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;

	// 페이지 접속시 나오는 페이지
	@RequestMapping("/")
	public String basic(Model model) {
		return "index";
	}

	// HTP 설명 페이지
	@RequestMapping("/aboutTest")
	public String aboutTest() {
		return "aboutTest";
	}

	// 케어페이지
	@RequestMapping("/care")
	public String care() {
		return "care";
	}

	// 감정일기 페이지
	@RequestMapping("/diary")
	public String diary() {
		return "diary";
	}

	// 병원 안내 페이지
	@RequestMapping("/treeList")
	public String treeList() {
		return "treeList";
	}

	// 홈 페이지
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	// 로그인 페이지
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	// 내정보 페이지
	@RequestMapping("/myPage")
	public String myPage(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
		} else {
			return "login";
		}
		return "myPage";
	}

	// 심리검사 결과 페이지
	@RequestMapping("/result")
	public String result(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
		} else {
			return "login";
		}
		return "result";
	}

	// 회원가입 페이지
	@RequestMapping("/sign")
	public String sign() {
		return "sign";
	}

	// 심리검사 실행 페이지
	@RequestMapping("/testGo")
	public String testGo(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
		} else {
			return "login";
		}
		return "testGo";
	}

	// 로딩 페이지
	@RequestMapping("/testLoading")
	public String testLoading() {
		return "testLoading";
	}

	// 심리검사 설명 페이지
	@RequestMapping("/testMain")
	public String testMain() {
		return "testMain";
	}

	// 회원가입 기능
	@RequestMapping("/insert")
	public String insert(MemberVO vo) {
		mapper.BoardSign(vo);
		return "index";
	}


	// 로그인 기능
	@RequestMapping("/select")
	public String select(MemberVO vo, HttpSession session) {
		MemberVO mvo = mapper.boardLogin(vo);
		session.setAttribute("mvo", mvo);
		return "index";
	}

	// 로그아웃 기능
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
