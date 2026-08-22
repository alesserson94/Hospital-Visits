select 
p.patient_id,p.date_of_birth as dob,
TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age,p.gender,
p.blood_type,p.state,
p.insurance_provider as provider,
p.chronic_condition_flag as condition_flag,admission_date,
round(length_of_stay_days,0) as stay_length_days,
admission_type,department,diagnosis_code,diagnosis_description,
attending_physician,room_type,discharge_status,
total_charge_usd as total_charge,
case
when readmission_within_30_days = 'No'
then 'N'
else 'Y'
end as readmitted
from hospital_stays_cleaned h
join patients_cleaned p 
on p.patient_id=h.patient_id