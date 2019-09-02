package com.kexun.hr.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Msg {

	private int code;

	private String message;

	private Map<String,Object> data = new HashMap<String,Object>();

	public Msg success(String message) {
		this.code = 200;
		this.message = message;
		return this;
	}

	public Msg error(String message) {
		this.code = 500;
		this.message = message;
		return this;
	}

	public Msg warning(String message) {
		this.code = 300;
		this.message = message;
		return this;
	}

	public Msg data(String key,Object obj) {
		data.put(key,obj);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}



	

}
