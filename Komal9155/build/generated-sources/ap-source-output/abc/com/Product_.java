package abc.com;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-08-25T23:52:49")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> productCode;
    public static volatile SingularAttribute<Product, Integer> quantityOnHand;
    public static volatile SingularAttribute<Product, Integer> manufacturerId;
    public static volatile SingularAttribute<Product, Boolean> available;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Long> id;

}