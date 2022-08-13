<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String test = request.getParameter("data");
	String imgname = request.getParameter("data");
	System.out.println(test);

	int AggAnx = 0;
	int SocialAnx = 0;
	int SadAnx = 0;
	int ComplexAnx = 0;
	int RegAnx = 0;

	int apple = 0;
	int bird = 0;
	double h = 0;
	String Tree_h = "정상크기나무";

	double wcrown = 0;
	String Tree_crown = "정상크기수관";

	double wtrunk = 0;
	String Tree_trunk = "정상크기기둥";

	String ap = "사과 없거나 8개 이하";
	String bi = "새가 없거나 4개 이하";
	String branch = "가지생략";
	String crown = "공허함, 좌절감이 가득하고 의욕이 모두 상실된 상태입니다.";
	String root = "불안정한 감정과 우울감 안정적이지 않고 소속감이 없습니다.";
	String trunk = "견고한 내면상태를 가지고 있습니다.";
	int knot = 0;

	String[] str = test.split("\\r\\n");

	ArrayList<String[]> a = new ArrayList<String[]>();
	for (int i = 0; i < str.length; i++) {
		a.add(str[i].split(" "));
	}

	for (int i = 0; i < a.size(); i++) {
		if (a.get(i)[0].equals("0")) {
			apple++;
			ap = "사과의 개수가 많을 수록 의존의 욕구 애정욕구와 관련된 심리적 미숙함 ";
			if (apple > 8) {
		AggAnx = +1;
		SadAnx = +5;
		ComplexAnx = +2;
		RegAnx = +4;
			}
		} else if (a.get(i)[0].equals("1")) {
			bird++;
			bi = "새 마리수가 많을 수록 외로움의 표현 퇴행";
			if (bird > 4) {
		AggAnx = +1;
		SadAnx = +2;
		ComplexAnx = +3;
		RegAnx = +6;
			}

			// 가지
		} else if (a.get(i)[0].equals("2")) {
			branch = "비논리적이고 무분별한, 예의가 없는 무식한 성향 좌절 상처";
			AggAnx++;
			SocialAnx++;
			SadAnx = +3;
		} else if (a.get(i)[0].equals("3")) {
			branch = "지속된 불안, 우울의 표현 옹이와 유사하게 심리적 외상";
			AggAnx = +3;
			SocialAnx = +1;
			SadAnx = +4;
			RegAnx = +2;
		} else if (a.get(i)[0].equals("4")) {
			branch = "공격성, 예민성, 관계부적응의 성향을 가질가능성이 있습니다.";
			AggAnx = +4;
			SocialAnx = +3;
			ComplexAnx = +1;

			// 수관
		} else if (a.get(i)[0].equals("5")) {
			h += Double.parseDouble(a.get(i)[4]);
			wcrown += Double.parseDouble(a.get(i)[3]);
			crown = "적극적인 공상활동을 나타냄\r\n" + "현실에 대한 불만족감이나 부정의 일환으로 공상에 지나치게 몰두할 가능성을 시사";
			RegAnx = +5;
		} else if (a.get(i)[0].equals("6")) {
			h += Double.parseDouble(a.get(i)[4]);
			wcrown += Double.parseDouble(a.get(i)[3]);
			crown = "정서적 흥분이나 불안정성, 충동성, 혼란스러운 내적 상태를 나타냄";
			AggAnx = +1;
			SocialAnx = +6;
			SadAnx = +5;
			ComplexAnx = +4;
			RegAnx = +2;
		} else if (a.get(i)[0].equals("7")) {
			h += Double.parseDouble(a.get(i)[4]);
			wcrown += Double.parseDouble(a.get(i)[3]);
			crown = "뜬 구름 같은 심리상태 불안정하고 막연함";
			AggAnx = +1;
			SadAnx = +6;
			RegAnx = +3;

			// 옹이
		} else if (a.get(i)[0].equals("8")) {
			trunk = "트라우마, 퇴행 성장 과정동안 경험한 심리적 외상을 상징";
			AggAnx = +6;
			SocialAnx = +1;
			SadAnx = +4;
			RegAnx = +3;
			knot++;

			// 뿌리
		} else if (a.get(i)[0].equals("9")) {
			h += Double.parseDouble(a.get(i)[4]);
			root = "불안감과 강한 의존욕구";
			SocialAnx = +1;
			ComplexAnx = +2;
		} else if (a.get(i)[0].equals("10")) {
			h += Double.parseDouble(a.get(i)[4]);
			root = "자신에 대해 불안정감을 느끼고 있으며 이를 과잉 보상하려는 시도로 볼 수 있음";
			AggAnx = +1;
			SocialAnx = +2;
			SadAnx = +5;
			ComplexAnx = +2;
		} else if (a.get(i)[0].equals("11")) {
			h += Double.parseDouble(a.get(i)[4]);
			root = "현실을 검증하는 능력에 장애";
			AggAnx = +1;
			SocialAnx = +2;
			ComplexAnx = +3;
			RegAnx = +4;
		} else if (a.get(i)[0].equals("12")) {
			h += Double.parseDouble(a.get(i)[4]);
			root = "미성숙하거나 불안정했던 과거에 대한 관심 스스로를 확신할 수 없는 사람, 과거만을 추구하기 때문에 앞으로 나아가기 힘듬";
			AggAnx = +1;
			SocialAnx = +3;

			// 기둥
		} else if (a.get(i)[0].equals("13")) {
			h += Double.parseDouble(a.get(i)[4]);
			wtrunk += Double.parseDouble(a.get(i)[3]);
			trunk = "환경과의 관계에 강한 관심, 자신을 강박적으로 통제";
			AggAnx = +1;
			SocialAnx = +2;

		} else if (a.get(i)[0].equals("14")) {
			h += Double.parseDouble(a.get(i)[4]);
			wtrunk += Double.parseDouble(a.get(i)[3]);
			trunk = "외부의 어떤 힘에 의해 억압을 받고 있음을 시사합니다.";
			AggAnx = +1;
			SocialAnx = +2;
			SadAnx = +3;
			ComplexAnx = +2;
			RegAnx = +1;
		} else if (a.get(i)[0].equals("15")) {
			h += Double.parseDouble(a.get(i)[4]);
			wtrunk += Double.parseDouble(a.get(i)[3]);
			trunk = "견고한 내면상태를 가지고 있습니다.";
			RegAnx = +5;
		}
	}

	// 지나치게 큰나무
	if (h > 0.8) {
		AggAnx = +5;
		Tree_h = "지나치게 큰나무";
	}

	// 지나치게 작은나무
	if (h < 0.4) {
		AggAnx = +0;
		SocialAnx = +3;
		SadAnx = +10;
		ComplexAnx = +7;
		RegAnx = +0;
		Tree_h = "지나치게 작은나무";
	}

	// 큰 수관
	if (wcrown > 0.8) {
		Tree_crown = "지나치게 큰 수관";
		AggAnx = +5;
	}

	// 작은 수관
	if (wcrown < 0.4) {
		Tree_crown = "지나치게 작은수관";
		AggAnx = +5;
	}

	// 두꺼운 기둥
	if (wtrunk >= 0.7) {
		Tree_trunk = "지나치게 큰 기둥";
		AggAnx = +5;
	}

	// 얇은 기둥
	if (wtrunk <= 0.2) {
		Tree_trunk = "지나치게 작은 기둥";
		AggAnx = +5;
	}

	String diagnosis_result = "님의 수관의 모양으로 보아 " + crown + "\n" + "사과의 의미는 " + ap + "\n" + bi + "\n" + "가지의 모양으로 보아" + branch
			+ "\n" + "기둥의 모양으로 보아" + trunk + "\n" + "뿌리의 모양으로 보아" + root + "\n";
	%>

	<script>
	let obj = {
			"diagnosis_result" : diagnosis_result,
			"AggAnx" : AggAnx,
			"SocialAnx" : SocialAnx,
			"SadAnx": SadAnx,
			"CompleAnx": CompleAnx,
			"RegAnx": RegAnx
	}
	
	$.ajax({
		url : "insertResult",
		type : 'Post',
		data : obj,
		dataType : 'json',
		success : function(res) {
			console.log('성공');
		},

		error : function() {
			console.log('실패');
		}

	});
	</script>

</body>
</html>