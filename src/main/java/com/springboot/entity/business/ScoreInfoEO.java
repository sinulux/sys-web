package com.springboot.entity.business;

import com.springboot.entity.hibernate.impl.ABaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="CMS_ZSKS_INFO")
public class ScoreInfoEO extends ABaseEntity {

	private static final long serialVersionUID = 9128482340949401558L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ID")
	private Long ID;

	//数据库标题
	@Column(name="database_title")
	private  String title;

	//数据库类型
	@Column(name="database_type")
	private  String type;

	//数据表名称
	@Column(name="table_name")
	private Long name;

	//激活状态
	@Column(name="active_status")
	private Integer activeStatus = 0;

	public Long getID() {
		return ID;
	}

	public void setID(Long ID) {
		this.ID = ID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getName() {
		return name;
	}

	public void setName(Long name) {
		this.name = name;
	}

	public Integer getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(Integer activeStatus) {
		this.activeStatus = activeStatus;
	}
}
