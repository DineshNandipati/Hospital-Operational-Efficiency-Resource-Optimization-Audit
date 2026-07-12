-- DATE DIFFERENCE

use hospital ;
SELECT  *,
    DATEDIFF(Discharge_Date, Admission_Date) AS date_difference
FROM patient;

-- SHORT , STANDARD , EXTENDED

SELECT
    *,
    DATEDIFF(Discharge_Date, Admission_Date) AS date_difference,
    CASE
        WHEN DATEDIFF(Discharge_Date, Admission_Date) < 3 THEN 'Short'
        WHEN DATEDIFF(Discharge_Date, Admission_Date) BETWEEN 3 AND 7 THEN 'Standard'
        ELSE 'Extended'
    END AS LOS_Cohort
FROM patient;

SELECT
    Patient_ID,
    Admission_Date,
    Discharge_Date,
    DATEDIFF(Discharge_Date, Admission_Date) AS LOS
FROM patient
WHERE DATEDIFF(Discharge_Date, Admission_Date) <= 0;

--
SELECT COUNT(*) AS Invalid_LOS
FROM patient
WHERE DATEDIFF(Discharge_Date, Admission_Date) <= 0;