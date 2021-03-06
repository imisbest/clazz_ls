package com.csw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Clazz implements Serializable {
    private String id;
    private String name;
    private Integer studentcounts;//业务逻辑属性
    private Tag tag;//标签关系属性
    private List<Group> groups;//小组关系属性

}
