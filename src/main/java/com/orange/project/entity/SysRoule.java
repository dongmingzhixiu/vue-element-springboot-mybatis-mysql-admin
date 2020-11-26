package com.orange.project.entity;

import java.util.Date;

public class SysRoule {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.type
     *
     * @mbggenerated
     */
    private String type;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.user_id
     *
     * @mbggenerated
     */
    private String userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.roule_id
     *
     * @mbggenerated
     */
    private String rouleId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.control_id
     *
     * @mbggenerated
     */
    private String controlId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.remake
     *
     * @mbggenerated
     */
    private String remake;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.created_by
     *
     * @mbggenerated
     */
    private String createdBy;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.created_time
     *
     * @mbggenerated
     */
    private Date createdTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.updated_by
     *
     * @mbggenerated
     */
    private String updatedBy;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.updated_time
     *
     * @mbggenerated
     */
    private Date updatedTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_roule.layout_json
     *
     * @mbggenerated
     */
    private String layoutJson;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.id
     *
     * @return the value of sys_roule.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.id
     *
     * @param id the value for sys_roule.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.type
     *
     * @return the value of sys_roule.type
     *
     * @mbggenerated
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.type
     *
     * @param type the value for sys_roule.type
     *
     * @mbggenerated
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.user_id
     *
     * @return the value of sys_roule.user_id
     *
     * @mbggenerated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.user_id
     *
     * @param userId the value for sys_roule.user_id
     *
     * @mbggenerated
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.roule_id
     *
     * @return the value of sys_roule.roule_id
     *
     * @mbggenerated
     */
    public String getRouleId() {
        return rouleId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.roule_id
     *
     * @param rouleId the value for sys_roule.roule_id
     *
     * @mbggenerated
     */
    public void setRouleId(String rouleId) {
        this.rouleId = rouleId == null ? null : rouleId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.control_id
     *
     * @return the value of sys_roule.control_id
     *
     * @mbggenerated
     */
    public String getControlId() {
        return controlId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.control_id
     *
     * @param controlId the value for sys_roule.control_id
     *
     * @mbggenerated
     */
    public void setControlId(String controlId) {
        this.controlId = controlId == null ? null : controlId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.remake
     *
     * @return the value of sys_roule.remake
     *
     * @mbggenerated
     */
    public String getRemake() {
        return remake;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.remake
     *
     * @param remake the value for sys_roule.remake
     *
     * @mbggenerated
     */
    public void setRemake(String remake) {
        this.remake = remake == null ? null : remake.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.created_by
     *
     * @return the value of sys_roule.created_by
     *
     * @mbggenerated
     */
    public String getCreatedBy() {
        return createdBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.created_by
     *
     * @param createdBy the value for sys_roule.created_by
     *
     * @mbggenerated
     */
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.created_time
     *
     * @return the value of sys_roule.created_time
     *
     * @mbggenerated
     */
    public Date getCreatedTime() {
        return createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.created_time
     *
     * @param createdTime the value for sys_roule.created_time
     *
     * @mbggenerated
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.updated_by
     *
     * @return the value of sys_roule.updated_by
     *
     * @mbggenerated
     */
    public String getUpdatedBy() {
        return updatedBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.updated_by
     *
     * @param updatedBy the value for sys_roule.updated_by
     *
     * @mbggenerated
     */
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.updated_time
     *
     * @return the value of sys_roule.updated_time
     *
     * @mbggenerated
     */
    public Date getUpdatedTime() {
        return updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.updated_time
     *
     * @param updatedTime the value for sys_roule.updated_time
     *
     * @mbggenerated
     */
    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_roule.layout_json
     *
     * @return the value of sys_roule.layout_json
     *
     * @mbggenerated
     */
    public String getLayoutJson() {
        return layoutJson;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_roule.layout_json
     *
     * @param layoutJson the value for sys_roule.layout_json
     *
     * @mbggenerated
     */
    public void setLayoutJson(String layoutJson) {
        this.layoutJson = layoutJson == null ? null : layoutJson.trim();
    }
}