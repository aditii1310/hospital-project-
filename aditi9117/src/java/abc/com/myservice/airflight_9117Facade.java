/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.com.myservice;

import abc.com.service.airflight_9117;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author admin
 */
@Stateless
public class airflight_9117Facade extends AbstractFacade<airflight_9117> {

    @PersistenceContext(unitName = "aditi9117PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public airflight_9117Facade() {
        super(airflight_9117.class);
    }
    
}
