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
    public Order order;
    public Product product;
    public int quantity;
    public int total;
    public int size;
    public int color;

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
