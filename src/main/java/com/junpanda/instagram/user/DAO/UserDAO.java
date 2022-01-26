package com.junpanda.instagram.user.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.junpanda.instagram.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
}
