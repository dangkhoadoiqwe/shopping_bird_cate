/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hailo
 */
public class listToPayment {

    List<product> products;
    private int voucherId;

    public listToPayment() {
        products = new ArrayList<>();
    }

    public class product {

        private int proId;
        private float proPrice;
        private int quantity;
        private int cartDetailId;

        public product() {
        }

        public int getCartDetailId() {
            return cartDetailId;
        }

        public void setCartDetailId(int cartDetailId) {
            this.cartDetailId = cartDetailId;
        }
        
        public int getProId() {
            return proId;
        }

        public void setProId(int cartDetailId) {
            this.proId = cartDetailId;
        }

        public float getProPrice() {
            return proPrice;
        }

        public void setProPrice(float proPrice) {
            this.proPrice = proPrice;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public List<product> getProducts() {
        return products;
    }

    public void setProducts(List<product> products) {
        this.products = products;
    }

}
