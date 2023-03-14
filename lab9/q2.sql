set serveroutput on 
DECLARE 
inrow student % ROWTYPE; 
cursor c is (select * from student orderby tot_cred asc);
BEGIN
    for bk in c LOOP
    
