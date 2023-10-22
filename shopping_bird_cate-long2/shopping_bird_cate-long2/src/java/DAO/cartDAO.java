/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.cartDTO;
import java.util.List;

/**
 *
 * @author Admin
 */
public class cartDAO {
    
    int id;
    float totalPrice;
    List<cartDTO> items;

    public cartDAO(int id, float totalPrice) {
        this.id = id;
        this.totalPrice = totalPrice;
    }

    public cartDAO() {
    }

    public cartDAO(List<cartDTO> items) {
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

        public List<cartDTO> getItems() {
        return items;
    }

    public void setItems(List<cartDTO> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    boolean checkExist(int id) {
        for (cartDTO item : items) {
            if (item.getProduct().getId()== id) {
                return true;
            }
        }
        return false;
    }

    cartDTO getItemById(int id) {
        for (cartDTO item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(cartDTO newItem) {
        if (checkExist(newItem.getProduct().getId())) {
            cartDTO oldItem = getItemById(newItem.getProduct().getId());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
public void removeAllItems() {
    items.clear();
}

    public void editQuantity(int id, int newQuantity) {
        for (cartDTO item : items) {
            if (item.getProduct().getId() == id) {
                item.setQuantity(newQuantity);
                if (newQuantity == 0) {
                    items.remove(item);
                }
            }
        }
    }

    public float getTotalBill() {
        float sum = 0;
        for (cartDTO item : items) {
            sum += (item.getQuantity() * item.getProduct().getPrice());
        }
        return sum;
    }
    public float getIDBill(int quantity, int price) {
        float sum = 0;
        sum = quantity * price;
        return sum;
    }
}
