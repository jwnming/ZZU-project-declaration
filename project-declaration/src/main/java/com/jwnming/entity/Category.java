package com.jwnming.entity;

import java.io.Serializable;

public class Category implements Serializable {

    private Integer id;
    private String name;
    private Integer distinguish;

    public Category() {
    }

    public Category(Integer id, String name, Integer distinguish) {
        this.id = id;
        this.name = name;
        this.distinguish = distinguish;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getDistinguish() {
        return distinguish;
    }

    public void setDistinguish(Integer distinguish) {
        this.distinguish = distinguish;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", distinguish=" + distinguish +
                '}';
    }
}
