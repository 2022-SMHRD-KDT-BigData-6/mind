package kr.smhrd.web;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.smhrd.mapper.BoardMapper;

import kr.smhrd.model.MemberVO;
import kr.smhrd.model.TestVO;

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
	public String care(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
			TestVO result1 = mapper.selectResult(mvo.getUserid());
			model.addAttribute("result", result1);
			return "care";
		} else {
			return "login";
		}
		
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
			return "diaryStat";
		} else {
			return "login";
		}
	}

	// 심리검사 결과 페이지
	@RequestMapping("/result")
	public String result(HttpSession session, Model model) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (mvo != null) {
			TestVO result1 = mapper.selectResult(mvo.getUserid());
			String img = mapper.selectimg(mvo.getUserid());
			model.addAttribute("result", result1);
			model.addAttribute("img", img);
			return "result";
		} else {
			return "login";
		}
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

	@RequestMapping("/resultGo")
	public String resultGo(Model model, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String test = mapper.selectbox(mvo.getUserid());
		
		int agganx = 0;
		int socialanx = 0;
		int sadanx = 0;
		int complexanx = 0;
		int reganx = 0;

		int apple = 0;
		double h = 0;
		String Tree_h = "";

		double wcrown = 0;
		String Tree_crown = "";

		double wtrunk = 0;
		String Tree_trunk = "";

		String bird = "";
		String ap = "";

		String branch = "<span class=\"emphasis02\">가지</span>는 세상을 향해 뻗어나가려는 힘을 상징합니다. 생략된 가지는 환경과의 상호작용에 있어 <span class=\"emphasis\">매우 억제되고 위축</span>되어 있음을 나타냅니다.<br>";
		String crown = "<span class=\"emphasis02\">수관</span>은 내적인 공상과 사고활동을 상징합니다. 생략된 수관은 <span class=\"emphasis\">공허함, 좌절감</span>이 가득하고 의욕이 모두 상실된 상태를 나타냅니다.<br>";
		String root = "<span class=\"emphasis02\">뿌리</span>는 안정감을 의미합니다. 뿌리와 지면이 모두 생략된 경우 <span class=\"emphasis\">불안정한 감정과 우울감</span>이 있어 안정적이지 않고 소속감이 없음을 나타냅니다.<br>";
		String trunk = "<span class=\"emphasis02\">기둥</span>은 나무를 지탱하는 부분으로서 힘과 견고함을 상징합니다. 현재 <span class=\"emphasis\">견고한 내면상태</span>를 가지고 있습니다.<br>";

		String knot = "";
		String[] str = test.split("\\n");

		ArrayList<String[]> a = new ArrayList<String[]>();
		for (int i = 0; i < str.length; i++) {
			a.add(str[i].split(" "));
		}

		for (int i = 0; i < a.size(); i++) {
			if (a.get(i)[0].equals("0")) {
				apple++;
				if (apple >= 5) {
					ap = "<span class=\"emphasis02\">사과</span>는 성취, 애정, 또는 인정받고자 하는 욕구를 상징합니다. 사과의 갯수가 많은 것으로 보아 <span class=\"emphasis\">성취에 대한 욕망</span>이 강하다고 볼 수 있습니다.<br>";
					agganx +=2;
					sadanx +=3;
					complexanx +=2;
					reganx +=3;
				} else if (apple > 1) {
					ap = "<span class=\"emphasis02\">사과</span>는 성취, 애정, 또는 인정받고자 하는 욕구를 상징합니다. 사과의 갯수가 적은 것으로 보아 <span class=\"emphasis\">의존욕구</span>가 강하다고 볼 수 있습니다.<br>";
					agganx +=2;
					sadanx +=4;
					complexanx +=2;
					reganx +=3;
				}
				
			} else if (a.get(i)[0].equals("1")) {
				bird = "<span class=\"emphasis02\">새</span>는 세상과 상호작용을 하고자 하는 욕구를 상징합니다. 새가 너무 많을 경우에는 오히려 <span class=\"emphasis\">외로움</span>을 상징합니다..<br>";
				agganx +=2;
				sadanx +=6;
				complexanx +=3;
				reganx +=2;

				// 가지
			} else if (a.get(i)[0].equals("2")) {
				branch = "<span class=\"emphasis02\">가지</span>는 세상을 향해 뻗어나가려는 힘을 상징합니다. 가지가 잘려있습니다. 잘린 가지는 <span class=\"emphasis\">좌절과 상처</span>와 같은 심리적 외상을 나타냅니다.<br>";
				agganx +=2;
				socialanx +=6;
				sadanx +=3;
				complexanx +=2;
			} else if (a.get(i)[0].equals("3")) {
				branch = "<span class=\"emphasis02\">가지</span>는 세상을 향해 뻗어나가려는 힘을 상징합니다. 가지가 끊겨있습니다. 끊긴 가지는 성장이나 목표 추구에 대한 <span class=\"emphasis\">두려움이나 수동적, 소극적인 태도</span>를 나타냅니다.<br>";
				agganx +=4;
				socialanx +=1;
				sadanx +=6;
				reganx +=2;
			} else if (a.get(i)[0].equals("4")) {
				branch = "<span class=\"emphasis02\">가지</span>는 세상을 향해 뻗어나가려는 힘을 상징합니다. 가지의 모양이 뾰족합니다. 감수성이 예민해서 종종 <span class=\"emphasis\">공격적인 마음</span>을 가질 수가 있습니다.<br>";
				agganx +=8;
				socialanx +=3;
				complexanx +=1;

				// 수관
			} else if (a.get(i)[0].equals("5")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "<span class=\"emphasis02\">수관</span>은 내적인 공상과 사고활동을 상징합니다. 구름같은 모양의 수관은 <span class=\"emphasis\">적극적인 공상활동</span>을 나타냅니다. 때로는 공상에 지나치게 몰두할 가능성이 있습니다.<br>";
				reganx +=2;
			} else if (a.get(i)[0].equals("6")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "<span class=\"emphasis02\">수관</span>은 내적인 공상과 사고활동을 상징합니다. 어지러운 모양의 수관은 <span class=\"emphasis\">정서적인 흥분이나 불안정성</span>을 나타냅니다.<br>";
				agganx +=5;
				socialanx +=6;
				sadanx +=1;
				complexanx +=4;
				reganx +=2;
			} else if (a.get(i)[0].equals("7")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "<span class=\"emphasis02\">수관</span>은 내적인 공상과 사고활동을 상징합니다. 버섯같은 모양의 수관은 <span class=\"emphasis\">뜬 구름 같은 심리상태</span>를 나타냅니다. 현재 자신과 미래에 대한 막연한 걱정에 빠져있을 수 있습니다.<br>";
				agganx +=2;
				socialanx +=6;
				sadanx +=2;
				reganx +=3;

				// 옹이
			} else if (a.get(i)[0].equals("8")) {
				knot = "<span class=\"emphasis02\">옹이</span>는 성장하면서 경험한 <span class=\"emphasis\">트라우마, 퇴행</span>과 같은 심리적 외상을 상징합니다. 어릴때 생긴 외상일수록 아래쪽에 위치하는 경향이 있습니다.<br>";
				socialanx +=10;
				sadanx +=4;
				reganx +=2;
				complexanx +=6;

				// 뿌리
			} else if (a.get(i)[0].equals("9")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "<span class=\"emphasis02\">뿌리</span>는 안정감의을 의미합니다. 뿌리없이 지면위 바로 그려진 경우 <span class=\"emphasis\">불안감과 강한 의존 욕구</span>를 나타냅니다.<br>";
				socialanx +=2;
				complexanx +=4;
			} else if (a.get(i)[0].equals("10")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "<span class=\"emphasis02\">뿌리</span>는 안정감을 의미합니다. 지면없이 뿌리만 그려진 경우 자신에 대해 <span class=\"emphasis\">불안정감</span>을 느끼고 있으며 이를 <span class=\"emphasis\">과잉 보상</span>하려는 시도로 볼 수 있습니다.<br>";
				agganx +=7;
				socialanx +=5;
				sadanx +=1;
				complexanx +=2;
			} else if (a.get(i)[0].equals("11")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "<span class=\"emphasis02\">뿌리</span>는 안정감을 의미합니다. 땅 아래 강조된 뿌리는 <span class=\"emphasis\">현실을 검증하는 능력에 다소 약한 편</span>임을 나타냅니다.<br>";
				agganx +=2;
				socialanx +=2;
				complexanx +=3;
				reganx +=6;
			} else if (a.get(i)[0].equals("12")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "<span class=\"emphasis02\">뿌리</span>는 안정감을 의미합니다. 땅 위에 그려진 뿌리는<span class=\"emphasis\">미성숙</span>하거나 불안정했던 과거에 대한 관심으로 스스로를 확신할 수 없는 사람, <span class=\"emphasis\">과거만을 추구</span>하기 때문에 앞으로 나아가기 힘듬을 나타냅니다.<br>";
				agganx +=2;
				socialanx +=3;

				// 기둥
			} else if (a.get(i)[0].equals("13")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "<span class=\"emphasis02\">기둥</span>은 나무를 지탱하는 부분으로서 힘과 견고함을 상징합니다. 그림에 나무껍질을 표현한 경우 환경과의 <span class=\"emphasis\">관계에 강한 관심과 자신을 강박적으로 통제함</span>을 나타냅니다.<br>";
				agganx +=2;
				socialanx +=2;
				complexanx +=6;

			} else if (a.get(i)[0].equals("14")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "<span class=\"emphasis02\">기둥</span>은 나무를 지탱하는 부분으로서 힘과 견고함을 상징합니다. 휘어진 기둥은 외부의 어떤 힘에 의해 <span class=\"emphasis\">억압</span>을 받고 있음을 나타냅니다.<br>";
				agganx +=1;
				socialanx +=5;
				sadanx +=2;
				complexanx +=2;
				reganx +=1;
			} else if (a.get(i)[0].equals("15")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "<span class=\"emphasis02\">기둥</span>은 나무를 지탱하는 부분으로서 힘과 견고함을 상징합니다. 곧게 뻗은 기둥은 <span class=\"emphasis\">견고한 내면상태</span>를 의미합니다..<br>";
			}
		}

		// 지나치게 큰나무
		if (h > 0.9) {
			agganx +=10;
			Tree_h = "<span class=\"emphasis02\">나무의 크기</span>가 종이의 면적에 비해 다소 큰 편입니다. <span class=\"emphasis\">공격적인 경향</span>을 가지고 있거나 <span class=\"emphasis\">활동이 과잉</span>될 때 나무를 크게 그리는 경향이 있습니다.<br>";
		}

		// 지나치게 작은나무
		if (h < 0.3) {
			agganx +=0;
			socialanx +=3;
			sadanx +=10;
			complexanx +=7;
			reganx +=0;
			Tree_h = "<span class=\"emphasis02\">나무의 크기</span>가 종이의 면적에 비해 다소 작습니다. <span class=\"emphasis\">부끄러움</span>을 잘 타는 성격이거나 대인관게에 있어서 <span class=\"emphasis\">불안정한 경향</span>을 보일 때 나무를 작게 그리는 경우가 있습니다.<br>";
		}

		// 큰 수관
		if (wcrown > 0.8) {
			Tree_crown = "<span class=\"emphasis02\">수관의 크기</span>가 꽤 큽니다. 완전한 만족을 추구하느라 마음의 안정이  <span class=\"emphasis\">상실</span>되어 있음을 의미할 수 있습니다.<br>";
			agganx +=3;
		}

		// 작은 수관
		if (wcrown < 0.4 && wcrown >= 0.1) {
			Tree_crown = "<span class=\"emphasis02\">수관의 크기</span>가 꽤 작습니다. <span class=\"emphasis\">결단력이 약하여</span> 어떤 일을 처리할 때 타인의 도움을 바라는 <span class=\"emphasis\">의존성이 강함</span>을 의미할 수 있습니다.<br>";
			socialanx +=3;
			reganx +=3;
		}

		// 두꺼운 기둥
		if (wtrunk >= 0.6) {
			Tree_trunk = "<span class=\"emphasis02\">기둥</span>이 두꺼운 편입니다. 심신의 <span class=\"emphasis\">에너지 수준이 높고 자아 강도가 강함</span>을 알 수 있습니다.<br>";
			agganx +=2;
		}

		// 얇은 기둥
		if (wtrunk <= 0.2 && wtrunk >= 0.1) {
			Tree_trunk = "<span class=\"emphasis02\">기둥</span>이 가는 편입니다. 스스로를 <span class=\"emphasis\">외롭고 나약</span>하다고 여기는 <span class=\"emphasis\">심리적 무력감</span>을 경험하고 있을 수 있습니다.<br>";
			socialanx +=5;
			sadanx +=5;
			complexanx +=5;
		}
		if (branch.equals(
				"<span class=\"emphasis02\">가지</span>는 세상을 향해 뻗어나가려는 힘을 상징합니다. 생략된 가지는 환경과의 상호작용에 있어 <span class=\"emphasis\">매우 억제되고 위축</span>되어 있음을 나타냅니다.<br>")) {
			agganx +=2;
			socialanx +=2;
			sadanx +=2;
			complexanx +=2;
			reganx +=2;
		}

		if (crown.equals(
				"<span class=\"emphasis02\">수관</span>은 내적인 공상과 사고활동을 상징합니다. 생략된 수관은 <span class=\"emphasis\">공허함, 좌절감</span>이 가득하고 의욕이 모두 상실된 상태를 나타냅니다.<br>")) {
			agganx +=2;
			socialanx +=2;
			sadanx +=2;
			complexanx +=2;
			reganx +=2;

		}

		if (root.equals(
				"<span class=\"emphasis02\">뿌리</span>는 안정감을 의미합니다. 뿌리와 지면이 모두 생략된 경우 <span class=\"emphasis\">불안정한 감정과 우울감</span>이 있어 안정적이지 않고 소속감이 없음을 나타냅니다.<br>")) {
			agganx +=2;
			socialanx +=2;
			sadanx +=2;
			complexanx +=2;
			reganx +=2;

		}

		if (trunk.equals(
				"<span class=\"emphasis02\">기둥</span>은 나무를 지탱하는 부분으로서 힘과 견고함을 상징합니다. 현재 <span class=\"emphasis\">견고한 내면상태</span>를 가지고 있습니다.<br>")) {
			agganx +=2;
			socialanx +=2;
			sadanx +=2;
			complexanx +=2;
			reganx +=2;

		}
		
		String diagnosis_result = Tree_h + ap + bird + branch + crown + Tree_crown + knot + trunk + Tree_trunk + root;
		TestVO tvo = new TestVO();
		tvo.setAgganx(agganx);
		tvo.setComplexanx(complexanx);
		tvo.setReganx(reganx);
		tvo.setSadanx(sadanx);
		tvo.setSocialanx(socialanx);
		tvo.setDiagnosis_result(diagnosis_result);
		tvo.setUserid(mvo.getUserid());
		

		int[] arr = { agganx, complexanx, reganx, sadanx, socialanx };
		int max = 0;
		String ma = "";
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] > max) {
				max = arr[i];
			}
		}

		if (max == agganx) {
			ma = "공격성";
		} else if (max == complexanx) {
			ma = "자존감";
		} else if (max == reganx) {
			ma = "공상";
		} else if (max == sadanx) {
			ma = "우울";
		} else if (max == socialanx) {
			ma = "불안";
		}
		tvo.setMa(ma);
		
		mapper.insertResult(tvo);
		return "result";
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
