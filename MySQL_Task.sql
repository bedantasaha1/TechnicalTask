
--Creating the tables:

--Table 1: tbl_user:

CREATE TABLE tbl_user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id int NOT NULL,
    user_full_name varchar(50) NOT NULL
);


--Inserting some sample rows into tbl_user:

INSERT INTO tbl_user (user_id,User_full_name) 
VALUES(100, "David Roy"),
(101, "Harry Singh"),
(102, "John Dylan"),
(103, "Bob Lenon"),
(104, "Victor Trump"),
(105, "Donald Hugo"),
(106, "Narendra Gandhi"),
(107, "Rahul Modi");

--Table 2: tbl_role:

CREATE TABLE tbl_role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_id INT NOT NULL,
    rolel_name varchar(50) NOT NULL
);

--Inserting some sample rows into tbl_role:

INSERT INTO tbl_role (role_id,role_name)
VALUES(1000, "IT"),
(1001, "HR"),
(1002, "Other");

--Table 3: tbl_user_role:

CREATE TABLE tbl_user_role (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    role_id INT
    );
--Inserting some sample rows into tbl_user_role:

INSERT INTO tbl_user_role (user_id, role_id)
VALUES(100,1001),
(100,1002 ),
(101,1000),
(101,1001),
(102,1000),
(103,1001),
(104, 1002),
(105,1000),
(106, 1000),
(107,NULL);


--Query to find out the user that belong to the role_name 'IT':
select tbl_user.user_full_name from tbl_user left join tbl_user_role on tbl_user.user_id=tbl_user_role.user_id left join tbl_role on tbl_role.role_id=tbl_user_role.role_id where tbl_role.role_name='IT';

--Query to find out the list of the users with no role:
select tbl_user.user_full_name from tbl_user left join tbl_user_role on tbl_user.user_id=tbl_user_role.user_id left join tbl_role on tbl_role.role_id=tbl_user_role.role_id where isnull(tbl_role.role_name);

--Query to find out the users with duplicate roles:
select tbl_user.user_full_name from tbl_user left join tbl_user_role on tbl_user.user_id=tbl_user_role.user_id left join tbl_role on tbl_role.role_id=tbl_user_role.role_id group by tbl_user_role.user_id having count(tbl_user_role.user_id)>1;





