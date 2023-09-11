-- 쇼핑(shopping) 사용자 계정 생성
-- drop user shopping cascade ;
create user shopping identified by oracle account unlock ;
alter user shopping default tablespace users quota unlimited on users ;
grant connect, resource to shopping;

-- exerd를 사용하여 쇼핑(shopping) 사용자에게 테이블을 생성하세요.

-- 다음 문장들을 실행합니다.
-- 회원 데이터(성별은 영어로 입력하도록 할 것)
insert into members(id, name, password, gender, birth, marriage, salary, address, manager)
values('admin', '관리자', 'abc123', 'male', '1990/12/25', '미혼', 100, '용산', null) ;
insert into members(id, name, password, gender, birth, marriage, salary, address, manager)
values('kim', '김철수', 'abc123', 'male', '1990/12/25', '결혼', 200, '용산', null) ;
insert into members(id, name, password, gender, birth, marriage, salary, address, manager)
values('park', '박영희', 'abc123', 'female', '1990/12/25', '이혼', 300, '용산', null) ;


-- 게시물 데이터
-- drop sequence seqboard ;
create sequence seqboard start with 1 increment by 1 nocache ;

insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'kim', 'abc123', '자바', '너무 어려워', default, '1980/12/25') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'kim', 'abc123', 'db', '그룹 바이', default, '1988/07/17') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'kim', 'abc123', 'jsp', '웹 프로그래밍', default, '1986/08/15') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'park', 'abc123', 'jdbc', '제이디비씨', default, '1990/01/22') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'park', 'abc123', 'sql', '에스큐엘', default, '1993/06/17') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'admin', 'abc123', '자바', 'java', default, '1990/01/22') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, 'admin', 'abc123', 'sql', '호호호', default, '2008/06/17') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', '자바', 'java', default, '1990/01/22') ;
insert into boards(no, id, password, subject, content, readhit, regdate)
values(seqboard.nextval, null, 'abc123', 'sql', '호호호', default, '2008/06/17') ;

-- 답글 시스템으로 인한 컬럼 추가
alter table boards add(depth number default 0) ;


-- 상품 관련 시퀀스 및 테이블 생성
-- 상품 카테고리 테이블
-- engname) 영문 이름, kornaame) 한글 이름
create table Categories(
    module varchar2(20),
    type varchar2(20),
    ordering number,
    engname varchar2(255),
    korname varchar2(255)
);

insert into categories values('product', 'select', 1, '-', '카테고리를 선택해 주세요.');
insert into categories values('product', 'select', 2, 'bread', '빵');
insert into categories values('product', 'select', 3, 'beverage', '음료수');
insert into categories values('product', 'select', 4, 'cake', '케익');


-- 상품 관련 테이블 생성
-- drop sequence seqprod ;
create sequence seqprod start with 1 increment by 1 nocache ;

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '브리오슈', '빵샘', 'brioche_01.png', 100, 1000, 'bread', '프랑스의 전통적인 달콤한 빵으로, 기름과 계란이 많이 들어가서 부드럽고 고소한 맛과 부드러운 식감이 특징입니다.', 10, sysdate );

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '크로와상', '프랑스', 'croissant_01.png', 100, 1000, 'bread', '프랑스의 대표적인 베이커리 중 하나로, 층층이 쌓인 반죽에 버터를 추가하여 구워낸 과자입니다.', 10, sysdate );

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '프렌치 바게트', '프랑스', 'french_baguette_01.png', 100, 1000, 'bread', '프랑스의 대표적인 빵 중 하나로, 길쭉하고 얇은 형태의 식빵입니다. 바삭하면서도 촉촉한 식감과 진한 맛이 특징입니다.', 10, sysdate );

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '치아바타', '프랑스', 'ciabatta_01.png', 100, 1000, 'bread', '빵 자체는 비교적 폭이 넓은 직사각형 모양을 띠며, 바삭하면서도 촉촉하고 부드러운 식감이 특징입니다.', 10, sysdate );


insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '아메리카노', '빵샘', 'americano01.png', 50, 2000, 'beverage', '에스프레소의 쓴 맛과 향을 좋아하는 사람들이 물을 추가해서 즐기는 음료로, 물과 에스프레소의 비율에 따라서 쓴 맛과 진하게 즐길 수 있습니다.', 20, sysdate );

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '카푸치노', '빵샘', 'cappuccino01.png', 50, 2000, 'beverage', '스팀 밀크와 거품을 올린 것을 섞어 만든 이탈리아의 전통적인 커피 음료입니다.', 20, sysdate );	

insert into products(pnum, name, company, image01, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '바닐라라떼', 'latte', 'vanilla_latte_01.png', 30, 3000, 'beverage', '스팀 밀크에 바닐라 시럽을 더해서 만든 커피 음료입니다. 부드러운 스팀밀크와 달콤한 바닐라 시럽이 조화를 이루며, 쓴 커피 향을 중화시켜 부드러운 맛을 느낄 수 있습니다.', 30, sysdate );

-- drop sequence seqoid ;
create sequence seqoid start with 1 increment by 1 nocache ;

-- drop sequence seqodid ;
create sequence seqodid start with 1 increment by 1 nocache ;

-- 주문 데이터 생성
insert into orders(oid, id, orderdate) values(seqoid.nextval, 'kim', sysdate);
select max(oid) from orders ;
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 1, 1, 10);
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 1, 2, 5);
----------------------------------------------------------------------
insert into orders(oid, id, orderdate) values(seqoid.nextval, 'park', sysdate) ;
select max(oid) from orders ;
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 2, 1, 10) ;
insert into orderdetails values(seqodid.nextval, 2, 3, 10) ;
----------------------------------------------------------------------
insert into orders(oid, id, orderdate) values(seqoid.nextval, 'kim', sysdate) ;
select max(oid) from orders ;
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 3, 1, 5) ;
insert into orderdetails values(seqodid.nextval, 3, 4, 20) ;


commit ;

alter table boards add(remark varchar2(255)) ;
alter table orders add(remark varchar2(255)) ;
alter table orderdetails add(remark varchar2(255));

-- 데이터 목록을 확인하도록 합니다.
select * from members ;
select * from boards ;
select * from products ;
select * from orders ;
select * from orderdetails ;
select * from Categories ;

-- end of file