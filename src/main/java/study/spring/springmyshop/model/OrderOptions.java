package study.spring.springmyshop.model;

import lombok.Data;

/**
 * 장바구니 옵션
 */
@Data
public class OrderOptions {
    /** 옵션명 */
    private String name;
    
    /** 옵션 단가 */
    private int price;
    
    /** 구매수량 */
    private int qty;
    
    /** 합계금액 */
    private int total;
}
