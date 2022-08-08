package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.TreeVO;
import kr.smhrd.model.MemberVO;


public interface BoardMapper {
	public List<BoardVO> BoardList();
	
	// 회원가입
	public void BoardSign(MemberVO vo);
	
	public BoardVO boardContent(int idx);

	@Delete("delete from board where idx=#{idx}")
	public void boardDelete(int idx);
	
	public void boardUpdate(BoardVO vo);
	
	public TreeVO treeInsert(TreeVO tvo);
	
	public List<TreeVO> TreeList(String userid);

	// 로그인
	@Select("select * from memberinfo where userid=#{userid} and userpw=#{userpw}")
	public MemberVO boardLogin(MemberVO vo);

	public List<MemberVO> MemberList(String userid);
	

}
