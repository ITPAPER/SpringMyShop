package study.spring.springmyshop.controllers.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import study.spring.springmyshop.helper.RegexHelper;
import study.spring.springmyshop.helper.WebHelper;
import study.spring.springmyshop.model.Carts;
import study.spring.springmyshop.model.Members;
import study.spring.springmyshop.service.CartsService;
import study.spring.springmyshop.service.ProductsService;

@RestController
public class ShoppingRestController {
    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    CartsService cartsService;
    
    /** 장바구니 담기 */
    @RequestMapping(value = "/rest/shopping/add_cart", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> addCart(
            HttpSession session,
            @SessionAttribute(value = "member", required = false) Members members,
            @RequestParam(value = "product_id", defaultValue = "0") int productId,
            @RequestParam(value = "options", required = false) String options,
            @RequestParam(value = "direct", required = false) String direct,
            @RequestParam(value = "order_price", defaultValue = "0") int orderPrice) {

        if (productId < 1) {
            return webHelper.getJsonWarning("선택된 상품이 없습니다.");
        }
        
        if (!regexHelper.isValue(options)) {
            return webHelper.getJsonWarning("선택된 옵션이 없습니다.");
        }
        
        if (orderPrice < 1) {
            return webHelper.getJsonWarning("합계금액이 잘못되었습니다.");
        }
        
        Carts input = new Carts();
        // 비회원인 경우 클라이언트를 식별하기 위한 JSESSION-ID -> 모든 브라우저마다 고유한 값으로 할당된다.
        input.setSessionId(session.getId());
        
        if (members != null) {
            input.setMemberId(members.getId());
        }
        
        input.setProductId(productId);
        input.setOptionsJson(options);
        input.setOrderPrice(orderPrice);
        input.setIsDirectOrder(direct);
        
        try {
            cartsService.addCarts(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cart_id", input.getId());
        return webHelper.getJsonData(map);
    }
}
