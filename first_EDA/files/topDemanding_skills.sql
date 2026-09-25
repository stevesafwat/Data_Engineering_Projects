SELECT 
    sd.skills, 
    COUNT(jpf.*) AS demand_order
FROM 
    job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd
ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_work_from_home = 'True' AND jpf.job_title = 'Data Engineer'
GROUP BY sd.skills
ORDER BY demand_order DESC
LIMIT 10;

/*
┌────────────┬──────────────┐
│   skills   │ demand_order │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │         7508 │
│ python     │         7249 │
│ aws        │         4182 │
│ azure      │         3535 │
│ spark      │         3393 │
│ airflow    │         2539 │
│ snowflake  │         2198 │
│ java       │         1852 │
│ databricks │         1733 │
│ scala      │         1647 │
└────────────┴──────────────┘
*/

