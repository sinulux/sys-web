package com.springboot.tag.entity;

import com.springboot.entity.hibernate.impl.ABaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sys_label")
public class LabelEO extends ABaseEntity {
    //主键ID
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ID")
    private Long id;

    @Column(name="LABEL_NAME")
    private String labelName;

    @Column(name="LABEL_DESC")
    private String desc;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
