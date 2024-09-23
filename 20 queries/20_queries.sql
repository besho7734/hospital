-- Q1_retrieve the ssn and first name and salary of doctors whose salary greater than 25000
select ssn , fname
from doctor
where salary>25000;
-- -------------------------------------------------------------------------------------------------
-- Q2_retrieve the ssn and first name of nurse who work in department 4
select t_fname ,n_ssn
from nurse
where department_dno=4;
-- -------------------------------------------------------------------------------------------------
-- Q3_retrieve the ssn and first name of all staff women and her salary greater than 3500
select s_ssn ,s_fname
from staff
where s_sex='F' and s_salary>3500;
-- -------------------------------------------------------------------------------------------------
-- Q4 retrieve ssn and first name of in_place patient whose address cairo and gender is male
select in_ssn ,in_fname
from in_place_patient
where in_address='cairo' and in_sex='M';
-- -------------------------------------------------------------------------------------------------
-- Q5 retrieve ssn and first name of out_place patient whose birth date month=5 and gender is male
select out_ssn ,out_fname
from out_place_patient
where month(out_BDate)='5'and out_sex='M';
-- -------------------------------------------------------------------------------------------------
-- Q6 retrieve the doctors whose assist by nurse
select fname as name_of_doc ,t_fname as name_of_nurse
from nurse ,doctor
where Doctor_ssn=ssn;
-- -------------------------------------------------------------------------------------------------
-- Q7 retrieve the name and ssn of staff who drive ambulance car and his gender female
select s_lname,s_ssn
from staff,ambulance,drives
where staff_s_ssn=s_ssn and ambulance_lic_plate_no=lic_plate_no and s_sex='F';
-- -------------------------------------------------------------------------------------------------
-- Q8 retrieve the ssn and name and department_name and dno of the blood donor which donate to each depatment
select b_ssn,b_fname ,dname,dno
from blood_donor,department
where department_dno=dno ;
-- -------------------------------------------------------------------------------------------------
-- Q9 retrieve name of all doctors who treats out_patient and the name of patients
select fname, out_fname
from doctor ,out_place_patient
where Doctor_ssn=ssn;
-- -------------------------------------------------------------------------------------------------
-- Q10 retrieve the shifts of each doctor and his name 
select fname ,shift_name
from doctor,shift_has_doctor,shift
where Doctor_ssn=ssn and shift_shift_no=shift_no;
-- -------------------------------------------------------------------------------------------------
-- Q11 retrieve the number of doctors in all departments   note=>total number of doctors =20
 select dno ,count(fname)
 from doctor ,department
 where department_dno=dno
 group by dno;
 -- -------------------------------------------------------------------------------------------------
-- Q12 retrieve the name and ssn and salary of doctors whose salalry greater than average
select fname , ssn ,salary
from doctor 
where salary > 
(select avg(salary)
from doctor);
-- -------------------------------------------------------------------------------------------------
-- Q13 retrieve the number of out_patient of all rooms
select count(in_ssn) as no_of_patient ,RNO
from in_place_patient join room on RNO=room_RNO
group by RNO;
-- -------------------------------------------------------------------------------------------------
-- Q14 retrieve the name of nurse who has the min salary 
select t_fname, n_ssn ,t_salary
from nurse
where t_salary=(select min(t_salary)
from nurse);
-- -------------------------------------------------------------------------------------------------
-- Q15 retrieve the no patient in ambulance car 
select count(in_ssn) as no_of_patient ,lic_plate_no
from in_place_patient join ambulance 
on lic_plate_no=ambulance_lic_plate_no
group by lic_plate_no;
-- -------------------------------------------------------------------------------------------------
-- Q16 retrieve the name of doctor and name of nurses who assist him,which salary of doctor is the maximum
select fname, ssn , salary,t_fname
from doctor ,nurse
where salary=(select max(salary)
from doctor) and Doctor_ssn=ssn;
-- -------------------------------------------------------------------------------------------------
-- Q17 retrieve the out_patient doctor and the name of patient and ssn and his bill>=100
select out_fname as name_of_patient , out_ssn , fname as name_of_doctor
from (doctor join out_place_patient 
on Doctor_ssn=ssn)join bill 
on Bill_no=Bill_Bill_no
where total>=100;
-- -------------------------------------------------------------------------------------------------
-- Q18 retrieve the name prescription for the in_patient who has Bill>=6000
select in_fname  , name_medical
from patient_medical_info , in_place_patient
where in_ssn in (select in_ssn
from in_place_patient join bill on Bill_no=Bill_Bill_no
where total>=6000)
and  in_ssn= inplace_patient_in_ssn;
-- -------------------------------------------------------------------------------------------------
-- Q19 retrieve the name of staff who work in shift name mid_day and cleaners
select s_fname 
from staff , staff_has_shift , shift
where shift_no=shift_shift_no
and staff_s_ssn=s_ssn 
and job_title='cleaners' 
and shift_name='mid_day';
-- -------------------------------------------------------------------------------------------------
-- Q20 retrieve The total amount of blood donated in each department
select count(quantity) as total_amount,dname,dno
from blood_donor ,department
where department_dno=dno
group by department_dno;