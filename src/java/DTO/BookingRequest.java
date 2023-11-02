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
public class BookingRequest {
    private Account account;
    private Material material;
    private int bookingRequestId;
    private String email;
    private String cusPhone;
    private String cusAddress;
    private String birdType;
    private String color;
    private String size;
    private String materialCustom;
    private int height;
    private int width;
    private String image;
    private int quantity;
    private int status;
    private String subtotal;
    private int total;
    private Date createTime;
    private String note;
    public int id;
    public String getMaterialCustom() {
        return materialCustom;
    }

    public BookingRequest(Account account, Material material, int bookingRequestId, String email, String cusPhone, String cusAddress, String birdType, String color, String size, String materialCustom, int height, int width, String image, int quantity, int status, String subtotal, int total, Date createTime, String note, int id) {
        this.account = account;
        this.material = material;
        this.bookingRequestId = bookingRequestId;
        this.email = email;
        this.cusPhone = cusPhone;
        this.cusAddress = cusAddress;
        this.birdType = birdType;
        this.color = color;
        this.size = size;
        this.materialCustom = materialCustom;
        this.height = height;
        this.width = width;
        this.image = image;
        this.quantity = quantity;
        this.status = status;
        this.subtotal = subtotal;
        this.total = total;
        this.createTime = createTime;
        this.note = note;
        this.id = id;
    }

    public void setMaterialCustom(String materialCustom) {
        this.materialCustom = materialCustom;
    }

    public String getNote() {
        return note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public BookingRequest() {
    }

    public String getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(String subtotal) {
        this.subtotal = subtotal;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }

    public int getBookingRequestId() {
        return bookingRequestId;
    }

    public void setBookingRequestId(int bookingRequestId) {
        this.bookingRequestId = bookingRequestId;
    }

    public String getBirdType() {
        return birdType;
    }

    public void setBirdType(String birdType) {
        this.birdType = birdType;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    
}
