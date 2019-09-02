package com.kexun.hr.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDate implements Converter<String, Date> {


    @Override
    public Date convert(String source) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
        	if(StringUtils.isEmpty(source)) {
        		return null;
        	}else {
            date = format.parse(source);
        	}
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
