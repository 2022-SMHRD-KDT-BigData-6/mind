package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.TestVO;

public interface BoardMapper {
	// 회원가입
	public void BoardSign(MemberVO vo);

	@Delete("delete from board where idx=#{idx}")
	public void boardDelete(int idx);
	
	// 로그인
	@Select("select * from memberinfo where userid=#{userid} and userpw=#{userpw}")
	public MemberVO boardLogin(MemberVO vo);

	public List<MemberVO> MemberList(String userid);

	public void result(TestVO tvo);

	public void insertResult(TestVO tvo);
	
	public TestVO selectReuslt(TestVO tvo);

	

}
