# ------------------------------------------------------------
# @filename    : create_beans.py
# @author      : 이광호 (leekh4232@gmail.com)
# @description : MySQL에 접속하여 DB테이블을 스캔하고 테이블에 대한 기본 Java Beans를 구성한다.
# ------------------------------------------------------------

# ------------------------------------------------------------
# Package import
# ------------------------------------------------------------
from sqlalchemy import create_engine
import pandas as pd
import datetime as dt
import pymysql
import os

pymysql.install_as_MySQLdb()
import MySQLdb

# ------------------------------------------------------------
# configurations
# ------------------------------------------------------------
# Project Root Path
PROJECT_ROOT = "/Users/leekh/workspace-eclipse/SpringMyShop"

# package name of beans classes
PACKAGE_NAME = "study.spring.springmyshop"

# MYSQL connection informations
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASS = "root"
DB_NAME = "springmyshop"
DB_CHARSET = "UTF-8"

IGNORE_TABLES = ['members']

# ------------------------------------------------------------
# Define functions
# ------------------------------------------------------------
def camelCase(snake_case, title=False):
    l = snake_case.split("_")

    if title == False:
        result = l[0] + "".join(map(str.capitalize, l[1:]))
    else:
        result = "".join(map(str.capitalize, l[0:]))

    return result

