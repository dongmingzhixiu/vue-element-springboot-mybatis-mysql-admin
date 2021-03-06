package com.orange.project.entity;

import java.util.Date;

public class SysLayout {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.menu_id
     *
     * @mbggenerated
     */
    private String menuId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.layout_type
     *
     * @mbggenerated
     */
    private Integer layoutType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.remake
     *
     * @mbggenerated
     */
    private String remake;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.created_by
     *
     * @mbggenerated
     */
    private String createdBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.created_time
     *
     * @mbggenerated
     */
    private Date createdTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.updated_by
     *
     * @mbggenerated
     */
    private String updatedBy;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.updated_time
     *
     * @mbggenerated
     */
    private Date updatedTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.enabled
     *
     * @mbggenerated
     */
    private Boolean enabled;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.api_name
     *
     * @mbggenerated
     */
    private String apiName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.cols
     *
     * @mbggenerated
     */
    private Integer cols;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.code
     *
     * @mbggenerated
     */
    private String code;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.layout_json
     *
     * @mbggenerated
     */
    private String layoutJson;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_layout.layout_json
     *
     * @mbggenerated
     */
    private String rouleJson;


    public String getMerchantNo() {
        return merchantNo;
    }

    public void setMerchantNo(String merchantNo) {
        this.merchantNo = merchantNo;
    }

    private String merchantNo;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.id
     *
     * @return the value of sys_layout.id
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.id
     *
     * @param id the value for sys_layout.id
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.menu_id
     *
     * @return the value of sys_layout.menu_id
     * @mbggenerated
     */
    public String getMenuId() {
        return menuId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.menu_id
     *
     * @param menuId the value for sys_layout.menu_id
     * @mbggenerated
     */
    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.layout_type
     *
     * @return the value of sys_layout.layout_type
     * @mbggenerated
     */
    public Integer getLayoutType() {
        return layoutType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.layout_type
     *
     * @param layoutType the value for sys_layout.layout_type
     * @mbggenerated
     */
    public void setLayoutType(Integer layoutType) {
        this.layoutType = layoutType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.remake
     *
     * @return the value of sys_layout.remake
     * @mbggenerated
     */
    public String getRemake() {
        return remake;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.remake
     *
     * @param remake the value for sys_layout.remake
     * @mbggenerated
     */
    public void setRemake(String remake) {
        this.remake = remake == null ? null : remake.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.created_by
     *
     * @return the value of sys_layout.created_by
     * @mbggenerated
     */
    public String getCreatedBy() {
        return createdBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.created_by
     *
     * @param createdBy the value for sys_layout.created_by
     * @mbggenerated
     */
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.created_time
     *
     * @return the value of sys_layout.created_time
     * @mbggenerated
     */
    public Date getCreatedTime() {
        return createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.created_time
     *
     * @param createdTime the value for sys_layout.created_time
     * @mbggenerated
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.updated_by
     *
     * @return the value of sys_layout.updated_by
     * @mbggenerated
     */
    public String getUpdatedBy() {
        return updatedBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.updated_by
     *
     * @param updatedBy the value for sys_layout.updated_by
     * @mbggenerated
     */
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.updated_time
     *
     * @return the value of sys_layout.updated_time
     * @mbggenerated
     */
    public Date getUpdatedTime() {
        return updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.updated_time
     *
     * @param updatedTime the value for sys_layout.updated_time
     * @mbggenerated
     */
    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.enabled
     *
     * @return the value of sys_layout.enabled
     * @mbggenerated
     */
    public Boolean getEnabled() {
        return enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.enabled
     *
     * @param enabled the value for sys_layout.enabled
     * @mbggenerated
     */
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.api_name
     *
     * @return the value of sys_layout.api_name
     * @mbggenerated
     */
    public String getApiName() {
        return apiName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.api_name
     *
     * @param apiName the value for sys_layout.api_name
     * @mbggenerated
     */
    public void setApiName(String apiName) {
        this.apiName = apiName == null ? null : apiName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.cols
     *
     * @return the value of sys_layout.cols
     * @mbggenerated
     */
    public Integer getCols() {
        return cols;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.cols
     *
     * @param cols the value for sys_layout.cols
     * @mbggenerated
     */
    public void setCols(Integer cols) {
        this.cols = cols;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.code
     *
     * @return the value of sys_layout.code
     * @mbggenerated
     */
    public String getCode() {
        return code;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.code
     *
     * @param code the value for sys_layout.code
     * @mbggenerated
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_layout.layout_json
     *
     * @return the value of sys_layout.layout_json
     * @mbggenerated
     */
    public String getLayoutJson() {
        return layoutJson;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_layout.layout_json
     *
     * @param layoutJson the value for sys_layout.layout_json
     * @mbggenerated
     */
    public void setLayoutJson(String layoutJson) {
        this.layoutJson = layoutJson == null ? null : layoutJson.trim();
    }

    public String getRouleJson() {
        return rouleJson;
    }

    public void setRouleJson(String rouleJson) {
        this.rouleJson = rouleJson;
    }
}