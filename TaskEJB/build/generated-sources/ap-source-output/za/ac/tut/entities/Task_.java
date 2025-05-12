package za.ac.tut.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.entities.User;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-12T15:06:53")
@StaticMetamodel(Task.class)
public class Task_ { 

    public static volatile SingularAttribute<Task, String> description;
    public static volatile SingularAttribute<Task, Long> id;
    public static volatile SingularAttribute<Task, String> title;
    public static volatile SingularAttribute<Task, User> user;

}