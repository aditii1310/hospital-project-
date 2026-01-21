package abc.com;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Product")
@XmlRootElement
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "manufacturer_id", nullable = false)
    private int manufacturerId;

    @Column(name = "product_code", length = 10, nullable = false)
    private String productCode;

    @Column(name = "quantity_on_hand")
    private int quantityOnHand;

    @Column(name = "available")
    private boolean available;

    @Column(name = "description", length = 255)
    private String description;

    // ----- Constructors -----
    public Product() {
    }

    // Optional convenience constructor
    public Product(int manufacturerId, String productCode, int quantityOnHand, boolean available, String description) {
        this.manufacturerId = manufacturerId;
        this.productCode = productCode;
        this.quantityOnHand = quantityOnHand;
        this.available = available;
        this.description = description;
    }

    // ----- Getters & Setters -----
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getManufacturerId() {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId) {
        this.manufacturerId = manufacturerId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public int getQuantityOnHand() {
        return quantityOnHand;
    }

    public void setQuantityOnHand(int quantityOnHand) {
        this.quantityOnHand = quantityOnHand;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // ----- hashCode, equals, toString -----
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        return !((this.id == null && other.id != null) 
              || (this.id != null && !this.id.equals(other.id)));
    }

    @Override
    public String toString() {
        return "abc.com.Product[ id=" + id + ", code=" + productCode + " ]";
    }
}
