package com.myservice;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-08-14T11:53:58")
@StaticMetamodel(Flights.class)
public class Flights_ { 

    public static volatile SingularAttribute<Flights, String> departureTime;
    public static volatile SingularAttribute<Flights, String> destinationCity;
    public static volatile SingularAttribute<Flights, BigDecimal> duration;
    public static volatile SingularAttribute<Flights, String> flight;
    public static volatile SingularAttribute<Flights, String> arrivalTime;
    public static volatile SingularAttribute<Flights, String> class1;
    public static volatile SingularAttribute<Flights, Integer> price;
    public static volatile SingularAttribute<Flights, Integer> id;
    public static volatile SingularAttribute<Flights, String> stops;
    public static volatile SingularAttribute<Flights, Integer> daysLeft;
    public static volatile SingularAttribute<Flights, String> airline;
    public static volatile SingularAttribute<Flights, String> sourceCity;

}