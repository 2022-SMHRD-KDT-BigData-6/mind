package kr.smhrd.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TestVO {
	
	private int testidx;
	private String userid;
	private String resultdate;
	private int agganx;
	private int socialanx;
	private int sadanx;
	private int complexanx;
	private int reganx;
	private String diagnosis_result;
}
