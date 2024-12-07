package shop.business;

import java.io.Serializable;

public class Product implements Serializable {

    private long id;
    private String name;
    private String desc;
    private String imagePath;
    private double price;

    public Product() {
        name = "";
        desc = "";
        imagePath = "";
        price = 0;
    }
    
    public Product(String name, String desc, String imagePath, Double price) {
        this.name = name;
        this.desc = desc;
        this.imagePath = imagePath;
        this.price = price;
    }
    
    public Product(long id, String name, String desc, String imagePath, Double price) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.imagePath = imagePath;
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
