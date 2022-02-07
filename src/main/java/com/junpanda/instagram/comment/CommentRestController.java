package com.junpanda.instagram.comment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/*
 * @RestController
 * 
 * @RequestMapping("/comment") public class CommentRestController {
 * 
 * @PostMapping("/create") public Map<String, String> createcomment(
 * HttpServletRequest request){
 * 
 * HttpSession session = request.getSession();
 * 
 * //현재 로그인된 사용자의 user table int userId =
 * (Integer)session.getAttribute("userId"); String nameView =
 * (String)session.getAttribute("userName");
 * 
 * }
 * 
 * }
 */
