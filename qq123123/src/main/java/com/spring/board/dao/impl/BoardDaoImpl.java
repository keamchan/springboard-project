package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(HashMap<String, String> board) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", board);
	}
	@Override
	public int boardDelete(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete", boardNum);
	}
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardUpdate", boardVo);
	}
	@Override
	public List<BoardVo> boardListCheck(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardListCheck", hmap);
	}
	@Override
	public List<BoardVo> selectCodeIdList(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.codeIdList",boardVo);
	}

	
	
}
