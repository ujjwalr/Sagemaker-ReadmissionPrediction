create external schema readmissions
from data catalog
database 'readmissions'
iam_role 'arn:aws:iam::068232277654:role/MySpectrumRole'
region 'us-east-1';

select * from svv_external_schemas
select * from SVV_EXTERNAL_TABLES;

select count(*) from readmissions.nonphi;
select count(*) from readmissions.phi;


select distinct "$path", "$size"
from readmissions.nonphi

select distinct "$path", "$size"
from readmissions.phi

select count(*) from heradata
drop table heradata




create table readmissions_aggregate_fact as 
select 
readmission_result,admission_type,discharge_disposition,
sum(time_in_hospital) as total_time_in_hospital,
sum(num_procedures) as total_num_procedures,
sum(num_medications) as total_num_medications,	
sum(number_outpatient) as total_number_outpatient,	
sum(number_emergency) as total_number_emergency,	
sum(number_inpatient) as total_number_inpatient,	
sum(number_diagnoses)	as total_number_diagnoses
from readmissions.nonphi
group by readmission_result,admission_type,discharge_disposition



delete from readmissions_aggregate_fact where readmission_result = ''

select readmission_result, sum(total_num_procedures) from readmissions_aggregate_fact group by readmission_result




select distinct(tablename) from pg_table_def where schemaname = 'public'

drop table heradata




