/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author hailo
 */
public class OrderDetail {
    private Order order;
    private Product product;
    private int quantity;
    private int total;

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }
    private int size;
    private int color;

    public OrderDetail() {
    }

    public OrderDetail(Order order, Product product, int quantity, int total, int size, int color) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.total = total;
        this.size = size;
        this.color = color;
    } 
    
}
