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
    private List<OrderOptions> orderOption;

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
    private UploadItem titleImg;
    
    /** 대량 삭제를 위한 일련번호 배열 */
    private int[] idArr;

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
    public void setOrderOptionJson(String orderOption) {
        this.orderOption = new Gson().fromJson(orderOption, new TypeToken<List<OrderOptions>>() {}.getType());
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public void setOrderOption(List<OrderOptions> orderOption) {
        this.orderOption = orderOption;
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public List<OrderOptions> getOrderOption() {
        return this.orderOption;
    }

    /** 상품옵션(json=CartOptions,list=True), IS NOT NULL */
    public String getOrderOptionJson() {
        return new Gson().toJson(orderOption);
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

    /** 상품 타이틀 이미지{json=UploadItem}, IS NOT NULL */
    public void setTitleImgJson(String titleImg) {
        this.titleImg = new Gson().fromJson(titleImg, UploadItem.class);
    }

    /** 상품 타이틀 이미지{json=UploadItem}, IS NOT NULL */
    public void setTitleImg(UploadItem titleImg) {
        this.titleImg = titleImg;
    }

    /** 상품 타이틀 이미지{json=UploadItem}, IS NOT NULL */
    public UploadItem getTitleImg() {
        return this.titleImg;
    }

    /** 상품 타이틀 이미지{json=UploadItem}, IS NOT NULL */
    public String getTitleImgJson() {
        return new Gson().toJson(this.titleImg);
    }
    
    

    public int[] getIdArr() {
        return idArr;
    }

    public void setIdArr(int[] idArr) {
        this.idArr = idArr;
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
        str += "orderOption: " + this.orderOption + " (상품옵션(json=CartOptions,list=True), IS NOT NULL)\n";
        str += "isDirectOrder: " + this.isDirectOrder + " (직접주문여부(Y/N), IS NOT NULL)\n";
        str += "regDate: " + this.regDate + " (등록일시, IS NOT NULL)\n";
        str += "editDate: " + this.editDate + " (변경일시, IS NOT NULL)\n";
        return str;
    }
}
