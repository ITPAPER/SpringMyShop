package study.spring.springmyshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import study.spring.springmyshop.helper.UploadItem;
import study.spring.springmyshop.model.Members;

/** JUnit에 의한 테스트 클래스로 정의 */
// import org.junit.runner.RunWith;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
// import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
// import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
// import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MembersTest {

    /** MyBatis의 SQL세션 주입 설정 */
    @Autowired
    private SqlSession sqlSession;
    
    int id = 0;

    /** 목록 조회 테스트 */
    // import org.junit.Test;
    @Test
    public void testA() {
        List<Members> list = sqlSession.selectList("MembersMapper.selectList", null);
        
        for (Members item : list) {
            System.out.println(list.toString());
        }
    }
    
    /** 상세 조회 테스트 */
    @Test
    public void testB() {
        Members input = new Members();
        input.setId(1);
        Members output = sqlSession.selectOne("MembersMapper.selectItem", input);
        System.out.println(output.toString());
    }
    
    /** 데이터 저장 테스트 */
    @Test
    public void testC() {
        UploadItem upload = new UploadItem();
        upload.setContentType("image/png");
        upload.setFieldName("photo");
        upload.setFilePath("/test.png");
        upload.setFileSize(1234);
        upload.setOrginName("hello.png");

        Members input = new Members();
        input.setUserId("test");
        input.setUserPw("123qwe!@#");
        input.setUserName("테스트");
        input.setEmail("test@gmail.com");
        input.setBirthday("2020-01-02");
        input.setGender("M");
        input.setPostcode("12345");
        input.setAddr1("주소1");
        input.setAddr2("주소2");
        input.setPhoto(upload);
        input.setIsOut("N");
        input.setIsAdmin("N");
        
        sqlSession.insert("MembersMapper.insertItem", input);
        
        System.out.println(input.toString());
        
        id = input.getId();
    }
    
    /** 데이터 수정 테스트 */
    @Test
    public void testD() {
        UploadItem upload = new UploadItem();
        upload.setContentType("image/png");
        upload.setFieldName("photo");
        upload.setFilePath("/test.png");
        upload.setFileSize(1234);
        upload.setOrginName("hello.png");

        Members input = new Members();
        input.setId(3);
        input.setUserId("test");
        input.setUserPw("123qwe!@#");
        input.setUserName("테스트");
        input.setEmail("test@gmail.com");
        input.setBirthday("2020-01-02");
        input.setGender("M");
        input.setPostcode("12345");
        input.setAddr1("주소1");
        input.setAddr2("주소2");
        input.setPhoto(upload);
        input.setIsOut("N");
        input.setIsAdmin("N");
        
        sqlSession.update("MembersMapper.updateItem", input);
    }
    
    /** 데이터 삭제 테스트 */
    @Test
    public void testE() {        
        Members input = new Members();
        input.setId(id);
        sqlSession.delete("MembersMapper.deleteItem", input);
    }
}