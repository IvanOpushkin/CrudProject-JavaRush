package controllerr.controller;

import controllerr.model.User;
import controllerr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


@Controller
public class UserController {
    private UserService userService;
    private final static int MAX_ROWS = 5;
    private static int pN = 0;
    private static int pS = 0;
    private PagedListHolder<User> searchX;
    private static String SEARCH_ATTRIBUTE = "";



    public UserService getUserService() {
        return userService;
    }

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/")
    public String listMain()
    {
        return "redirect:/paging";
    }

    @RequestMapping("/search{page}")
    public String listUsers2(@RequestParam(required = false) String searchValue,@PathVariable Integer page, Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());

        if (searchValue != null && !searchValue.equals(""))
            SEARCH_ATTRIBUTE = searchValue;

        //for check purpose
        model.addAttribute("SEARCH_ATTRIBUTE", SEARCH_ATTRIBUTE);
        model.addAttribute("searchUsers", this.userService.searchUsersByAnyValue(SEARCH_ATTRIBUTE));


        if(page!=null)
            pS = page;
        else pS = 0;

        List<User> useries = this.userService.searchUsersByAnyValue(SEARCH_ATTRIBUTE);
        searchX = new PagedListHolder<User>(useries);



        searchX.setPageSize(MAX_ROWS);
        model.addAttribute("searchX", searchX);
        model.addAttribute("maxPages", searchX.getPageCount());
        model.addAttribute("page", pS);


        searchX.setPage(pS);
        model.addAttribute("pagedList", searchX.getPageList());

        return "/WEB-INF/pages/userSearch.jsp";
    }

    @RequestMapping("/paging{page}")
    public String listOfUsers(@PathVariable Integer page, Model model) {

        if(page!=null)
        pN = page;
        else pN=0;

        List<User> users = this.userService.listUsers();

        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(MAX_ROWS);

        model.addAttribute("user", new User());
        model.addAttribute("maxPages", pagedListHolder.getPageCount());
        model.addAttribute("page", pN);

        //if (pN >= pagedListHolder.getPageCount())
           // pN = 0;

            pagedListHolder.setPage(pN);
            model.addAttribute("pagedList", pagedListHolder.getPageList());


        return "/WEB-INF/pages/paging.jsp";
    }


    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0){
            user.setCreatedDate(new Date());
            this.userService.addUser(user);
        }else {
            //изза транзакционности
            user.setCreatedDate(new Date());
            this.userService.updateUser(user);
        }
        return "redirect:/paging";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);

        return "redirect:/paging";
    }

    @RequestMapping(value = "edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "/WEB-INF/pages/editingTheUser.jsp";

    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));

        return "/WEB-INF/pages/userdata.jsp";
    }

}