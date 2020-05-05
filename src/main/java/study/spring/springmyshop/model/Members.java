package study.spring.springmyshop.model;

import com.google.gson.Gson;
import study.spring.springmyshop.helper.UploadItem;

/** `회원` 테이블의 POJO 클래스 (20/05/05 14:22:10) */
public class Members {
    /** 일련번호, IS NOT NULL, PRI */
    private int id;

    /** 아이디, IS NOT NULL */
    private String userId;

    /** 비밀번호(암호화저장), IS NOT NULL */
    private String userPw;

    /** 이메일, IS NOT NULL */
    private String email;

    /** 회원이름, IS NOT NULL */
    private String userName;

    /** 생년월일, IS NOT NULL */
    private String birthday;

    /** 성별(M=남자,F=여자), IS NOT NULL */
    private String gender;

    /** 우편번호, IS NOT NULL */
    private String postcode;

    /** 검색된 주소, IS NOT NULL */
    private String addr1;

    /** 나머지 주소, IS NOT NULL */
    private String addr2;

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    private UploadItem photo;

    /** 탈퇴여부(Y/N), IS NOT NULL */
    private String isOut;

    /** 관리자 여부(Y/N), IS NOT NULL */
    private String isAdmin;

    /** 마지막 로그인 일시, IS NOT NULL */
    private String loginDate;

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

    /** 아이디, IS NOT NULL */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /** 아이디, IS NOT NULL */
    public String getUserId() {
        return this.userId;
    }

    /** 비밀번호(암호화저장), IS NOT NULL */
    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    /** 비밀번호(암호화저장), IS NOT NULL */
    public String getUserPw() {
        return this.userPw;
    }

    /** 이메일, IS NOT NULL */
    public void setEmail(String email) {
        this.email = email;
    }

    /** 이메일, IS NOT NULL */
    public String getEmail() {
        return this.email;
    }

    /** 회원이름, IS NOT NULL */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /** 회원이름, IS NOT NULL */
    public String getUserName() {
        return this.userName;
    }

    /** 생년월일, IS NOT NULL */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /** 생년월일, IS NOT NULL */
    public String getBirthday() {
        return this.birthday;
    }

    /** 성별(M=남자,F=여자), IS NOT NULL */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /** 성별(M=남자,F=여자), IS NOT NULL */
    public String getGender() {
        return this.gender;
    }

    /** 우편번호, IS NOT NULL */
    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    /** 우편번호, IS NOT NULL */
    public String getPostcode() {
        return this.postcode;
    }

    /** 검색된 주소, IS NOT NULL */
    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    /** 검색된 주소, IS NOT NULL */
    public String getAddr1() {
        return this.addr1;
    }

    /** 나머지 주소, IS NOT NULL */
    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    /** 나머지 주소, IS NOT NULL */
    public String getAddr2() {
        return this.addr2;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setPhoto(String photo) {
        this.photo = new Gson().fromJson(photo, UploadItem.class);
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setPhoto(UploadItem photo) {
        this.photo = photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public UploadItem getPhoto() {
        return this.photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public String getPhotoJson() {
        return new Gson().toJson(this.photo);
    }

    /** 탈퇴여부(Y/N), IS NOT NULL */
    public void setIsOut(String isOut) {
        this.isOut = isOut;
    }

    /** 탈퇴여부(Y/N), IS NOT NULL */
    public String getIsOut() {
        return this.isOut;
    }

    /** 관리자 여부(Y/N), IS NOT NULL */
    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }

    /** 관리자 여부(Y/N), IS NOT NULL */
    public String getIsAdmin() {
        return this.isAdmin;
    }

    /** 마지막 로그인 일시, IS NOT NULL */
    public void setLoginDate(String loginDate) {
        this.loginDate = loginDate;
    }

    /** 마지막 로그인 일시, IS NOT NULL */
    public String getLoginDate() {
        return this.loginDate;
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

    @Override
    public String toString() {
        String str = "\n[Members]";
        str += "id: " + this.id + " (일련번호, IS NOT NULL, PRI)\n";
        str += "userId: " + this.userId + " (아이디, IS NOT NULL)\n";
        str += "userPw: " + this.userPw + " (비밀번호(암호화저장), IS NOT NULL)\n";
        str += "email: " + this.email + " (이메일, IS NOT NULL)\n";
        str += "userName: " + this.userName + " (회원이름, IS NOT NULL)\n";
        str += "birthday: " + this.birthday + " (생년월일, IS NOT NULL)\n";
        str += "gender: " + this.gender + " (성별(M=남자,F=여자), IS NOT NULL)\n";
        str += "postcode: " + this.postcode + " (우편번호, IS NOT NULL)\n";
        str += "addr1: " + this.addr1 + " (검색된 주소, IS NOT NULL)\n";
        str += "addr2: " + this.addr2 + " (나머지 주소, IS NOT NULL)\n";
        str += "photo: " + this.photo + " (프로필사진 정보{json=UploadItem}, IS NULL)\n";
        str += "isOut: " + this.isOut + " (탈퇴여부(Y/N), IS NOT NULL)\n";
        str += "isAdmin: " + this.isAdmin + " (관리자 여부(Y/N), IS NOT NULL)\n";
        str += "loginDate: " + this.loginDate + " (마지막 로그인 일시, IS NOT NULL)\n";
        str += "regDate: " + this.regDate + " (등록일시, IS NOT NULL)\n";
        str += "editDate: " + this.editDate + " (변경일시, IS NOT NULL)\n";
        return str;
    }
}
