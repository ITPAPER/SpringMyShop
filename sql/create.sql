DROP DATABASE IF EXISTS springmyshop;

CREATE DATABASE IF NOT EXISTS springmyshop default charset utf8;

USE springmyshop;

create table members (

    id          int             not null auto_increment comment '일련번호',
    user_id     varchar(30)     not null comment '아이디',
    user_pw     varchar(255)    not null comment '비밀번호(암호화저장)',
    user_name   varchar(30)     not null comment '회원이름',
    email       varchar(255)    not null comment '이메일',
    birthday    date            not null comment '생년월일',
    gender      char(1)         not null comment '성별(M=남자,F=여자)',
    postcode    char(5)         not null comment '우편번호',
    addr1       varchar(255)    not null comment '검색된 주소',
    addr2       varchar(255)    not null comment '나머지 주소',
    photo       blob                null comment '프로필사진 정보{json=UploadItem}',
    is_out      char(1)         not null comment '탈퇴여부(Y/N)',
    is_admin    char(1)         not null comment '관리자 여부(Y/N)',
    login_date  datetime        not null comment '마지막 로그인 일시',
    reg_date    datetime        not null comment '등록일시',
    edit_date   datetime        not null comment '변경일시',
    PRIMARY KEY (id)
    
) engine innodb default charset utf8 comment '회원';

