package study.spring.springmyshop.controllers;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.springmyshop.helper.UploadItem;
import study.spring.springmyshop.helper.WebHelper;
import study.spring.springmyshop.model.Products;
import study.spring.springmyshop.service.ProductsService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
    
    @Autowired
    WebHelper webHelper;
    
    @Autowired
    ProductsService productsService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        List<Products> newList = null;
        List<Products> bestList = null;
        List<Products> voteList = null;
         
        
        Products newInput = new Products();
        newInput.setIsOpen("Y");
        newInput.setIsNew("Y");
        
        Products bestInput = new Products();
        bestInput.setIsOpen("Y");
        bestInput.setIsBest("Y");
        
        Products voteInput = new Products();
        voteInput.setIsOpen("Y");
        voteInput.setIsVote("Y");
        
        try {
            Products.setOffset(0);
            Products.setListCount(12);
            newList = productsService.getProductsList(newInput);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            Products.setOffset(0);
            Products.setListCount(12);
            bestList = productsService.getProductsList(bestInput);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
            Products.setOffset(0);
            Products.setListCount(24);
            voteList = productsService.getProductsList(voteInput);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        if (newList != null) {
            for (Products item : newList) {
                UploadItem img = item.getListImg();
                img.setFileUrl(webHelper.getUploadPath(img.getFilePath()));
            }
        }
        
        if (bestList != null) {
            for (Products item : bestList) {
                UploadItem img = item.getListImg();
                img.setFileUrl(webHelper.getUploadPath(img.getFilePath()));
            }
        }
        
        if (voteList != null) {
            for (Products item : voteList) {
                UploadItem img = item.getListImg();
                img.setFileUrl(webHelper.getUploadPath(img.getFilePath()));
            }
        }
        
        model.addAttribute("newList", newList);
        model.addAttribute("bestList", bestList);
        model.addAttribute("voteList", voteList);
        
        return "home";
    }

}
