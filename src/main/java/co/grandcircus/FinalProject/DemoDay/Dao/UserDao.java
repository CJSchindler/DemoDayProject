package co.grandcircus.FinalProject.DemoDay.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import co.grandcircus.FinalProject.DemoDay.entity.User;


import java.util.List;






@Repository
@Transactional
public class UserDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public List<User> findAll() {
				return em.createQuery("FROM User", User.class).getResultList();
	}
	
	public User findByID(Long id) {
		return em.find(User.class, id);
	}
	
	
	
	//This works, but the below way is better
//	public User findByEmail(String email) {
//		return em.createQuery("FROM User WHERE email LIKE :email", User.class)
//				.setParameter("email", "%" + email + "%")
//				.getSingleResult();
//	}
	
	public User findByEmail(String email) {
		return em.createQuery("FROM User WHERE email = :email", User.class)
				.setParameter("email", email)
				.getSingleResult();
	}
	
	
	public void create(User user) {
		em.persist(user);
	}
	
	public void delete(Long id) {
		User user = em.getReference(User.class, id);
		em.remove(user);
	}
	
	public void update(User user) {
		em.merge(user);
		
	}

	


	
	

}
