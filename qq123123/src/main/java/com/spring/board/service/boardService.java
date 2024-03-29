package com.spring.board.service;

import java.util.HashMap;
import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;
	
	public List<BoardVo> SelectCodeIdList(BoardVo boardVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(HashMap<String, String> board) throws Exception;

	public int boardDelete(int boardNum) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;

	public List<BoardVo> boardListCheck(HashMap<String, Object> hmap) throws Exception;
	
	
}
