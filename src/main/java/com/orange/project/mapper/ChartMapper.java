package com.orange.project.mapper;

import java.util.LinkedHashMap;
import java.util.List;

public interface ChartMapper {

    List<LinkedHashMap> selectPayToDay(String day, String merchantNo);
//
}