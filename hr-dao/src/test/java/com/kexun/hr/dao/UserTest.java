package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Users;

public class UserTest { 

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");

		UserMapper userMapper = (UserMapper) context.getBean("userMapper");

//		Users findUserByName = userMapper.findUserByName("lidong");

//		System.out.println(findUserByName);

		List<Users> users = userMapper.findUsers();

		System.out.println(users);

	}

}
