package study.spring.springmyshop.model;

import java.util.List;
import com.google.gson.reflect.TypeToken;

import study.spring.springmyshop.helper.UploadItem;

import com.google.gson.Gson;

/** `` 테이블의 POJO 클래스 (20/05/13 06:50:02) */
public class Carts {
    /** 일련번호, IS NOT NULL, PRI */
    private int id;

    /** JSESSIONID, IS NOT NULL */
    private String sessionId;

    /** 상품번호, IS NOT NULL, MUL */
    private int productId;

    /** 회원번호, IS NULL, MUL */
    private Integer memberId;

    /** 금액, IS NOT NULL */
    private int orderPrice;

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    private List<CartOptions> options;

    /** 직접주문여부(Y/N), IS NOT NULL */
    private String isDirectOrder;

    /** 등록일시, IS NOT NULL */
    private String regDate;

    /** 변경일시, IS NOT NULL */
    private String editDate;
    
    /** JOIN을 위한 컬럼 추가 */
    private String name;
    private String description;
    private UploadItem listImg;

    /** 일련번호, IS NOT NULL, PRI */
    public void setId(int id) {
        this.id = id;
    }

    /** 일련번호, IS NOT NULL, PRI */
    public int getId() {
        return this.id;
    }

    /** JSESSIONID, IS NOT NULL */
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    /** JSESSIONID, IS NOT NULL */
    public String getSessionId() {
        return this.sessionId;
    }

    /** 상품번호, IS NOT NULL, MUL */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /** 상품번호, IS NOT NULL, MUL */
    public int getProductId() {
        return this.productId;
    }

    /** 회원번호, IS NULL, MUL */
    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    /** 회원번호, IS NULL, MUL */
    public Integer getMemberId() {
        return this.memberId;
    }

    /** 금액, IS NOT NULL */
    public void setOrderPrice(int orderPrice) {
        this.orderPrice = orderPrice;
    }

    /** 금액, IS NOT NULL */
    public int getOrderPrice() {
        return this.orderPrice;
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public void setOptionsJson(String options) {
        this.options = new Gson().fromJson(options, new TypeToken<List<CartOptions>>() {}.getType());
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public void setOptions(List<CartOptions> options) {
        this.options = options;
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public List<CartOptions> getOptions() {
        return this.options;
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public String getOptionsJson() {
        return new Gson().toJson(options);
    }

    /** 직접주문여부(Y/N), IS NOT NULL */
    public void setIsDirectOrder(String isDirectOrder) {
        this.isDirectOrder = isDirectOrder;
    }

    /** 직접주문여부(Y/N), IS NOT NULL */
    public String getIsDirectOrder() {
        return this.isDirectOrder;
    }

    /** 등록일시, IS NOT NULL */
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    /** 등록일시, IS NOT NULL */
    public String getRegDate() {
        return this.regDate;
    }

    /** 변경일시, IS NOT NULL */
    public void setEditDate(String editDate) {
        this.editDate = editDate;
    }

    /** 변경일시, IS NOT NULL */
    public String getEditDate() {
        return this.editDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /** 리스트 이미지{json=UploadItem}, IS NOT NULL */
    public void setListImgJson(String listImg) {
        this.listImg = new Gson().fromJson(listImg, UploadItem.class);
    }

    /** 리스트 이미지{json=UploadItem}, IS NOT NULL */
    public void setListImg(UploadItem listImg) {
        this.listImg = listImg;
    }

    /** 리스트 이미지{json=UploadItem}, IS NOT NULL */
    public UploadItem getListImg() {
        return this.listImg;
    }

    /** 리스트 이미지{json=UploadItem}, IS NOT NULL */
    public String getListImgJson() {
        return new Gson().toJson(this.listImg);
    }

    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;

    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Carts.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
        Carts.listCount = listCount;
    }

    @Override
    public String toString() {
        String str = "\n[Carts]\n";
        str += "id: " + this.id + " (일련번호, IS NOT NULL, PRI)\n";
        str += "sessionId: " + this.sessionId + " (JSESSIONID, IS NOT NULL)\n";
        str += "productId: " + this.productId + " (상품번호, IS NOT NULL, MUL)\n";
        str += "memberId: " + this.memberId + " (회원번호, IS NULL, MUL)\n";
        str += "orderPrice: " + this.orderPrice + " (금액, IS NOT NULL)\n";
        str += "options: " + this.options + " (상품옵션(json=CartOptions,list=True), IS NOT NULL)\n";
        str += "isDirectOrder: " + this.isDirectOrder + " (직접주문여부(Y/N), IS NOT NULL)\n";
        str += "regDate: " + this.regDate + " (등록일시, IS NOT NULL)\n";
        str += "editDate: " + this.editDate + " (변경일시, IS NOT NULL)\n";
        return str;
    }
}
