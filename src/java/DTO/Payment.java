/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author hailo
 */
public class Payment implements Serializable{

    private Delivery delivery;
    private Order order;
    private Cart cart;
    private BookingRequest bookingRequest;
    private CartDetail cartDetail;
    private int id;
    private Date createTime;
    private int total;
    private int status;
    private int cusPhone;
    private String cusAddress;
    private double totall;
    private String name;
    private Voucher vu;
    private Account acc;
    private String note;

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    
    public CartDetail getCartDetail() {
        return cartDetail;
    }

    public void setCartDetail(CartDetail cartDetail) {
        this.cartDetail = cartDetail;
    }


    public Payment() {
    }

    public Payment(Date createTime, int total) {
        this.createTime = createTime;
        this.total = total;
    }

    public Payment(Delivery delivery, Order order, BookingRequest bookingRequest, int id, Date createTime, int total, int status, int cusPhone, String cusAddress, String name) {
        this.delivery = delivery;
        this.order = order;
        this.bookingRequest = bookingRequest;
        this.id = id;
        this.createTime = createTime;
        this.total = total;
        this.status = status;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Payment(Delivery delivery, Order order, BookingRequest bookingRequest, int id, Date createTime, int total, int status, int cusPhone, String cusAddress, String name, Voucher vu) {
        this.delivery = delivery;
        this.order = order;
        this.bookingRequest = bookingRequest;
        this.id = id;
        this.createTime = createTime;
        this.total = total;
        this.status = status;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.name = name;
        this.vu = vu;
    }

    public double getTotall() {
        return totall;
    }

    public void setTotall(double totall) {
        this.totall = totall;
    }

    public Payment(Delivery delivery, Order order, BookingRequest bookingRequest, int id, Date createTime, int total, int status, int cusPhone, String cusAddress, String name, Voucher vu, Account acc) {
        this.delivery = delivery;
        this.order = order;
        this.bookingRequest = bookingRequest;
        this.id = id;
        this.createTime = createTime;
        this.total = total;
        this.status = status;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.name = name;
        this.vu = vu;
        this.acc = acc;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    public Voucher getVu() {
        return vu;
    }

    public void setVu(Voucher vu) {
        this.vu = vu;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Delivery getDelivery() {
        return delivery;
    }

    public void setDelivery(Delivery delivery) {
        this.delivery = delivery;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public BookingRequest getBookingRequest() {
        return bookingRequest;
    }

    public void setBookingRequest(BookingRequest bookingRequest) {
        this.bookingRequest = bookingRequest;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(int cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

}
