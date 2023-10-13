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
public class Product {
    public CategoryDTO cate;
    public int id;
    public String name;
    public int quantity;
    public float price;
    public int height;
    public int width;
    public String color;
    public String material;
    public Date createTime;
    public int updateId;
    public String description;
    public String image;
    public int status;
    public String manufacturer;
    public String madeIn;
    public String size;
    
    public Product() {
    }

    public Product(int id, String name, int quantity, float price, int height, int width, String color, String material, Date createTime, int updateId, String description, String image, int status, String manufacturer, String madeIn, String size) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.height = height;
        this.width = width;
        this.color = color;
        this.material = material;
        this.createTime = createTime;
        this.updateId = updateId;
        this.description = description;
        this.image = image;
        this.status = status;
        this.manufacturer = manufacturer;
        this.madeIn = madeIn;
        this.size = size;
    }

    public Product(CategoryDTO cate, int id, String name, int quantity, float price, int height, int width, String color, String material, Date createTime, int updateId, String description, String image, int status, String manufacturer, String madeIn, String size) {
        this.cate = cate;
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.height = height;
        this.width = width;
        this.color = color;
        this.material = material;
        this.createTime = createTime;
        this.updateId = updateId;
        this.description = description;
        this.image = image;
        this.status = status;
        this.manufacturer = manufacturer;
        this.madeIn = madeIn;
        this.size = size;
    }

    public CategoryDTO getCate() {
        return cate;
    }

    public void setCate(CategoryDTO cate) {
        this.cate = cate;
    }
 

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

     

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getUpdateId() {
        return updateId;
    }

    public void setUpdateId(int updateId) {
        this.updateId = updateId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }
    
}
