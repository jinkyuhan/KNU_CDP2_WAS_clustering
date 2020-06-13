package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

    private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();

    public ProductRepository() {
        Product phone = new Product("P1234", "iPhone 6s", 800000);
        phone.setDescription("4.7-inch, 1334X750 Retina HD display, 8-megapixel iSight Camera");
        phone.setCategory("Smart Phone");
        phone.setManufacturer("Apple");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        phone.setFileName("P1234");

        Product notebook = new Product("P1235", "LG PC 그램", 1500000);
        notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation Intel Core processors");
        notebook.setCategory("Notebook");
        notebook.setManufacturer("LG");
        notebook.setUnitsInStock(1000);
        notebook.setCondition("Republished");
        notebook.setFileName("P1235");

        Product tablet = new Product("P1236", "Galaxy Tab S", 900000);
        tablet.setDescription("212.9*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
        tablet.setCategory("tablet");
        tablet.setManufacturer("Samsung");
        tablet.setUnitsInStock(1000);
        tablet.setCondition("Old");
        tablet.setFileName("P1236");

        listOfProducts.add(phone);
        listOfProducts.add(notebook);
        listOfProducts.add(tablet);
    }

    public static ProductRepository getInstance(){
        return instance;
    }
    public void addProduct(Product product){
        listOfProducts.add(product);
    }
    public ArrayList<Product> getAllProducts() {
        return listOfProducts;
    }

    public Product getProductById(String productId) {
        Product productById = null;

        for (int i = 0; i < listOfProducts.size(); i++) {
            Product product = listOfProducts.get(i);
            if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
                productById = product;
                break;
            }
        }
        return productById;
    }
}