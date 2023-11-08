/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author hailo
 */
public class Delivery {
    public int id;
    public int status;
    public Date intendTime;

    public Delivery() {
    }

    public Delivery(int id, int status, Date intendTime) {
        this.id = id;
        this.status = status;
        this.intendTime = intendTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getIntendTime() {
        return intendTime;
    }

    public void setIntendTime(Date intendTime) {
        this.intendTime = intendTime;
    }
    
}
