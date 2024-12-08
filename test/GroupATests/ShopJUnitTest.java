package GroupATests;

import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import shop.business.Cart;
import shop.business.Product;

public class ShopJUnitTest {

    Product testProduct1;
    Product testProduct2;

    @Before
    public void setUp(){
        // Initializes the test products
        testProduct1 = new Product(111, "ProductName1", "ProductDesc1", "imagePath1", 1.11);
        testProduct2 = new Product(222, "ProductName2", "ProductDesc2", "imagePath2", 2.22);
    }

    @After
    public void tearDown(){
        // Clean up resources after each test (optional for basic cases)
        testProduct1 = null;
        testProduct2 = null;
    }

    // Tests that cartSize() returns correct size
    @Test
    public void cartSizeTest() {
        Cart testCart = new Cart();
        int expected = 0;
        int result = testCart.cartSize();
        assertEquals(expected, result);
        
        testCart.addItem(testProduct1);
        expected = 1;
        result = testCart.cartSize();
        assertEquals(expected, result);
        
        testCart.addItem(testProduct2);
        testCart.addItem(testProduct1);
        expected = 3;
        result = testCart.cartSize();
        assertEquals(expected, result);
    }

    // Tests that isEmpty() identifies empty cart correctly
    @Test
    public void isEmptyTest() {
        Cart testCart = new Cart();
        boolean expected = true;
        boolean result = testCart.isEmpty();
        assertEquals(expected, result);
        
        testCart.addItem(testProduct1);
        expected = false;
        result = testCart.isEmpty();
        assertEquals(expected, result);
    }

    // Tests that getCart() returns cart correctly
    @Test
    public void getCartTest() {
        Cart testCart = new Cart();
        List<Product> expected = new ArrayList<>();
        List<Product> result = testCart.getCart();
        assertEquals(expected, result);
        
        expected.add(testProduct1);
        expected.add(testProduct2);
        testCart.addItem(testProduct1);
        testCart.addItem(testProduct2);
        result = testCart.getCart();
        assertEquals(expected, result);
    }

    // Tests that addItem() returns correct string
    @Test
    public void addItemTest() {
        Cart testCart = new Cart();
        String expected = "ProductName1 added to cart.";
        String result = testCart.addItem(testProduct1);
        assertEquals(expected, result);
    }

    // Tests that removeItem() returns correct string
    @Test
    public void removeItemTest() {
        Cart testCart = new Cart();
        testCart.addItem(testProduct1);
        String expected = "ProductName1 successfully removed.";
        String result = testCart.removeItem(111);
        assertEquals(expected, result);
        
        expected = "Error removing item.";
        result = testCart.removeItem(111);
        assertEquals(expected, result);
    }

    // Tests that getSubTotal() returns correct amount
    @Test
    public void getSubTotalTest() {
        Cart testCart = new Cart();
        testCart.addItem(testProduct1);
        testCart.addItem(testProduct1);
        testCart.addItem(testProduct2);
        double expected = 4.44;
        double result = testCart.getSubTotal();
        assertEquals(expected, result, 0.01); // The delta argument is still the same
    }

    // Tests that getTotal() returns correct amount
    @Test
    public void getTotalTest() {
        Cart testCart = new Cart();
        testCart.addItem(testProduct1);
        testCart.addItem(testProduct1);
        testCart.addItem(testProduct2);
        double expected = 4.75;
        double result = testCart.getTotal();
        assertEquals(expected, result, 0.01); // The delta argument is still the same
    }
}
