package com.spring.user.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.user.vo.UserVo;

public interface UserDao {

	int userInsert(UserVo userVo) throws Exception ;

	int userIdDuplCheck(String userId) throws Exception ;

	List<BoardVo> selectUserPhoneList(BoardVo boardVo) throws Exception ;

	UserVo userLoginCheck(UserVo userVo) throws Exception ;

	int userIdCheck(UserVo userVo) throws Exception ;

	int userPwCheck(UserVo userVo) throws Exception ;

	UserVo userLoginAction(UserVo userVo) throws Exception;

}
