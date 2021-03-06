package com.orange.project.mapper;

import com.orange.project.entity.SysButton;

import java.util.List;

public interface SysButtonMapper {

    List<SysButton> selectAllByRouleUser(String userId, String menuId);

    List<SysButton> selectAllByMerchantNo(String merchantNo);


    List<SysButton> selectAll(SysButton sysButton);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    int insert(SysButton record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    int insertSelective(SysButton record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    SysButton selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(SysButton record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_button
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(SysButton record);
}