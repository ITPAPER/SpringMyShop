package study.spring.springmyshop.model;

import lombok.Data;

@Data
public class ProductOptions {
    /* 옵션 이름 */
    private String name;
    
    /* 옵션 항목들 */
    private String[] value;
}
