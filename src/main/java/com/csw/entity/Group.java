package com.csw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Group implements Serializable {
    private String id;
    private String name;
    private Date createDate;

    private Clazz clazz;//班级关系属性

    private List<String> tagNames = new ArrayList<String>();//处理业务逻辑的属性  处理交集标签

}
