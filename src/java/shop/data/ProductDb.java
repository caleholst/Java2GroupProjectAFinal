package shop.data;

import shop.business.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDb {

    public static int addProduct(Product product) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO products (productName, productDesc, productImagePath, productPrice) "
                + "VALUES (?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDesc());
            ps.setString(3, product.getImagePath());
            ps.setDouble(4, product.getPrice());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int editProduct(Product product) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "UPDATE products SET productName = ?, productDesc = ?, productImagePath = ?, productPrice = ? "
                + "WHERE productId = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, product.getName());
            ps.setString(2, product.getDesc());
            ps.setString(3, product.getImagePath());
            ps.setDouble(4, product.getPrice());
            ps.setLong(5, product.getId());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteProduct(int productId) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "DELETE FROM products "
                + "WHERE productId = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setLong(1, productId);

            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static Product selectProduct(int productId) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * from products WHERE productId = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setLong(1, productId);
            rs = ps.executeQuery();
            Product product = null;
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getLong("productId"));
                product.setName(rs.getString("productName"));
                product.setDesc(rs.getString("productDesc"));
                product.setImagePath(rs.getString("productImagePath"));
                product.setPrice(rs.getDouble("productPrice"));
            }
            return product;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static List<Product> selectAllProducts() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<>();
        String query = "SELECT * from products";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getLong("productId"));
                product.setName(rs.getString("productName"));
                product.setDesc(rs.getString("productDesc"));
                product.setImagePath(rs.getString("productImagePath"));
                product.setPrice(rs.getDouble("productPrice"));
                products.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return products;
    }
}