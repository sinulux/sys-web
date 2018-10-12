package com.springboot.entity.business;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.springboot.entity.hibernate.impl.ABaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;


@Entity
@Table(name = "CMS_SERVICE_AGENCY")
public class ServiceAgencyEO extends ABaseEntity {

    private static final long serialVersionUID = -4126989544371873447L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;

    //协议编号
    @Column(name = "no")
    private String no;

    //事项名称
    @Column(name = "title")
    private String title;

    //代办员
    @Column(name = "person_name")
    private String personName;

    //受理日期
    @Column(name = "release_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
    private Date releaseDate;

    //承办窗口
    @Column(name = "window_name")
    private String windowName;

    //取件方式
    @Column(name = "delivery_method")
    private String deliveryMethod;

    //发布状态
    @Column(name = "release_status")
    private Integer releaseStatus = 0;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getWindowName() {
        return windowName;
    }

    public void setWindowName(String windowName) {
        this.windowName = windowName;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public Integer getReleaseStatus() {
        return releaseStatus;
    }

    public void setReleaseStatus(Integer releaseStatus) {
        this.releaseStatus = releaseStatus;
    }
}
