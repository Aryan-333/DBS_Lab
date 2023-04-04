create table Old_Data_Instructor (
    ID varchar(5),
    name varchar(20),
    dept_name varchar(20),
    salary number(8,2),
    primary key (ID,name)
);

CREATE or REPLACE trigger  Old_Data_Instructor
AFTER UPDATE of salary on instructor 
FOR EACH ROW 
BEGIN 
 insert into Old_Data_Instructor values
            (
                :OLD.id,
                :OLD.name,
                :OLD.dept_name,
                :OLD.salary
            );
END;
/

update instructor set salary = 92000 where name = 'Wu' ;
select * from old_data_instructor;

update instructor set dept_name = 'Biology' where name = 'Wu' ;
