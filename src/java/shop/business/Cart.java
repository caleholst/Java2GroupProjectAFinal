package shop.business;

import java.util.*;

public class Cart {

    private List<Product> cart;
    private double localTax;

    public Cart() {
        cart = new ArrayList<>();
        localTax = 1.07; // Setting local tax based on Iowa tax, in a real application, this would reference user's local tax
    }
    
    public int cartSize() {
        return cart.size();
    }
    
    public boolean isEmpty() {
        return cart.isEmpty();
    }
    
    public List<Product> getCart() {
        return cart;
    }
    
    public String addItem(Product item) {
        cart.add(item);
        return item.getName() + " added to cart.";
    }
    
    public String removeItem(long productId) {
        try {
            for (Product item : cart){
                if (item.getId() == productId) {
                    cart.remove(item);
                    return item.getName() + " successfully removed.";
                }
            }
            throw new Exception();
        } catch (Exception e) {
            return "Error removing item.";
        }
    }
    
    public double getSubTotal() {
        double subtotal  = 0;
        for (Product item : cart) {
            subtotal += item.getPrice();
        }
        return subtotal;
    }
    
    public double getTotal() {
        double subtotal = getSubTotal();
        return subtotal *= localTax;
    }
}