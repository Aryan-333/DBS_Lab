CREATE table client(
c_no varchar(5) primary key,
name varchar(20),
address varchar(100),
bal_due number);

insert into client values ('01', 'Ayush','Kolkata',10000);
insert into client values ('02', 'Dipesh','Delhi',20000);
insert into client values ('03', 'Rishav','Jaipur',30000);

create table audit_client(
c_no varchar(5),
name varchar(20),
bal_due number,
op varchar(3),
user_id varchar(5) default('00000'),
opDate date);

create or replace trigger client_audit
BEFORE UPDATE or INSERT on client
FOR EACH ROW
begin

case
WHEN UPDATING THEN
insert into audit_client values (:OLD.c_no,:OLD.name,:OLD.bal_due,'upd',NULL,sysdate);

WHEN DELETING THEN
insert into audit_client values (:OLD.c_no,:OLD.name,:OLD.bal_due,'del',NULL,sysdate);

end case;
end;
/


update client set name = 'a' where name = 'Ayush' ;
select * from audit_client;