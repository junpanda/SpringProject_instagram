package com.junpanda.instagram.user.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junpanda.instagram.common.EncryptUtils;
import com.junpanda.instagram.user.DAO.UserDAO;
import com.junpanda.instagram.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encPassword, name, email);
	}
	
	public User getUser(String loginId, String password) {
		return userDAO.selectUser(loginId, EncryptUtils.md5(password));
	}
}
