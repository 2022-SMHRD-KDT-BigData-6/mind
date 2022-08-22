package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.smhrd.model.DiaryVO;
import kr.smhrd.model.EmotionstatVO;
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

	public TestVO selectResult(String userid);

	public String selectbox(String userid);

	public String selectimg(String userid);

	// 감정일기 리스트
	public List<DiaryVO> boardList(DiaryVO vo);

	public List<DiaryVO> boardSelect(DiaryVO vo);

	@Select("select * from emotion_diary where userid=#{userid} and date_format(writedate,'%Y-%m-%d')=date_format(now(),'%Y-%m-%d')")
	public DiaryVO userdaydiary(DiaryVO vo);

	@Select("select * from emotion_diary where userid=#{userid} and date_format(writedate,'%Y-%m-%d')=#{writedate}")
	public DiaryVO useronedaydiary(DiaryVO vo);

	// 감정일기 글쓰기
	public int DiaryInsert(DiaryVO vo);

	// 감정일기 수정
	@Update("update emotion_diary set diarycontents=#{diarycontents},emotion=#{emotion} where userid=#{userid} and date_format(writedate,'%Y-%m-%d')=#{writedate}")
	public void boardUpdateAjax(DiaryVO vo);
	
	   // 감정일기 통계
	   // 이번달
	   public List<EmotionstatVO> thisMonthEmotionState(String userid);
	   // 저번달
	   public List<EmotionstatVO> pastMonthEmotionState(String userid);
	   // 이번달 감정  각각 갯수
	   public List<EmotionstatVO> thisMonthEmotuonCntState(String userid);

}
