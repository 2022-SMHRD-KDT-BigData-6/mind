package kr.smhrd.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.Criteria;
import kr.smhrd.model.ResultInfoVO;
import kr.smhrd.model.ResultVO;

@Service
@Mapper
public class TreeListServiceImpl implements TreeListService{
		
		@Autowired
		private BoardMapper mapper;
		
		/* 게시물 총 갯수 */
		@Override
		public int getTotal() {			
			return mapper.getTotal();
		}

		@Override
		public void enroll(BoardVO board) {
		}

		@Override
		public List<ResultInfoVO> getListPaging() {
			return mapper.getListPaging();
		}

		@Override
		public BoardVO getPage(int bno) {
			return null;
		}

		@Override
		public int modify(BoardVO board) {
			return 0;
		}

		@Override
		public int delete(int bno) {
			return 0;
		}

		@Override
		public List<BoardVO> getList() {
			return null;
		}



}
