package kr.smhrd.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TestVO {
	
	private int testidx;
	private String imgname;
	private String userid;
	private char testopen;
	private String resultdate;
	private int AggAnx;
	private int SocialAnx;
	private int SadAnx;
	private int ComplexAnx;
	private int RegAnx;
	private String diagnosis_result;
}
