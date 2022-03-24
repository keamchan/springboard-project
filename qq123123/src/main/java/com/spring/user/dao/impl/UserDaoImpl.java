package com.spring.user.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.vo.BoardVo;
import com.spring.user.dao.UserDao;
import com.spring.user.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userInsert(UserVo userVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("user.userInsert", userVo);
	}

	@Override
	public int userIdDuplCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userIdDuplCheck", userId);
	}

	@Override
	public List<BoardVo> selectUserPhoneList(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("user.userPhoneList", boardVo);
	}

	@Override
	public UserVo userLoginCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userLoginCheck", userVo);
	}

	@Override
	public int userIdCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userIdCheck", userVo);
	}

	@Override
	public int userPwCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userPwCheck", userVo);
	}

	@Override
	public UserVo userLoginAction(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userLoginAction", userVo);
	}

}
