package com.orange.project.mapper;

import com.orange.project.entity.SysRoule;

import java.util.List;

public interface SysRouleMapper {

    int deleteBySysRoule(SysRoule sysRoule);

    List<SysRoule> selectAll(SysRoule sysRoule);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    int insert(SysRoule record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    int insertSelective(SysRoule record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    SysRoule selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SysRoule record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_roule
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SysRoule record);
}