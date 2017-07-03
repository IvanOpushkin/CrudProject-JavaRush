package controllerr.model;

/**
 * Created by Mega on 23.06.2017.
 */

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "NAME")
    private String name;


    @Column(name = "AGE")
    private int age;

    @Column(name = "IADMIN")
    private Boolean iAdmin;

    @Column(name = "CREATEDDATE")
    private Date createdDate;

    public Boolean getiAdmin() {
        return iAdmin;
    }

    public void setiAdmin(Boolean iAdmin) {
        this.iAdmin = iAdmin;
    }


    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", isADMIN=" + iAdmin +
                '}';
    }
}
