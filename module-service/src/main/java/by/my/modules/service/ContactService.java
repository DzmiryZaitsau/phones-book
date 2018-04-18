package by.my.modules.service;

import by.my.modules.beans.ContactBean;

public interface ContactService {
    Iterable<ContactBean> getAllContacts();

    ContactBean getContactById(Integer contactId);

    void saveContact(ContactBean contact);

    void deleteContact(Integer contactId);
}
