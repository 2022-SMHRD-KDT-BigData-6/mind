package kr.smhrd.model;

import lombok.Data;

//회원 중 그림 공개를 허용한 회원들의 이미지 파일 이름, 닉네임, 조회된 순서 번호 조회를 위한 VO
//Select("select row_number()over(order by testidx asc) as idx_num , tl.imgname, (select nickname from memberinfo as mi where tl.userid = mi.userid) nickname from test_log as tl where testopen = 'y'")

@Data
public class ResultInfoVO {
	private int idx_num;
	private String nickname;
	private String image;
}
