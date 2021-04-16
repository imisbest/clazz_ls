package com.csw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Student implements Serializable {

    private String id;
    private String name;
    private Integer age;
    private String qq;
    private String phone;
    private Date bir;

    private String mark;//备注

    private Clazz clazz = new Clazz();//班级关系属性

    private Group group = new Group();//小组关系属性

    private City city;//城市关系属性

    private List<Tag> tags;//标签的关系属性


}
