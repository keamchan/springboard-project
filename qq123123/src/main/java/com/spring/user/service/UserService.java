package com.spring.user.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.user.vo.UserVo;

public interface UserService {

	int userInsert(UserVo userVo) throws Exception;

	int userIdDuplCheck(String userId) throws Exception;

	List<BoardVo> SelectUserPhoneList(BoardVo boardVo) throws Exception;

	UserVo userLoginCheck(UserVo userVo) throws Exception;

	int userIdCheck(UserVo userVo) throws Exception;

	int userPwCheck(UserVo userVo) throws Exception;

	UserVo userLoginAction(UserVo userVo) throws Exception;

}
