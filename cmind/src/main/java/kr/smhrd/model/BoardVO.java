package kr.smhrd.model;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class BoardVO {
	// 반드시 table 컬럼명과 class의 field 명을 일치 시킬 것!
	private int idx;
	private String title;
	private String writer;
	private String indate;
	private String contents;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	

}
