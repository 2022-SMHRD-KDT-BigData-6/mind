package kr.smhrd.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String userid;
	private String userpw;
	private String nickname;
	private String email;
	private char usertype;
	private char procheck;
	private String facilityid;
	private String joindate;
	
}
