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
public class Feedback {

    public Product product;
    public Account account;
    public int id;
    public Date createTime;
    public int rating;
    public String comment;
    public int status;

    public Feedback() {
    }

    public Feedback(Product product, Account account, int id, Date createTime, int rating, String comment, int status) {
        this.product = product;
        this.account = account;
        this.id = id;
        this.createTime = createTime;
        this.rating = rating;
        this.comment = comment;
        this.status = status;
    }

}
