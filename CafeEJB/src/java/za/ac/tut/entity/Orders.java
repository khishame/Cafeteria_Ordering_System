/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author neo
 */
@Entity
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String StudNum;
    private String FoodName;

    public Orders() {
    }

    public Orders(String StudNum, String FoodName) {
        this.StudNum = StudNum;
        this.FoodName = FoodName;
    }

    public String getStudNum() {
        return StudNum;
    }

    public void setStudNum(String StudNum) {
        this.StudNum = StudNum;
    }

    public String getFoodName() {
        return FoodName;
    }

    public void setFoodName(String FoodName) {
        this.FoodName = FoodName;
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entity.Orders[ id=" + id + " ]";
    }
    
}
