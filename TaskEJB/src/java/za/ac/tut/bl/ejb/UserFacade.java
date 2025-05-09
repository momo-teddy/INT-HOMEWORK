/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.User;

/**
 *
 * @author Sylvia
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "TaskEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    @Override
public User findUserByUsernameAndPassword(String username, String password) {
    try {
        // Query to find the user based on username and password
        return em.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password", User.class)
                 .setParameter("username", username)
                 .setParameter("password", password)
                 .getSingleResult();
    } catch (Exception e) {
        return null; // Return null if no result or error (invalid credentials)
    }
}

    
}
