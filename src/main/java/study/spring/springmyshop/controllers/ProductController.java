package study.spring.springmyshop.controllers;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.springmyshop.helper.PageData;
import study.spring.springmyshop.helper.UploadItem;
import study.spring.springmyshop.helper.WebHelper;
import study.spring.springmyshop.model.Products;
import study.spring.springmyshop.service.ProductsService;

@Slf4j
@Controller
public class ProductController {
    
    @Autowired
    WebHelper webHelper;
    
    @Autowired
    ProductsService productService;

    /**
     * 카테고리별 상품 목록 조회
     * @param model
     * @param category
     * @param page
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/product/{category}", method = RequestMethod.GET)
    public ModelAndView index(Model model,
            @PathVariable(value = "category") String category, 
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "keyword", required = false) String keyword) {
        
        PageData pageData = null;
        List<Products> output = null;
        Products input = new Products();
        String categoryName = null;
        String categoryDesc = null;
        
        input.setIsOpen("Y");
        
        if (category.equals("new")) {
            input.setIsNew("Y");
            categoryName = "New Item";
            categoryDesc = "트랜디한 신상품";
        } else if (category.equals("best")) {
            input.setIsBest("Y");
            categoryName = "Best Item";
            categoryDesc = "인기폭주 베스트 아이템";
        } else if (category.equals("vote")) {
            input.setIsVote("Y");
            categoryName = "Vote Item";
            categoryDesc = "좋은 것만 모아서 추천상품";
        } else {
            return webHelper.redirect(null, "존재하지 않는 카테고리 입니다.");
        }
        
        if (keyword != null && !keyword.equals("")) {
            input.setName(keyword);
        }
        
        // 검색조건 로그 출력
        log.debug(input.toString());
        
        try {
            int total = productService.getProductsCount(input);
            pageData = new PageData(page, total, 36, 5);
            
            Products.setOffset(pageData.getOffset());
            Products.setListCount(pageData.getListCount());

            output = productService.getProductsList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        if (output != null) {
            for (Products item : output) {
                UploadItem img = item.getListImg();
                img.setFileUrl(webHelper.getUploadPath(img.getFilePath()));
            }
        }
        
        model.addAttribute("category", category);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("categoryDesc", categoryDesc);
        model.addAttribute("productList", output);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageData", pageData);
        
        return new ModelAndView("product/index");
    }
    
    /**
     * 상품 상세 정보 조회
     * @param model
     * @param productId
     * @return
     */
    @RequestMapping(value = "/product/{category}/{productId}", method = RequestMethod.GET)
    public ModelAndView detail(Model model,
            @PathVariable(value = "productId") int productId) {
        
        Products input = new Products();
        input.setId(productId);
        
        Products output = null;
        
        try {
            output = productService.getProductsItem(input);
        } catch (Exception e) {
            webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        if (output != null) {
            UploadItem item = output.getTitleImg();
            String filePath = item.getFilePath();
            item.setFileUrl(webHelper.getUploadPath(filePath));
            
            try {
                String thumbnail = webHelper.createThumbnail(filePath, 800, 800, false);
                item.setThumbnailUrl(webHelper.getUploadPath(thumbnail));
            } catch (Exception e) {
                // 썸네일 생성 실패시 원본 이미지를 썸네일로 직접 지정
                item.setThumbnailUrl(webHelper.getUploadPath(filePath));
            }
        }
        
        log.debug(output.toString());
        
        model.addAttribute("output", output);
        
        return new ModelAndView("product/detail");
    }

}
