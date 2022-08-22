package kr.smhrd.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import kr.smhrd.model.BoardVO;
import kr.smhrd.model.Criteria;
import kr.smhrd.model.ResultInfoVO;
import kr.smhrd.model.ResultVO;

@Service
public interface TreeListService {
	
	/* 게시판 등록 */
	public void enroll(BoardVO board);
	
	/* 게시판 목록 */
	public List<BoardVO> getList();	
	
	/* 게시판 목록(페이징 적용) */
	public List<ResultInfoVO> getListPaging();	
	
	/* 게시판 총 갯수 */
	@Select("select count(*) from (select row_number()over(order by idx asc) as idx_num , td.image, (select nickname from memberinfo as mi where td.userid = mi.userid) nickname from testdata as td where testopen = 'y') as tmp")
	public int getTotal();
	
	/* 게시판 조회 */
	public BoardVO getPage(int bno);
	
	/* 게시판 수정 */
	public int modify(BoardVO board);	
	
	/* 게시판 삭제 */
	public int delete(int bno);	
	

}
