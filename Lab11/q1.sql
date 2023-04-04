create table log_change_Takes (
    toc timestamp,
    type varchar(3),
    ID varchar(5),
    course_id varchar(8),
    sec_id varchar(8),
    semester varchar(6),
    year numeric(4, 0),
    grade varchar(2),
    primary key (toc, ID, course_id, sec_id, semester, year),
    foreign key (course_id, sec_id, semester, year) references section on delete cascade,
    foreign key (ID) references student on delete cascade
);

CREATE or REPLACE trigger log_change_Takes 
BEFORE INSERT OR UPDATE OR DELETE on takes 
FOR EACH ROW 
BEGIN CASE
        WHEN INSERTING THEN
        insert into log_change_Takes values
            (
                current_timestamp,
                'ins',
                :NEW.id,
                :NEW.course_id,
                :NEW.sec_id,
                :NEW.semester,
                :NEW.year,
                :NEW.grade
            );

        WHEN DELETING THEN
        insert into log_change_Takes values
            (
                current_timestamp,
                'del',
                :OLD.id,
                :OLD.course_id,
                :OLD.sec_id,
                :OLD.semester,
                :OLD.year,
                :OLD.grade
            );

        WHEN UPDATING THEN
        insert into log_change_Takes values
            (
                current_timestamp,
                'upd',
                :NEW.id,
                :NEW.course_id,
                :NEW.sec_id,
                :NEW.semester,
                :NEW.year,
                :NEW.grade
            );

END CASE;
END;
/

delete from takes where id = '00128' and course_id = 'CS-101';
insert into takes values('00128', 'CS-101', '1', 'Fall', '2009', 'A');
update takes set grade = 'B' where id = '98988' and course_id = 'BIO-301';
select * from log_change_Takes;