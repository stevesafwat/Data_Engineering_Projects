SELECT 
    sd.skills, 
    COUNT(jpf.*) AS demand_order,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS skill_frequency
FROM 
    job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd
ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim AS sd
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_work_from_home = 'True' AND jpf.job_title = 'Data Engineer'
GROUP BY sd.skills
HAVING COUNT(jpf.*)>100
ORDER BY skill_frequency DESC
LIMIT 10;

/*
┌────────────┬──────────────┬─────────────────┐
│   skills   │ demand_order │ skill_frequency │
│  varchar   │    int64     │     double      │
├────────────┼──────────────┼─────────────────┤
│ c          │          102 │        169696.0 │
│ jupyter    │          110 │        157500.0 │
│ kubernetes │          865 │        150858.0 │
│ golang     │          108 │        147500.0 │
│ redis      │          119 │        142250.0 │
│ looker     │          385 │        137000.0 │
│ terraform  │          687 │        136645.0 │
│ pyspark    │         1040 │        136000.0 │
│ c++        │          181 │        135000.0 │
│ airflow    │         2539 │        135000.0 │
└────────────┴──────────────┴─────────────────┘
*/