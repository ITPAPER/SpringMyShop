package study.spring.springmyshop.model;

import java.util.List;
import com.google.gson.reflect.TypeToken;
import com.google.gson.Gson;
import study.spring.springmyshop.helper.UploadItem;

/** `상품` 테이블의 POJO 클래스 (20/05/07 04:26:41) */
public class Products {
    /** 일련번호, IS NOT NULL, PRI */
    private int id;

    /** 상품명, IS NOT NULL */
    private String name;

    /** 간략설명, IS NOT NULL */
    private String description;

    /** 상품가격, IS NOT NULL */
    private int price;

    /** 할인가(할인없을 경우 0), IS NOT NULL */
    private int salePrice;

    /** 옵션(json=ProductOptions,list=True), IS NOT NULL */
    private List<ProductOptions> option;

    /** 노출여부(Y/N), IS NOT NULL */
    private String isOpen;

    /** 신상품(Y/N), IS NOT NULL */
    private String isNew;

    /** 베스트(Y/N), IS NOT NULL */
    private String isBest;

    /** 추천상품(Y/N), IS NOT NULL */
    private String isVote;

    /** 상품 URL(크롤링한 원본 사이트), IS NOT NULL */
    private String url;

    /** 상품설명, IS NOT NULL */
    private Object content;

    /** 리스트 이미지{json=UploadItem}, IS NOT NULL */
    private UploadItem listImg;

    /** 상품 타이틀 이미지{json=UploadItem}, IS NOT NULL */
    private UploadItem titleImg;

    /** 등록일시, IS NOT NULL */
    private String regDate;

    /** 변경일시, IS NOT NULL */
    private String editDate;

    /** 일련번호, IS NOT NULL, PRI */
    public void setId(int id) {
        this.id = id;
    }

    /** 일련번호, IS NOT NULL, PRI */
    public int getId() {
        return this.id;
    }

    /** 상품명, IS NOT NULL */
    public void setName(String name) {
        this.name = name;
    }

    /** 상품명, IS NOT NULL */
    public String getName() {
        return this.name;
    }

    /** 간략설명, IS NOT NULL */
    public void setDescription(String description) {
        this.description = description;
    }

    /** 간략설명, IS NOT NULL */
    public String getDescription() {
        return this.description;
    }

    /** 상품가격, IS NOT NULL */
    public void setPrice(int price) {
        this.price = price;
    }

    /** 상품가격, IS NOT NULL */
    public int getPrice() {
        return this.price;
    }

    /** 할인가(할인없을 경우 0), IS NOT NULL */
    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    /** 할인가(할인없을 경우 0), IS NOT NULL */
    public int getSalePrice() {
        return this.salePrice;
    }

    /** 옵션(json=ProductOptions,list=True), IS NOT NULL */
    public void setOptionJson(String option) {
        this.option = new Gson().fromJson(option, new TypeToken<List<ProductOptions>>() {}.getType());
    }

    /** 옵션(json=ProductOptions,list=True), IS NOT NULL */
    public void setOption(List<ProductOptions> option) {
        this.option = option;
    }

    /** 옵션(json=ProductOptions,list=True), IS NOT NULL */
    public List<ProductOptions> getOption() {
        return this.option;
    }

    /** 옵션(json=ProductOptions,list=True), IS NOT NULL */
    public String getOptionJson() {
        return new Gson().toJson(option);
    }

    /** 노출여부(Y/N), IS NOT NULL */
    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }

    /** 노출여부(Y/N), IS NOT NULL */
    public String getIsOpen() {
        return this.isOpen;
    }

    /** 신상품(Y/N), IS NOT NULL */
    public void setIsNew(String isNew) {
        this.isNew = isNew;
    }

    /** 신상품(Y/N), IS NOT NULL */
    public String getIsNew() {
        return this.isNew;
    }

    /** 베스트(Y/N), IS NOT NULL */
    public void setIsBest(String isBest) {
        this.isBest = isBest;
    }

    /** 베스트(Y/N), IS NOT NULL */
    public String getIsBest() {
        return this.isBest;
    }

    /** 추천상품(Y/N), IS NOT NULL */
    public void setIsVote(String isVote) {
        this.isVote = isVote;
    }

    /** 추천상품(Y/N), IS NOT NULL */
    public String getIsVote() {
        return this.isVote;
    }

    /** 상품 URL(크롤링한 원본 사이트), IS NOT NULL */
    public void setUrl(String url) {
        this.url = url;
    }

    /** 상품 URL(크롤링한 원본 사이트), IS NOT NULL */
    public String getUrl() {
        return this.url;
    }

    /** 상품설명, IS NOT NULL */
    public void setContent(Object content) {
        this.content = content;
    }

    /** 상품설명, IS NOT NULL */
    public Object getContent() {
        return this.content;
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

    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;

    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;

    public static int getOffset() {
        return offset;
    }

    public static void setOffset(int offset) {
        Products.offset = offset;
    }

    public static int getListCount() {
        return listCount;
    }

    public static void setListCount(int listCount) {
        Products.listCount = listCount;
    }

    @Override
    public String toString() {
        String str = "\n[Products]\n";
        str += "id: " + this.id + " (일련번호, IS NOT NULL, PRI)\n";
        str += "name: " + this.name + " (상품명, IS NOT NULL)\n";
        str += "description: " + this.description + " (간략설명, IS NOT NULL)\n";
        str += "price: " + this.price + " (상품가격, IS NOT NULL)\n";
        str += "salePrice: " + this.salePrice + " (할인가(할인없을 경우 0), IS NOT NULL)\n";
        str += "option: " + this.option + " (옵션(json=ProductOptions,list=True), IS NOT NULL)\n";
        str += "isOpen: " + this.isOpen + " (노출여부(Y/N), IS NOT NULL)\n";
        str += "isNew: " + this.isNew + " (신상품(Y/N), IS NOT NULL)\n";
        str += "isBest: " + this.isBest + " (베스트(Y/N), IS NOT NULL)\n";
        str += "isVote: " + this.isVote + " (추천상품(Y/N), IS NOT NULL)\n";
        str += "url: " + this.url + " (상품 URL(크롤링한 원본 사이트), IS NOT NULL)\n";
        str += "content: " + this.content + " (상품설명, IS NOT NULL)\n";
        str += "listImg: " + this.listImg + " (리스트 이미지{json=UploadItem}, IS NOT NULL)\n";
        str += "titleImg: " + this.titleImg + " (상품 타이틀 이미지{json=UploadItem}, IS NOT NULL)\n";
        str += "regDate: " + this.regDate + " (등록일시, IS NOT NULL)\n";
        str += "editDate: " + this.editDate + " (변경일시, IS NOT NULL)\n";
        return str;
    }
}
