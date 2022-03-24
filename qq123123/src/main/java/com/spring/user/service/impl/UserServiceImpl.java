package com.spring.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.vo.BoardVo;
import com.spring.user.dao.UserDao;
import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;

	@Override
	public int userInsert(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userInsert(userVo);
	}

	@Override
	public int userIdDuplCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userIdDuplCheck(userId);
	}

	@Override
	public List<BoardVo> SelectUserPhoneList(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.selectUserPhoneList(boardVo);
	}

	@Override
	public UserVo userLoginCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userLoginCheck(userVo);
	}

	@Override
	public int userIdCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userIdCheck(userVo);
	}

	@Override
	public int userPwCheck(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userPwCheck(userVo);
	}

	@Override
	public UserVo userLoginAction(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.userLoginAction(userVo);
	}

}
