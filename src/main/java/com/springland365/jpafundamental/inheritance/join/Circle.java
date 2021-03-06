package com.springland365.jpafundamental.inheritance.join;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity

@Getter
@Setter
@PrimaryKeyJoinColumn(name = "shapeId")
@Table( name="tbl_circle" , schema="inheritance_join")
public class Circle extends Shape {
    @Override
    public String toString() {
        return "CircleEntity{" +
                "radius=" + radius +
                ", id=" + id +
                ", color='" + color + '\'' +
                '}';
    }

    protected int radius ;


}
