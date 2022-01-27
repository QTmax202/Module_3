package product_management;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProductService {
    private static final ArrayList<Product> producers;

    static{
        producers = new ArrayList<>();
        producers.add(new Product(1, "jodan 1", 600000, "jodan", "nike"));
        producers.add(new Product(1, "Biti Hunter", 755000, "sport", "biti's"));
    }

    public ArrayList<Product> getProductList(){
        return producers;
    }

    public Product getProduct(int id){
        for(Product p : producers){
            if (p.getId() == id){
                return p;
            }
        }
        return null;
    }

    public void addProduct(Product p){
        producers.add(p);
    }

    public void removeProduct(int id){
        producers.removeIf((p) ->(p.getId() == id));
    }

    public void editProduct(int index, Product p){
        producers.set(index, p);
    }

    public ArrayList<Product> searchProductByName(String name){
        ArrayList<Product> productList= new ArrayList<>();
        for(Product p : producers){
            if (validateSearch(name, p.getName())){
                productList.add(p);
            }
        }
        return productList;
    }

    public boolean validateSearch(String key, String regex){
        key = key.toLowerCase();
        String NAME_REGEX = "*"+key+"*";
        Pattern pattern = Pattern.compile(NAME_REGEX);
        Matcher matcher = pattern.matcher(regex.toLowerCase());
        return matcher.matches();
    }
}
