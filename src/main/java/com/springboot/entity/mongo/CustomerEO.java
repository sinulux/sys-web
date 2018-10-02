package com.springboot.entity.mongo;

import org.springframework.data.annotation.Id;

public class CustomerEO {
    @Id
    public String id;

    public String firstName;
    public String lastName;

    public CustomerEO() {
    }

    public CustomerEO(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }

    @Override
    public String toString() {
        return String.format(
                "CustomerEO[id=%s, firstName='%s', lastName='%s']",
                id, firstName, lastName);
    }

}