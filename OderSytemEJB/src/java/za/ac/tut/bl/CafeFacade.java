/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entity.Cafe;

/**
 *
 * @author neo
 */
@Stateless
public class CafeFacade extends AbstractFacade<Cafe> implements CafeFacadeLocal {
    @PersistenceContext(unitName = "OderSytemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CafeFacade() {
        super(Cafe.class);
    }
    
}
