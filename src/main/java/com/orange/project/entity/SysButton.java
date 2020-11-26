package com.orange.project.entity;

import java.util.Date;

public class SysButton {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.icon
     *
     * @mbggenerated
     */
    private String icon;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.method_name
     *
     * @mbggenerated
     */
    private String methodName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.method_param
     *
     * @mbggenerated
     */
    private String methodParam;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.size
     *
     * @mbggenerated
     */
    private String size;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.type
     *
     * @mbggenerated
     */
    private String type;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.css
     *
     * @mbggenerated
     */
    private String css;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.menu_id
     *
     * @mbggenerated
     */
    private String menuId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.remake
     *
     * @mbggenerated
     */
    private String remake;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.created_by
     *
     * @mbggenerated
     */
    private String createdBy;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.created_time
     *
     * @mbggenerated
     */
    private Date createdTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.updated_by
     *
     * @mbggenerated
     */
    private String updatedBy;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.updated_time
     *
     * @mbggenerated
     */
    private Date updatedTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.enabled
     *
     * @mbggenerated
     */
    private Boolean enabled;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.menu_type
     *
     * @mbggenerated
     */
    private Integer menuType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_button.sort
     *
     * @mbggenerated
     */
    private Integer sort;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.id
     *
     * @return the value of sys_button.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.id
     *
     * @param id the value for sys_button.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.title
     *
     * @return the value of sys_button.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.title
     *
     * @param title the value for sys_button.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.name
     *
     * @return the value of sys_button.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.name
     *
     * @param name the value for sys_button.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.icon
     *
     * @return the value of sys_button.icon
     *
     * @mbggenerated
     */
    public String getIcon() {
        return icon;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.icon
     *
     * @param icon the value for sys_button.icon
     *
     * @mbggenerated
     */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.method_name
     *
     * @return the value of sys_button.method_name
     *
     * @mbggenerated
     */
    public String getMethodName() {
        return methodName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.method_name
     *
     * @param methodName the value for sys_button.method_name
     *
     * @mbggenerated
     */
    public void setMethodName(String methodName) {
        this.methodName = methodName == null ? null : methodName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.method_param
     *
     * @return the value of sys_button.method_param
     *
     * @mbggenerated
     */
    public String getMethodParam() {
        return methodParam;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.method_param
     *
     * @param methodParam the value for sys_button.method_param
     *
     * @mbggenerated
     */
    public void setMethodParam(String methodParam) {
        this.methodParam = methodParam == null ? null : methodParam.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.size
     *
     * @return the value of sys_button.size
     *
     * @mbggenerated
     */
    public String getSize() {
        return size;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.size
     *
     * @param size the value for sys_button.size
     *
     * @mbggenerated
     */
    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.type
     *
     * @return the value of sys_button.type
     *
     * @mbggenerated
     */
    public String getType() {
        return type;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.type
     *
     * @param type the value for sys_button.type
     *
     * @mbggenerated
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.css
     *
     * @return the value of sys_button.css
     *
     * @mbggenerated
     */
    public String getCss() {
        return css;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.css
     *
     * @param css the value for sys_button.css
     *
     * @mbggenerated
     */
    public void setCss(String css) {
        this.css = css == null ? null : css.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.menu_id
     *
     * @return the value of sys_button.menu_id
     *
     * @mbggenerated
     */
    public String getMenuId() {
        return menuId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.menu_id
     *
     * @param menuId the value for sys_button.menu_id
     *
     * @mbggenerated
     */
    public void setMenuId(String menuId) {
        this.menuId = menuId == null ? null : menuId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.remake
     *
     * @return the value of sys_button.remake
     *
     * @mbggenerated
     */
    public String getRemake() {
        return remake;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.remake
     *
     * @param remake the value for sys_button.remake
     *
     * @mbggenerated
     */
    public void setRemake(String remake) {
        this.remake = remake == null ? null : remake.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.created_by
     *
     * @return the value of sys_button.created_by
     *
     * @mbggenerated
     */
    public String getCreatedBy() {
        return createdBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.created_by
     *
     * @param createdBy the value for sys_button.created_by
     *
     * @mbggenerated
     */
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.created_time
     *
     * @return the value of sys_button.created_time
     *
     * @mbggenerated
     */
    public Date getCreatedTime() {
        return createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.created_time
     *
     * @param createdTime the value for sys_button.created_time
     *
     * @mbggenerated
     */
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.updated_by
     *
     * @return the value of sys_button.updated_by
     *
     * @mbggenerated
     */
    public String getUpdatedBy() {
        return updatedBy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.updated_by
     *
     * @param updatedBy the value for sys_button.updated_by
     *
     * @mbggenerated
     */
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.updated_time
     *
     * @return the value of sys_button.updated_time
     *
     * @mbggenerated
     */
    public Date getUpdatedTime() {
        return updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.updated_time
     *
     * @param updatedTime the value for sys_button.updated_time
     *
     * @mbggenerated
     */
    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.enabled
     *
     * @return the value of sys_button.enabled
     *
     * @mbggenerated
     */
    public Boolean getEnabled() {
        return enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.enabled
     *
     * @param enabled the value for sys_button.enabled
     *
     * @mbggenerated
     */
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.menu_type
     *
     * @return the value of sys_button.menu_type
     *
     * @mbggenerated
     */
    public Integer getMenuType() {
        return menuType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.menu_type
     *
     * @param menuType the value for sys_button.menu_type
     *
     * @mbggenerated
     */
    public void setMenuType(Integer menuType) {
        this.menuType = menuType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_button.sort
     *
     * @return the value of sys_button.sort
     *
     * @mbggenerated
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_button.sort
     *
     * @param sort the value for sys_button.sort
     *
     * @mbggenerated
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }
}