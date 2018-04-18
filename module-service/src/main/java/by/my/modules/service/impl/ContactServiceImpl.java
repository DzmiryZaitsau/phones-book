package by.my.modules.service.impl;

import by.my.modules.beans.ContactBean;
import by.my.modules.dao.ContactDAO;
import by.my.modules.entities.Contact;
import by.my.modules.service.EntityBeanConverter;
import by.my.modules.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Entity;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDAO contactDao;

    @Autowired
    private EntityBeanConverter converter;

    public Iterable<ContactBean> getAllContacts() {
        Iterable<Contact> contacts = contactDao.findAll();
        List<ContactBean> beanList = converter.convertToBeanList(contacts, ContactBean.class);

        return beanList;
    }

    public ContactBean getContactById(Integer contactId) {
        Contact contact = contactDao.findById(contactId).orElse(new Contact());
        ContactBean bean = converter.convertToBean(contact, ContactBean.class);

        return bean;
    }

    public void saveContact(ContactBean contact) {
        Contact contactEntity = converter.convertToEntity(contact, Contact.class);
        contactDao.save(contactEntity);
    }

    public void deleteContact(Integer contactId) {
        contactDao.deleteById(contactId);
    }
}

