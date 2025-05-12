/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl.ejb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.Task;
import za.ac.tut.entities.User;

/**
 *
 * @author Sylvia
 */
@Stateless
public class TaskFacade extends AbstractFacade<Task> implements TaskFacadeLocal {

    @PersistenceContext(unitName = "TaskEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TaskFacade() {
        super(Task.class);
    }
    
    
    @Override
    public List<Task> findTasksByUser(User user) {
        // JPQL query to find tasks by the given user
        return em.createQuery("SELECT t FROM Task t WHERE t.user = :user", Task.class)
                 .setParameter("user", user)
                 .getResultList();
    }
    
}
