package kr.smhrd.model;

import lombok.Data;
import lombok.Getter;

@Data
public class BoardVO {
	// 반드시 table 컬럼명과 class의 field 명을 일치 시킬 것!
	private int idx;
	private String title;
	private String writer;
	private String indate;
	private String contents;
}
