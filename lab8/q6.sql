set serveroutput on 
BEGIN
DBMS_OUTPUT.PUT_LINE ('lower_bound < upper_bound');
FOR i IN 1..5 LOOP

SELECT GPA
INTO s1_gpa
FROM StudentTable
WHERE RollNo=s1_roll;


END LOOP;
DBMS_OUTPUT.PUT_LINE ('lower_bound = upper_bound');
FOR i IN 2..2 LOOP
DBMS_OUTPUT.PUT_LINE (i);
END LOOP;
DBMS_OUTPUT.PUT_LINE ('lower_bound > upper_bound');
FOR i IN 3..1 LOOP
DBMS_OUTPUT.PUT_LINE (i);
END LOOP;
END;
/
