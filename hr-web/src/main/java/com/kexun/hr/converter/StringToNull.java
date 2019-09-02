package com.kexun.hr.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.util.StringUtils;

public class StringToNull implements Converter<String, String> {
    @Override
    public String convert(String source) {

        if (StringUtils.isEmpty(source)) {

            return null;
        } else {
            return source;

        }

    }
}
