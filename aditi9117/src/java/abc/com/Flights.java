/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.com;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author admin
 */
@Entity
@Table(name = "FLIGHTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Flights.findAll", query = "SELECT f FROM Flights f")
    , @NamedQuery(name = "Flights.findById", query = "SELECT f FROM Flights f WHERE f.id = :id")
    , @NamedQuery(name = "Flights.findByAirline", query = "SELECT f FROM Flights f WHERE f.airline = :airline")
    , @NamedQuery(name = "Flights.findByFlight", query = "SELECT f FROM Flights f WHERE f.flight = :flight")
    , @NamedQuery(name = "Flights.findBySourceCity", query = "SELECT f FROM Flights f WHERE f.sourceCity = :sourceCity")
    , @NamedQuery(name = "Flights.findByDepartureTime", query = "SELECT f FROM Flights f WHERE f.departureTime = :departureTime")
    , @NamedQuery(name = "Flights.findByStops", query = "SELECT f FROM Flights f WHERE f.stops = :stops")
    , @NamedQuery(name = "Flights.findByArrivalTime", query = "SELECT f FROM Flights f WHERE f.arrivalTime = :arrivalTime")
    , @NamedQuery(name = "Flights.findByDestinationCity", query = "SELECT f FROM Flights f WHERE f.destinationCity = :destinationCity")
    , @NamedQuery(name = "Flights.findByClass1", query = "SELECT f FROM Flights f WHERE f.class1 = :class1")
    , @NamedQuery(name = "Flights.findByDuration", query = "SELECT f FROM Flights f WHERE f.duration = :duration")
    , @NamedQuery(name = "Flights.findByDaysLeft", query = "SELECT f FROM Flights f WHERE f.daysLeft = :daysLeft")
    , @NamedQuery(name = "Flights.findByPrice", query = "SELECT f FROM Flights f WHERE f.price = :price")})
public class Flights implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Size(max = 50)
    @Column(name = "AIRLINE")
    private String airline;
    @Size(max = 20)
    @Column(name = "FLIGHT")
    private String flight;
    @Size(max = 50)
    @Column(name = "SOURCE_CITY")
    private String sourceCity;
    @Size(max = 50)
    @Column(name = "DEPARTURE_TIME")
    private String departureTime;
    @Size(max = 20)
    @Column(name = "STOPS")
    private String stops;
    @Size(max = 50)
    @Column(name = "ARRIVAL_TIME")
    private String arrivalTime;
    @Size(max = 50)
    @Column(name = "DESTINATION_CITY")
    private String destinationCity;
    @Size(max = 20)
    @Column(name = "CLASS")
    private String class1;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "DURATION")
    private BigDecimal duration;
    @Column(name = "DAYS_LEFT")
    private Integer daysLeft;
    @Column(name = "PRICE")
    private Integer price;

    public Flights() {
    }

    public Flights(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getFlight() {
        return flight;
    }

    public void setFlight(String flight) {
        this.flight = flight;
    }

    public String getSourceCity() {
        return sourceCity;
    }

    public void setSourceCity(String sourceCity) {
        this.sourceCity = sourceCity;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getStops() {
        return stops;
    }

    public void setStops(String stops) {
        this.stops = stops;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getDestinationCity() {
        return destinationCity;
    }

    public void setDestinationCity(String destinationCity) {
        this.destinationCity = destinationCity;
    }

    public String getClass1() {
        return class1;
    }

    public void setClass1(String class1) {
        this.class1 = class1;
    }

    public BigDecimal getDuration() {
        return duration;
    }

    public void setDuration(BigDecimal duration) {
        this.duration = duration;
    }

    public Integer getDaysLeft() {
        return daysLeft;
    }

    public void setDaysLeft(Integer daysLeft) {
        this.daysLeft = daysLeft;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Flights)) {
            return false;
        }
        Flights other = (Flights) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "abc.com.Flights[ id=" + id + " ]";
    }
    
}
