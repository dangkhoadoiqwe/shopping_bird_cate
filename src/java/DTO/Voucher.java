/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.sql.Date;
import java.util.Calendar;

/**
 *
 * @author hailo
 */
public class Voucher {
    public int id;
    public Account account;
    public String name;
    public String code;
    public Date dateStart;
    public Date dateEnd;
    public int status;
    public int value;
    public int type;
    public Voucher() {
    }

    public Voucher(int id, Account account, String name, String code, Date dateStart, Date dateEnd) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.code = code;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public int getStatus() {
        return status;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    
    public void setStatus(int status) {
        this.status = status;
    }

    public Voucher(int id, Account account, String name, String code, Date dateStart, Date dateEnd, int status) {
        this.id = id;
        this.account = account;
        this.name = name;
        this.code = code;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public boolean isExpired() {
        Calendar currentDate = Calendar.getInstance(); // Lấy thời gian hiện tại
        Calendar endCalendar = Calendar.getInstance();
        endCalendar.setTime(dateEnd); // Chuyển đổi dateEnd thành Calendar

        return dateEnd != null && currentDate.after(endCalendar);
    }

    
     
}
