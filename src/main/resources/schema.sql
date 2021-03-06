create schema simple ;

create table  simple.tbl_product_identity_id (
    id BIGINT auto_increment ,
    name varchar(100)
);


create table  simple.tbl_product_sequence_id (
    id BIGINT  ,
    name varchar(100)
);


create table  simple.tbl_person_sequence_id (
    id BIGINT  ,
    name varchar(100)
);

CREATE SEQUENCE product_sequence
  START WITH 1
  INCREMENT BY 100
  MINVALUE 1;

CREATE SEQUENCE person_sequence
  START WITH 1
  INCREMENT BY 100
  MINVALUE 1;


CREATE SEQUENCE hibernate_sequence
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1;


create schema embedded ;

create table embedded.tbl_company (
    id BIGINT auto_increment ,
    name varchar(100) ,
    street varchar(100),
    city  varchar(100),
    state  varchar(100),
    zip_code varchar(100)
);


create table embedded.tbl_customer (
    id BIGINT auto_increment ,
    name varchar(100),
    street varchar(100),
    city  varchar(100),
    state_name  varchar(100),
    zipcode varchar(100)

);


create schema onetoone ;

create table onetoone.tbl_capital
(
    id BIGINT auto_increment ,
    name varchar(100)

);


create table onetoone.tbl_country
(
    id BIGINT auto_increment ,
    name varchar(100) ,
    capital_id BIGINT,
    foreign key (capital_id) references  tbl_capital(id)

);

create table onetoone.tbl_person (
    id BIGINT auto_increment ,
    name varchar(100)
);

create table onetoone.tbl_finger_print (
    id BIGINT auto_increment ,
    data varchar(100) ,
    person_id BIGINT ,
    foreign key ( person_id) references tbl_person(id)

);

create schema onetomany ;


create table onetomany.tbl_person (
    id BIGINT auto_increment ,
    name varchar(100)

);


create table onetomany.tbl_phone (
    id BIGINT auto_increment ,
    number varchar(100) ,
    type varchar(100),
    person_id bigint ,
    foreign key ( person_id) references tbl_person(id)

);


create table onetomany.tbl_country (
    id BIGINT auto_increment ,
    name varchar(100)

);

create table onetomany.tbl_state (
    id BIGINT auto_increment ,
    name varchar(100),
    country_id BIGINT

);


create schema manytomany ;


create table manytomany.tbl_author (
    id BIGINT auto_increment ,
    name varchar(100)
);

create table manytomany.tbl_book (
    id BIGINT auto_increment ,
    title varchar(100),
    isbn varchar(100),
    publish_date  date
);

create table manytomany.tbl_author_book (
    author_id BIGINT ,
    book_id BIGINT ,
    foreign key (author_id) references tbl_author(id),
    foreign key (book_id) references tbl_book(id)

);


create table manytomany.tbl_student (
    id BIGINT auto_increment,
    name varchar(100)

);


create table manytomany.tbl_course (
    id BIGINT auto_increment,
    name varchar(100),
    deadline date
);


create table manytomany.tbl_course_registration (
    id BIGINT auto_increment ,

    student_id BIGINT ,
    course_id  BIGINT ,
    registration_date date
);


create schema dto ;


create table dto.tbl_person (
    id BIGINT  auto_increment,
    first_name varchar(100),
    last_name varchar(100)
);


create schema inheritance_join ;

create table inheritance_join.tbl_shape (
    id BIGINT auto_increment ,
    color varchar(100)

);

create table inheritance_join.tbl_circle (
    shape_id BIGINT ,
    radius int ,
    foreign key (shape_id) references tbl_shape(id)
);


create table inheritance_join.tbl_rectangle (
    shape_id BIGINT ,
    width int ,
    height int ,
    foreign key (shape_id) references tbl_shape(id)
);


create schema inheritance_singletable ;

create table inheritance_singletable.tbl_shape
(

    id BIGINT auto_increment ,
    type varchar(100),
    color varchar(100),
    radius int ,
    width int ,
    height int

);


create schema inheritance_tableperclass ;

create table inheritance_tableperclass.tbl_circle (

    id BIGINT auto_increment ,
    color varchar(100) ,
    radius int
);


create table inheritance_tableperclass.tbl_rectangle (
    id BIGINT auto_increment ,
    color varchar(100) ,
    width int ,
    height int
);



create schema elementcollection ;

create table elementcollection.tbl_user (
    id BIGINT auto_increment ,
    name varchar(100)
);


create table elementcollection.tbl_address (
    id BIGINT auto_increment ,
    user_id BIGINT ,
    house_number varchar(100),
    street varchar(100),
    city varchar(100),
    state varchar(100),
    zip_code varchar(10)

);

create table elementcollection.tbl_phone (
    id BIGINT auto_increment ,
    user_id BIGINT ,

    type varchar(100),
    number varchar(100)
);


insert into elementcollection.tbl_user ( name ) values ('John');
insert into elementcollection.tbl_user ( name ) values ('Peter');

set @ID = ( select id from elementcollection.tbl_user where name = 'John');

insert into elementcollection.tbl_address( user_id , house_number , street , city , state ,zip_code)
values ( @ID , '7' , 'Second Street' , 'Stamford' , 'CT' , '06905');

insert into elementcollection.tbl_phone ( user_id ,  type , number)
values ( @ID , 'MOBILE' , '201-132-7505');

insert into elementcollection.tbl_phone ( user_id ,  type , number)
values ( @ID , 'OFFICE' , '201-323-1805');
