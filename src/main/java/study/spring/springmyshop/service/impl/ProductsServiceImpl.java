package study.spring.springmyshop.service.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import study.spring.springmyshop.model.Products;
import study.spring.springmyshop.service.ProductsService;

/** 상품 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service
public class ProductsServiceImpl implements ProductsService {

    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

    /**
     * 상품 데이터 상세 조회
     * @param input 조회할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public Products getProductsItem(Products input) throws Exception {
        Products result = null;

        try {
            result = sqlSession.selectOne("ProductsMapper.selectItem", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터 목록 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<Products> getProductsList(Products input) throws Exception {
        List<Products> result = null;

        try {
            result = sqlSession.selectList("ProductsMapper.selectList", input);
            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터가 저장되어 있는 갯수 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int getProductsCount(Products input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.selectOne("ProductsMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터 등록하기
     * @param input 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int addProducts(Products input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("ProductsMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터 수정하기
     * @param input 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int editProducts(Products input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("ProductsMapper.updateItem", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }

    /**
     * 상품 데이터 삭제하기
     * @param input 삭제할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int deleteProducts(Products input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("ProductsMapper.deleteItem", input);
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
    }

}
