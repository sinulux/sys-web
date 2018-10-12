package com.springboot.entity.business;

import com.springboot.entity.hibernate.impl.ABaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CMS_ZSKS_REL")
public class ScoreInfoRelEO extends ABaseEntity {

    private static final long serialVersionUID = 3654918833603015715L;

    private enum Type{
        table,//关联的表
        query_field,//查询字段
        show_field//显示字段
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ID")
    private Long ID;

    @Column(name="SCORE_INFO_ID")
    private Long scoreInfoId;// 数据库ID

    @Column(name="TABLE_NAME")
    private String tableName;// 数据表名

    @Column(name="REL_TYPE")
    private String relType;// 关系类型

    @Column(name="FIELD_NAME")
    private String fieldName;// 数据字段名

    @Column(name="FIELD_SHOW_NAME")
    private String fieldShowName;// 显示字段名

    @Column(name="INPUT_TYPE")
    private String inputType = "text";// 控件类型,默认文本

    @Column(name="FIELD_REMARK")
    private String fieldRemark ;// 字段说明

    @Column(name="ALLOW_EMPTY")
    private Integer allowEmpty = 0 ;// 允许空,默认必填

    @Column(name="FIELD_STYLE")
    private String fieldStyle ;// 样式

    public Long getID() {
        return ID;
    }

    public void setID(Long ID) {
        this.ID = ID;
    }

    public Long getScoreInfoId() {
        return scoreInfoId;
    }

    public void setScoreInfoId(Long scoreInfoId) {
        this.scoreInfoId = scoreInfoId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getFieldShowName() {
        return fieldShowName;
    }

    public void setFieldShowName(String fieldShowName) {
        this.fieldShowName = fieldShowName;
    }

    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public String getFieldRemark() {
        return fieldRemark;
    }

    public void setFieldRemark(String fieldRemark) {
        this.fieldRemark = fieldRemark;
    }

    public Integer getAllowEmpty() {
        return allowEmpty;
    }

    public void setAllowEmpty(Integer allowEmpty) {
        this.allowEmpty = allowEmpty;
    }

    public String getFieldStyle() {
        return fieldStyle;
    }

    public void setFieldStyle(String fieldStyle) {
        this.fieldStyle = fieldStyle;
    }

    public String getRelType() {
        return relType;
    }

    public void setRelType(String relType) {
        this.relType = relType;
    }
}
