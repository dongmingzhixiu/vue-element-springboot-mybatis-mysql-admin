package com.orange.project.mapper;

import com.orange.project.entity.ProductType;

import java.util.List;

public interface ProductTypeMapper {

    List<ProductType> selectAll(ProductType productType);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    int insert(ProductType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    int insertSelective(ProductType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    ProductType selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ProductType record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product_type
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ProductType record);
}