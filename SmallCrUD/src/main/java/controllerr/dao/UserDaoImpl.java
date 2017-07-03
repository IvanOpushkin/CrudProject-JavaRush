package controllerr.dao;

import controllerr.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.*;


/**
 * Created by Mega on 23.06.2017.
 */

@Repository
public class UserDaoImpl implements UserDao {

    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();

        if (user.getAge() < 100 && user.getAge() > 1)
        {
            session.persist(user);
        logger.info("User successfully saved. User details" + user);
        }
       // else updateUser(user);
           // logger.info("User successfully updated. User details" + user);


    }


    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user != null) {
            session.delete(user);
            logger.info("User successfully deleted. User details" + user);
        } else
        {
            logger.info("User with dat id " + id + " not exists");
        }

    }

    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully updated. User details" + user);

    }

    public User getUserById(int id) {

        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user != null) {
            logger.info("User successfully loaded. User details" + user);
        } else
        {
            logger.info("User with dat id " + id + " not exists");
        }
        return user;
    }

    @SuppressWarnings("unchecked")
    public List<User> listUsers() {

        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for (User user : userList)
        {
            logger.info("User list: " + user);
        }
        return userList;
    }

    @SuppressWarnings("unchecked")
    public List<User> searchUsersByAnyValue(String value) {

        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList2 = new ArrayList<User>();

        List<User> userList = session.createQuery("from User").list();

        for (User user : userList)
        {
            if ((""+ user.getId()).equals(value) || user.getName().equals(value)
                    || ("" + user.getAge()).equals(value))
            {
                userList2.add(user);
                logger.info("User found: " + user);
            }


        }
        return userList2;
    }


}
