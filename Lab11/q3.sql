CREATE or REPLACE TRIGGER Inst_trig
BEFORE INSERT or UPDATE on Instructor
FOR EACH ROW 
DECLARE
bud number(10);
BEGIN
Select budget into bud from department where dept_name=:new.dept_name;
IF :new.name like '%0%' or :new.name like '%1%' or :new.name like '%2%' or :new.name like '%3%' or :new.name like '%4%'
or :new.name like '%5%' or :new.name like '%6%' or :new.name like '%7%' or :new.name like '%8%' or :new.name like '%9%' then
RAISE_APPLICATION_ERROR(-20000,'Insert is denied');
END IF;
IF :new.salary<=0 or :new.salary>bud then
RAISE_APPLICATION_ERROR(-20000,'Insert is denied');
END IF;
IF :new.salary>=bud then
RAISE_APPLICATION_ERROR(-20000,'Insert is denied');
END IF;
END;
/


insert into instructor values ('12001', 'Ayush','Finance',50000);
insert into instructor values ('12001', 'A0yush','Finance',50000);