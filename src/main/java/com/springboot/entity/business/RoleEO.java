package com.springboot.entity.business;

import com.springboot.entity.hibernate.impl.AMockEntity;

import javax.persistence.*;

@Entity
@Table(name = "sys_role_info")
public class RoleEO extends AMockEntity {

    private static final long serialVersionUID = -9220256387258153881L;

    //主键ID
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    //角色编码
    @Column(name="role_code")
    private String roleCode;

    //角色名称
    @Column(name="role_name")
    private String roleName;

    //描述信息
    @Column(name="role_desc")
    private String roleDesc;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }
}
