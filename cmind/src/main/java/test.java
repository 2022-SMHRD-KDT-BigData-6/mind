import java.util.ArrayList;

public class test {

	public static void main(String[] args) {

		int score1 = 0;
		int score2 = 0;
		int score3 = 0;
		int score4 = 0;
		int score5 = 0;

		int apple = 0;
		int bird = 0;
		double h = 0;
		String Tree_h = "정상크기나무";
		
		double wcrown = 0;
		String Tree_crown = "정상크기수관";
		
		double wtrunk = 0;
		String Tree_trunk  = "정상크기기둥";
		

		String ap = "사과 없거나 8개 이하";
		String bi = "새가 없거나 4개 이하";
		String branch = "가지생략";
		String crown = "공허함, 좌절감이 가득하고 의욕이 모두 상실된 상태입니다.";
		String root = "불안정한 감정과 우울감 안정적이지 않고 소속감이 없습니다.";
		String trunk = "견고한 내면상태를 가지고 있습니다.";
		int knot = 0;

		String test ="7 0.507212 0.43149 0.725962 0.310096\r\n" + 
				"9 0.477163 0.807692 0.497596 0.0961538\r\n" + 
				"4 0.515625 0.450721 0.53125 0.175481\r\n" + 
				"0 0.247596 0.448317 0.0576923 0.0360577\r\n" + 
				"0 0.71875 0.388221 0.0721154 0.0360577\r\n" + 
				"0 0.78726 0.633413 0.0841346 0.0504808\r\n" + 
				"0 0.155048 0.701923 0.0985577 0.0528846\r\n" + 
				"0 0.56851 0.450721 0.0600962 0.0360577\r\n" + 
				"13 0.508413 0.651442 0.415865 0.211538\r\n" + 
				"0 0.358173 0.33774 0.0721154 0.0360577\r\n" + 
				"0 0.548077 0.33774 0.0721154 0.0408654\r\n" + 
				"";

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
					score1 = +1;
					score3 = +5;
					score4 = +2;
					score5 = +4;
				}
			} else if (a.get(i)[0].equals("1")) {
				bird++;
				bi = "새 마리수가 많을 수록 외로움의 표현 퇴행";
				if (bird > 4) {
					score1 = +1;
					score3 = +2;
					score4 = +3;
					score5 = +6;
				}

				// 가지
			} else if (a.get(i)[0].equals("2")) {
				branch = "비논리적이고 무분별한, 예의가 없는 무식한 성향 좌절 상처";
				score1++;
				score2++;
				score3 = +3;
			} else if (a.get(i)[0].equals("3")) {
				branch = "지속된 불안, 우울의 표현 옹이와 유사하게 심리적 외상";
				score1 = +3;
				score2 = +1;
				score3 = +4;
				score5 = +2;
			} else if (a.get(i)[0].equals("4")) {
				branch = "공격성, 예민성, 관계부적응의 성향을 가질가능성이 있습니다.";
				score1 = +4;
				score2 = +3;
				score4 = +1;

				// 수관
			} else if (a.get(i)[0].equals("5")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "적극적인 공상활동을 나타냄\r\n" + "현실에 대한 불만족감이나 부정의 일환으로 공상에 지나치게 몰두할 가능성을 시사";
				score5 = +5;
			} else if (a.get(i)[0].equals("6")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "정서적 흥분이나 불안정성, 충동성, 혼란스러운 내적 상태를 나타냄";
				score1 = +1;
				score2 = +6;
				score3 = +5;
				score4 = +4;
				score5 = +2;
			} else if (a.get(i)[0].equals("7")) {
				h += Double.parseDouble(a.get(i)[4]);
				wcrown += Double.parseDouble(a.get(i)[3]);
				crown = "뜬 구름 같은 심리상태 불안정하고 막연함";
				score1 = +1;
				score3 = +6;
				score5 = +3;

				// 옹이
			} else if (a.get(i)[0].equals("8")) {
				trunk = "트라우마, 퇴행 성장 과정동안 경험한 심리적 외상을 상징";
				score1 = +6;
				score2 = +1;
				score3 = +4;
				score5 = +3;
				knot++;

				// 뿌리
			} else if (a.get(i)[0].equals("9")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "불안감과 강한 의존욕구";
				score2 = +1;
				score4 = +2;
			} else if (a.get(i)[0].equals("10")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "자신에 대해 불안정감을 느끼고 있으며 이를 과잉 보상하려는 시도로 볼 수 있음";
				score1 = +1;
				score2 = +2;
				score3 = +5;
				score4 = +2;
			} else if (a.get(i)[0].equals("11")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "현실을 검증하는 능력에 장애";
				score1 = +1;
				score2 = +2;
				score4 = +3;
				score5 = +4;
			} else if (a.get(i)[0].equals("12")) {
				h += Double.parseDouble(a.get(i)[4]);
				root = "미성숙하거나 불안정했던 과거에 대한 관심 스스로를 확신할 수 없는 사람, 과거만을 추구하기 때문에 앞으로 나아가기 힘듬";
				score1 = +1;
				score2 = +3;

				// 기둥
			} else if (a.get(i)[0].equals("13")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "환경과의 관계에 강한 관심, 자신을 강박적으로 통제";
				score1 = +1;
				score2 = +2;

			} else if (a.get(i)[0].equals("14")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "외부의 어떤 힘에 의해 억압을 받고 있음을 시사합니다.";
				score1 = +1;
				score2 = +2;
				score3 = +3;
				score4 = +2;
				score5 = +1;
			} else if (a.get(i)[0].equals("15")) {
				h += Double.parseDouble(a.get(i)[4]);
				wtrunk += Double.parseDouble(a.get(i)[3]);
				trunk = "견고한 내면상태를 가지고 있습니다.";
				score5 = +5;
			}

		}
		
		// 지나치게 큰나무
		if (h > 0.8) {
			score1 = +5;
			Tree_h="지나치게 큰나무";
		}

		// 지나치게 작은나무
		if (h < 0.4) {
			score1 = +0;
			score2 = +3;
			score3 = +10;
			score4 = +7;
			score5 = +0;
			Tree_h="지나치게 작은나무";
		}

		// 큰 수관
		if (wcrown > 0.8) {
			Tree_crown = "지나치게 큰 수관";
			score1 = +5;
		}

		// 작은 수관
		if (wcrown < 0.4) {
			Tree_crown = "지나치게 작은수관";
			score1 = +5;
		}

		// 두꺼운 기둥
		if (wtrunk>=0.7) {
			Tree_trunk = "지나치게 큰 기둥";
			score1 = +5;
		}

		// 얇은 기둥
		if (wtrunk<=0.2) {
			Tree_trunk = "지나치게 작은 기둥";
			score1 = +5;
		}

		System.out.println("OOO님의 수관의 모양으로 보아 " + crown + "\n" + "사과의 의미는 " + ap + "\n" + bi + "\n" + "가지의 모양으로 보아"
				+ branch + "\n" + "기둥의 모양으로 보아" + trunk + "\n" + "뿌리의 모양으로 보아" + root+"\n");
		System.out.println(Tree_h+"  " + Tree_crown+"  " + Tree_trunk+"\n");
		System.out.println(score1+"  "+score2+"  "+score3+"  "+score4+"  "+score5);
		System.out.println("전체 높이 : " + h);
		System.out.println("기둥 넓이: " + wtrunk);
		System.out.println("수관 넓이: " + wcrown);
	}
}

