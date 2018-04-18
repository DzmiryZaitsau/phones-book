package by.my.modules.dao;

import by.my.modules.entities.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactDAO extends CrudRepository<Contact, Integer> {
}