# ------------------------------------------------------------
# Define functions
# ------------------------------------------------------------
def makePojoClass(class_name, table_info_df, src_path):
    if os.path.exists(src_path):
        os.rename(src_path, src_path + '.' + dt.datetime.now().strftime('%y%m%d%H%M%S'))

    # `list=True` 이라는 텍스트가 코멘트에 있는 행을 검색
    is_list = len(table_info_df.query('COLUMN_COMMENT.str.contains("list=True")')) > 0
    # `json=` 이라는 텍스트가 코멘트에 있는 행을 검색
    is_json = len(table_info_df.query('COLUMN_COMMENT.str.contains("json=")')) > 0
    is_upload_item = False

    if is_json:
        is_upload_item = len(table_info_df.query('COLUMN_COMMENT.str.contains("json=UploadItem")')) > 0

    with open(src_path, 'w', encoding=DB_CHARSET) as f:
        pojo_name = None

        f.write("package %s.model;\n\n" % PACKAGE_NAME)

        if is_list:
            f.write("import java.util.List;\n")
            f.write("import com.google.gson.reflect.TypeToken;\n")

        if is_json:
            f.write("import com.google.gson.Gson;\n")

        if is_upload_item:
            f.write("import %s.helper.UploadItem;\n" % PACKAGE_NAME)

        if is_list or is_json or is_upload_item:
            f.write("\n")

        f.write("/** `%s` 테이블의 POJO 클래스 (%s) */\n" % (table_comment, datetime_str))
        f.write("public class %s {\n" % class_name)

        # 멤버변수 설정
        for j in table_info_df.index:
            column = table_info_df.loc[j]

            # 멤버변수에 적용할 주석 문자열
            comment = column['COLUMN_COMMENT']

            if column['IS_NULLABLE'] == 'NO':
                comment += ', IS NOT NULL'
            else:
                comment += ', IS NULL'

            if column['COLUMN_KEY']:
                comment += ', ' + column['COLUMN_KEY']

            # 멤버변수의 데이터 타입
            data_type = "String"
            p = comment.find('json=')

            if p > -1:
                if comment.find('list=True') > -1:
                    q = comment.find(',', p+5)
                    data_type = "List<" + comment[p+5:q] + ">"
                else:
                    q = comment.rfind('}')
                    data_type = comment[p+5:q]
            else:
                if column['DATA_TYPE'] == 'int':
                    data_type = "int"
                elif column['DATA_TYPE'] == 'blob':
                    data_type = "Object"

                if data_type == "int" and column['IS_NULLABLE'] == 'YES':
                    data_type = "Integer"

            f.write("    /** %s */\n" % comment)
            f.write("    private %s %s;\n\n" %
                    (data_type, camelCase(column['COLUMN_NAME'])))

        # 메서드 설정
        for j in table_info_df.index:
            column = table_info_df.loc[j]

            # 멤버변수에 적용할 주석 문자열
            comment = column['COLUMN_COMMENT']

            if column['IS_NULLABLE'] == 'NO':
                comment += ', IS NOT NULL'
            else:
                comment += ', IS NULL'

            if column['COLUMN_KEY']:
                comment += ', ' + column['COLUMN_KEY']

            # 멤버변수의 데이터 타입
            data_type = "String"
            p = comment.find('json=')
            x = comment.find('list=True')

            if p > -1:
                if x > -1:
                    q = comment.find(',', p+5)
                    data_type = "List<" + comment[p+5:q] + ">"
                else:
                    q = comment.rfind('}')
                    data_type = comment[p+5:q]
            else:
                if column['DATA_TYPE'] == 'int':
                    data_type = "int"
                elif column['DATA_TYPE'] == 'blob':
                    data_type = "Object"

                if data_type == "int" and column['IS_NULLABLE'] == 'YES':
                    data_type = "Integer"

            column_name = camelCase(column['COLUMN_NAME'])

            if p > -1:
                if x > -1:
                    f.write("    /** %s */\n" % comment)
                    f.write("    public void set%sJson(String %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), column_name))
                    f.write("        this.%s = new Gson().fromJson(%s, new TypeToken<%s>() {}.getType());\n" % (column_name, column_name, data_type))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public void set%s(%s %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), data_type, column_name))
                    f.write("        this.%s = %s;\n" % (column_name, column_name))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public %s get%s() {\n" % (data_type, camelCase(column['COLUMN_NAME'], title=True)))
                    f.write("        return this.%s;\n" % (column_name))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public String get%sJson() {\n" % (camelCase(column['COLUMN_NAME'], title=True)))
                    f.write("        return new Gson().toJson(%s);\n" % (column_name))
                    f.write("    }\n\n")
                else:
                    f.write("    /** %s */\n" % comment)
                    f.write("    public void set%sJson(String %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), column_name))
                    f.write("        this.%s = new Gson().fromJson(%s, %s.class);\n" % (column_name, column_name, data_type))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public void set%s(%s %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), data_type, column_name))
                    f.write("        this.%s = %s;\n" % (column_name, column_name))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public %s get%s() {\n" % (data_type, camelCase(column['COLUMN_NAME'], title=True)))
                    f.write("        return this.%s;\n" % (column_name))
                    f.write("    }\n\n")
                    f.write("    /** %s */\n" % comment)
                    f.write("    public String get%sJson() {\n" % (camelCase(column['COLUMN_NAME'], title=True)))
                    f.write("        return new Gson().toJson(this.%s);\n" % (column_name))
                    f.write("    }\n\n")

            else:
                f.write("    /** %s */\n" % comment)
                f.write("    public void set%s(%s %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), data_type, column_name))
                f.write("        this.%s = %s;\n" % (column_name, column_name))
                f.write("    }\n\n")

                f.write("    /** %s */\n" % comment)
                f.write("    public %s get%s() {\n" % (data_type, camelCase(column['COLUMN_NAME'], title=True)))
                f.write("        return this.%s;\n" % (column_name))
                f.write("    }\n\n")

        f.write("    @Override\n")
        f.write("    public String toString() {\n")
        f.write('        String str = "\\n[%s]\\n";\n' % class_name)

        for j in table_info_df.index:
            column = table_info_df.loc[j]

            comment = column['COLUMN_COMMENT']

            if column['IS_NULLABLE'] == 'NO':
                comment += ', IS NOT NULL'
            else:
                comment += ', IS NULL'

            if column['COLUMN_KEY']:
                comment += ', ' + column['COLUMN_KEY']

            column_name = camelCase(column['COLUMN_NAME'])

            f.write('        str += "%s: " + this.%s + " (%s)\\n";\n' % (column_name, column_name, comment))

        f.write("        return str;\n")
        f.write("    }\n")

        f.write("}\n")


# ------------------------------------------------------------
# Define functions
# ------------------------------------------------------------
def makeMapper(class_name, table_name, table_info_df, mapper_path):
    if os.path.exists(mapper_path):
        os.rename(mapper_path, mapper_path + '.' + dt.datetime.now().strftime('%y%m%d%H%M%S'))

    pojo_path = "%s.model.%s" % (PACKAGE_NAME, class_name)
    mapper_name = "%sMapper" % class_name
    result_map = class_name[:1].lower() + class_name[1:] + "Map"

    with open(mapper_path, 'w', encoding=DB_CHARSET) as f:
        f.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        f.write('<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"\n')
        f.write('    "http://mybatis.org/dtd/mybatis-3-mapper.dtd">\n\n')

        f.write('<mapper namespace="%s">\n' % mapper_name)

        f.write('    <!-- Beans의 멤버변수(property)이름과 대상 테이블의 컬럼(column)을 연결한다. -->\n')
        f.write('    <resultMap id="%s" type="%s">\n' % (result_map, pojo_path))

        column_list = []
        pk_name = None

        for i in table_info_df.index:
            row = table_info_df.loc[i]
            column_list.append(row['COLUMN_NAME'])

            # 멤버변수에 적용할 주석 문자열
            comment = row['COLUMN_COMMENT']

            is_json = comment.count('json=') > 0

            if row['IS_NULLABLE'] == 'NO':
                comment += ', IS NOT NULL'
            else:
                comment += ', IS NULL'

            if row['COLUMN_KEY']:
                comment += ', ' + row['COLUMN_KEY']
                pk_name = row['COLUMN_NAME']

            f.write('        <!-- %s -->\n' % comment)

            if is_json:
                f.write('        <result property="%sJson" column="%s" />\n' % (camelCase(row['COLUMN_NAME']), row['COLUMN_NAME']))
            else:
                f.write('        <result property="%s" column="%s" />\n' % (camelCase(row['COLUMN_NAME']), row['COLUMN_NAME']))

        f.write('    </resultMap>\n\n')

        f.write('    <!-- 단일행 조회를 위한 기능 정의 -->\n')
        f.write('    <select id="selectItem" parameterType="%s" resultMap="%s">\n' % (pojo_path, result_map))
        f.write('        SELECT %s FROM %s WHERE %s=#{%s}\n' % (", ".join(column_list), table_name, pk_name, camelCase(pk_name)))
        f.write('    </select>\n\n')

        f.write('    <!-- 다중행 조회를 위한 기능 정의 -->\n')
        f.write('    <select id="selectList" parameterType="%s" resultMap="%s">\n' % (pojo_path, result_map))
        f.write('        SELECT %s FROM %s\n' % (", ".join(column_list), table_name))
        f.write('        ORDER BY %s DESC\n' % (pk_name))
        f.write('        <if test="listCount > 0">\n')
        f.write('            LIMIT #{offset}, #{listCount}\n')
        f.write('        </if>\n')
        f.write('    </select>\n\n')
            
        f.write('    <!-- 데이터 수 조회를 위한 기능 정의 -->\n')
        f.write('    <select id="selectCountAll" parameterType="%s" resultType="int">\n' % (pojo_path))
        f.write('        SELECT COUNT(*) FROM %s\n' % table_name)
        f.write('    </select>\n\n')

        f.write('    <!-- 데이터 저장을 위한 기능 정의 -->\n')
        f.write('    <insert id="insertItem" parameterType="%s" useGeneratedKeys="true" keyProperty="%s">\n' % (pojo_path, pk_name))

        keys = []
        values = []
        for i in table_info_df.index:
            row = table_info_df.loc[i]
            c = row['COLUMN_NAME']
            m = row['COLUMN_COMMENT']

            if c == pk_name: continue
            keys.append(c)

            if c == 'reg_date' or c == 'edit_date':
                values.append("now()")
            elif m.count('json=') > 0:
                values.append("#{%sJson}" % camelCase(c))
            else:
                values.append("#{%s}" % camelCase(c))

        f.write('        INSERT INTO %s (\n' % (table_name))
        f.write('            %s\n' % ", ".join(keys))
        f.write('        ) VALUES (\n')
        f.write('            %s\n' % ", ".join(values))
        f.write('        )\n')
        f.write('    </insert>\n\n')

        f.write('    <!-- 데이터 삭제를 위한 기능 정의 -->\n')
        f.write('    <delete id="deleteItem" parameterType="%s">\n' % (pojo_path))
        f.write('        DELETE FROM %s WHERE %s=#{%s}\n' % (table_name, pk_name, camelCase(pk_name)))
        f.write('    </delete>\n\n')

        f.write('    <!-- 데이터 갱신을 위한 기능 정의 -->\n')
        f.write('    <update id="updateItem" parameterType="%s">\n' % (pojo_path))
        f.write('        UPDATE %s SET \n' % (table_name))
        
        l = len(table_info_df.index)
        for i in table_info_df.index:
            row = table_info_df.loc[i]
            c = row['COLUMN_NAME']
            m = row['COLUMN_COMMENT']

            if c == pk_name or c == 'reg_date': continue

            if c == 'edit_date':
                f.write('            edit_date=now()')
            elif m.count('json=') > 0:
                f.write('            %s=#{%sJson}' % (c, camelCase(c)))
            else:
                f.write('            %s=#{%s}' % (c, camelCase(c)))

            if i+1 >= l:
                f.write("\n")
            else:
                f.write(",\n")

        f.write('        WHERE %s=#{%s}\n' % (pk_name, camelCase(pk_name)))
        f.write('    </update>\n\n')

        f.write('</mapper>\n')


def makeService(class_name, table_comment, table_info_df, service_path):
    if os.path.exists(service_path):
        os.rename(service_path, service_path + '.' + dt.datetime.now().strftime('%y%m%d%H%M%S'))

    with open(service_path, 'w', encoding=DB_CHARSET) as f:

        source = """    /**
     * {table_comment} 데이터 상세 조회
     * @param input 조회할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public {class_name} get{class_name}Item({class_name} input) throws Exception;
    
    /**
     * {table_comment} 데이터 목록 조회
     * @param input 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<{class_name}> get{class_name}List({class_name} input) throws Exception;
    
    /**
     * {table_comment} 데이터가 저장되어 있는 갯수 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int get{class_name}Count({class_name} input) throws Exception;
    
    /**
     * {table_comment} 데이터 등록하기
     * @param input 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int add{class_name}({class_name} input) throws Exception;
    
    /**
     * {table_comment} 데이터 수정하기
     * @param input 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int edit{class_name}({class_name} input) throws Exception;
    
    /**
     * {table_comment} 데이터 삭제하기
     * @param input 삭제할 {table_comment}의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int delete{class_name}({class_name} input) throws Exception;\n\n"""

        f.write('package %s.service;\n\n' % PACKAGE_NAME)
        f.write('import java.util.List;\n')
        f.write('import %s.model.%s;\n\n' % (PACKAGE_NAME, class_name))
        f.write('public interface %sService {\n\n' % class_name)
        f.write(source.format(class_name=class_name, table_comment=table_comment))
        f.write('}\n')


def makeImpl(class_name, table_comment, table_info_df, impl_path):
    if os.path.exists(impl_path):
        os.rename(impl_path, impl_path + '.' + dt.datetime.now().strftime('%y%m%d%H%M%S'))

    with open(impl_path, 'w', encoding=DB_CHARSET) as f:

        source = '''    /**
     * {table_comment} 데이터 상세 조회
     * @param input 조회할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    @Override
    public {class_name} get{class_name}Item({class_name} input) throws Exception {{
        {class_name} result = null;

        try {{
            result = sqlSession.selectOne("{class_name}Mapper.selectItem", input);

            if (result == null) {{
                throw new NullPointerException("result=null");
            }}
        }} catch (NullPointerException e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }}

        return result;
    }}

    /**
     * {table_comment} 데이터 목록 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    @Override
    public List<{class_name}> get{class_name}List({class_name} input) throws Exception {{
        List<{class_name}> result = null;

        try {{
            result = sqlSession.selectList("{class_name}Mapper.selectList", input);
            if (result == null) {{
                throw new NullPointerException("result=null");
            }}
        }} catch (NullPointerException e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }}

        return result;
    }}

    /**
     * {table_comment} 데이터가 저장되어 있는 갯수 조회
     * @param input 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int get{class_name}Count({class_name} input) throws Exception {{
        int result = 0;
        
        try {{
            result = sqlSession.selectOne("{class_name}Mapper.selectCountAll", input);
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }}
        
        return result;
    }}

    /**
     * {table_comment} 데이터 등록하기
     * @param input 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int add{class_name}({class_name} input) throws Exception {{
        int result = 0;

        try {{
            result = sqlSession.insert("{class_name}Mapper.insertItem", input);

            if (result == 0) {{
                throw new NullPointerException("result=0");
            }}
        }} catch (NullPointerException e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }}

        return result;
    }}

    /**
     * {table_comment} 데이터 수정하기
     * @param input 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int edit{class_name}({class_name} input) throws Exception {{
        int result = 0;

        try {{
            result = sqlSession.update("{class_name}Mapper.updateItem", input);
            if (result == 0) {{
                throw new NullPointerException("result=0");
            }}
        }} catch (NullPointerException e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }}

        return result;
    }}

    /**
     * {table_comment} 데이터 삭제하기
     * @param input 삭제할 데이터의 일련번호(PK)를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    @Override
    public int delete{class_name}({class_name} input) throws Exception {{
        int result = 0;

        try {{
            result = sqlSession.delete("{class_name}Mapper.deleteItem", input);
            if (result == 0) {{
                throw new NullPointerException("result=0");
            }}
        }} catch (NullPointerException e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        }} catch (Exception e) {{
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }}

        return result;
    }}\n\n'''

        f.write('package %s.service.impl;\n\n' % PACKAGE_NAME)
        f.write('import java.util.List;\n')
        f.write('import org.apache.ibatis.session.SqlSession;\n')
        f.write('import org.springframework.beans.factory.annotation.Autowired;\n')
        f.write('import org.springframework.stereotype.Service;\n')
        f.write('import lombok.extern.slf4j.Slf4j;\n')
        f.write('import %s.model.%s;\n' % (PACKAGE_NAME, class_name))
        f.write('import %s.service.%sService;\n\n' % (PACKAGE_NAME, class_name))

        f.write('/** %s 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */\n' % table_comment)
        f.write('@Slf4j\n')
        f.write('@Service\n')
        f.write('public class %sServiceImpl implements %sService {\n\n' % (class_name, class_name))

        f.write('    /** MyBatis */\n')
        f.write('    // --> import org.apache.ibatis.session.SqlSession\n')
        f.write('    @Autowired\n')
        f.write('    SqlSession sqlSession;\n\n')
        f.write(source.format(class_name=class_name, table_comment=table_comment))
        f.write('}\n')


# ------------------------------------------------------------
# Database Connect
# ------------------------------------------------------------
con_str_fmt = "mysql+mysqldb://{0}:{1}@{2}:{3}/{4}?charset={5}"
con_str = con_str_fmt.format(DB_USER, DB_PASS, DB_HOST, DB_PORT, DB_NAME, DB_CHARSET.replace("-", ""))
engine = create_engine(con_str, encoding=DB_CHARSET)
conn = engine.connect()

# ------------------------------------------------------------
# Get Table List
# ------------------------------------------------------------
table_df = pd.read_sql("SELECT table_name, table_comment FROM information_schema.tables WHERE table_schema='%s';" % DB_NAME, con=conn)

sql_tpl = "SELECT COLUMN_NAME, DATA_TYPE, COLUMN_COMMENT, IS_NULLABLE, COLUMN_KEY FROM information_schema.columns WHERE table_schema='{dbname}' AND table_name ='{tablename}';"

src_dir = PROJECT_ROOT + "/src/main/java/" + PACKAGE_NAME.replace(".", "/") + "/model"
mapper_dir = PROJECT_ROOT + "/src/main/resources/mappers"
service_dir = PROJECT_ROOT + "/src/main/java/" + PACKAGE_NAME.replace(".", "/") + "/service"
impl_dir = service_dir + "/impl"

os.makedirs(src_dir, exist_ok=True)
os.makedirs(mapper_dir, exist_ok=True)
os.makedirs(service_dir, exist_ok=True)
os.makedirs(impl_dir, exist_ok=True)

datetime_str = dt.datetime.now().strftime("%y/%m/%d %H:%M:%S")

# ------------------------------------------------------------
# Loop
# ------------------------------------------------------------
for i in table_df.index:
    table_name = table_df.loc[i]['table_name']

    if table_name in IGNORE_TABLES:
        continue

    table_comment = table_df.loc[i]['table_comment']
    class_name = camelCase(table_name, title=True)

    src_path = src_dir + "/" + class_name + ".java"
    print(src_path)

    mapper_path = mapper_dir + "/" + class_name + "Mapper.xml"
    print(mapper_path)

    service_path = service_dir + "/" + class_name + "Service.java"
    print(service_path)

    impl_path = impl_dir + "/" + class_name + "ServiceImpl.java"
    print(impl_path)

    table_info_df = pd.read_sql(sql_tpl.format(dbname=DB_NAME, tablename=table_name), con=conn)

    makePojoClass(class_name, table_info_df, src_path)
    makeMapper(class_name, table_name, table_info_df, mapper_path)
    makeService(class_name, table_comment, table_info_df, service_path)
    makeImpl(class_name, table_comment, table_info_df, impl_path)

# ------------------------------------------------------------
# Database Disconnect
# ------------------------------------------------------------
conn.close()
