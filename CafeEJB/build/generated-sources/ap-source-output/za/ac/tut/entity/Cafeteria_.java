package za.ac.tut.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.entity.Orders;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-12T17:03:36")
@StaticMetamodel(Cafeteria.class)
public class Cafeteria_ { 

    public static volatile SingularAttribute<Cafeteria, String> surname;
    public static volatile SingularAttribute<Cafeteria, String> price;
    public static volatile SingularAttribute<Cafeteria, String> name;
    public static volatile SingularAttribute<Cafeteria, byte[]> photo;
    public static volatile SingularAttribute<Cafeteria, Long> id;
    public static volatile SingularAttribute<Cafeteria, String> food;
    public static volatile ListAttribute<Cafeteria, Orders> order;

}