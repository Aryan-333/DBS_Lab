create view Advisor_Student as select s.name s_name, a.S_ID, a.I_ID, i.name i_name from student s, advisor a, instructor i 
where a.S_ID = s.ID and a.I_ID = i.ID;

create or replace trigger advisor_trigger
instead of delete on Advisor_Student
for each row
begin
delete from advisor where advisor.S_ID = :old.S_ID;
end;
/


delete from Advisor_Student where S_ID = '98988';
