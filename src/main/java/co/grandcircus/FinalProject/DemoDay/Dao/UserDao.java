package co.grandcircus.FinalProject.DemoDay.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.User;

@Repository
@Transactional
public class UserDao {
	@PersistenceContext
	EntityManager em;
	
	public void create(User user) {
		em.merge(user);
	}
}
