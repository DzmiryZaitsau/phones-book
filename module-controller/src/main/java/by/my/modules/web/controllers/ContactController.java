package by.my.modules.web.controllers;

import by.my.modules.beans.ContactBean;
import by.my.modules.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class ContactController {
    @Autowired
   private ContactService contactService;

   @RequestMapping("/phones-book.html")
    public ModelAndView showContactsPage() {
        ModelAndView modelAndView = new ModelAndView("phones-book");
        return modelAndView;
    }

    @RequestMapping("/edit-phones-book.html")
    public ModelAndView editContact(@RequestParam(name = "contact_id") Integer contactId) {
        ModelAndView modelAndView = new ModelAndView("edit-contact");

        ContactBean contact = contactService.getContactById(contactId);
        modelAndView.addObject("contact", contact);

        return modelAndView;
    }

    @RequestMapping("/delete-phones-book.html")
    public ModelAndView deleteContact(@RequestParam(name = "contact_id") Integer contactId) {
        contactService.deleteContact(contactId);

        ModelAndView modelAndView = new ModelAndView("redirect:phones-book.html");
        return modelAndView;
    }

    @RequestMapping(value = "/save-phones-book.html", method = RequestMethod.POST)
    public ModelAndView saveContact(ContactBean contact) {
        contactService.saveContact(contact);

        ModelAndView modelAndView = new ModelAndView("redirect:phones-book.html");
        return modelAndView;
    }

    @RequestMapping("/search-contacts.html")
    public ModelAndView searchContact(@RequestParam(name = "letters") String letters) {
        ModelAndView modelAndView = new ModelAndView("search-contacts");
        List<ContactBean> list = new ArrayList<>();
        getContactList().forEach( contactBean -> {
            if (contactBean.getName().toLowerCase().startsWith(letters.toLowerCase())) {
                list.add(contactBean);
            }
        });
        modelAndView.addObject("list", list);

        return modelAndView;
    }


    @ModelAttribute(name = "contactList")
    private Iterable<ContactBean> getContactList() {
        Iterable<ContactBean> list = contactService.getAllContacts();
        Set<ContactBean> contactList = new TreeSet<ContactBean>(new Comparator<ContactBean>() {
            public int compare(ContactBean o1, ContactBean o2) {
                return o1.getName().compareToIgnoreCase(o2.getName());
            }
        });
       list.forEach(contactBean->contactList.add(contactBean));

        return contactList;
    }

    @ModelAttribute(name = "contact")
    private ContactBean getEmptyContact() {
        return new ContactBean();
    }
}
