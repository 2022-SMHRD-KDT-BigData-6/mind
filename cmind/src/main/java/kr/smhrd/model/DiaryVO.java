package kr.smhrd.model;

import lombok.Data;

@Data
public class DiaryVO {
	
	private int diaryidx;
	private String userid;
	private String diarycontents;
	private String emotion;
	private String writedate;

}
