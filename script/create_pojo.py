#------------------------------------------------------------
# @filename    : create_beans.py
# @author      : 이광호 (leekh4232@gmail.com)
# @description : MySQL에 접속하여 DB테이블을 스캔하고 테이블에 대한 기본 Java Beans를 구성한다.
#------------------------------------------------------------

#------------------------------------------------------------
# configurations
#------------------------------------------------------------
# Project Root Path
PROJECT_ROOT = "D:\\workspace-eclipse\\SpringMyShop"

# package name of beans classes
PACKAGE_NAME = "study.spring.springmyshop"

# MYSQL connection informations
DB_HOST = "localhost"
DB_PORT = 3306
DB_USER = "root"
DB_PASS = "123qwe!@#"
DB_NAME = "springmyshop"
DB_CHARSET = "UTF-8"

#------------------------------------------------------------
# Package import
#------------------------------------------------------------
import os
import pymysql
import datetime as dt
import pandas as pd
from sqlalchemy import create_engine

pymysql.install_as_MySQLdb()
import MySQLdb


#------------------------------------------------------------
# Define functions
#------------------------------------------------------------
def camelCase(snake_case, title=False):
    l = snake_case.split("_")

    if title == False:
        result = l[0] + "".join(map(str.capitalize, l[1:]))
    else:
        result = "".join(map(str.capitalize, l[0:]))

    return result

#------------------------------------------------------------
# Database Connect
#------------------------------------------------------------
con_str_fmt = "mysql+mysqldb://{0}:{1}@{2}:{3}/{4}?charset={5}"
con_str = con_str_fmt.format(DB_USER, DB_PASS, DB_HOST, DB_PORT, DB_NAME, DB_CHARSET.replace("-", ""))
engine = create_engine(con_str, encoding=DB_CHARSET)
conn = engine.connect()

#------------------------------------------------------------
# Get Table List
#------------------------------------------------------------
table_df = pd.read_sql("SELECT table_name, table_comment FROM information_schema.tables WHERE table_schema='%s';" % DB_NAME, con=conn)

sql_tpl = "SELECT COLUMN_NAME, DATA_TYPE, COLUMN_COMMENT, IS_NULLABLE, COLUMN_KEY FROM information_schema.columns WHERE table_schema='{dbname}' AND table_name ='{tablename}';"

src_dir = PROJECT_ROOT + "\\src\\main\\java\\" + PACKAGE_NAME.replace(".", "\\") + "\\model"
os.makedirs(src_dir, exist_ok=True)

datetime_str = dt.datetime.now().strftime("%y/%m/%d %H:%M:%S")

#------------------------------------------------------------
# Loop
#------------------------------------------------------------
for i in table_df.index:
    table_name = table_df.loc[i]['table_name']
    table_comment = table_df.loc[i]['table_comment']

    class_name = camelCase(table_name, title=True)
    src_path = src_dir + "\\" + class_name + ".java"
    print(src_path)

    sql = sql_tpl.format(dbname=DB_NAME, tablename=table_name)
    
    table_info_df = pd.read_sql(sql, con=conn)
    
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
        f.write("public class %s {\n" % class_name);

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
            f.write("    private %s %s;\n\n" % (data_type, camelCase(column['COLUMN_NAME'])))

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
                    f.write("    public void set%s(String %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), column_name))
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
                    f.write("    public void set%s(String %s) {\n" % (camelCase(column['COLUMN_NAME'], title=True), column_name))
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
        f.write('        String str = "\\n[%s]";\n' % class_name)
        
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

#------------------------------------------------------------
# Database Disconnect
#------------------------------------------------------------
conn.close()