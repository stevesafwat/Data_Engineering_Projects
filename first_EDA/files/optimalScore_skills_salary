SELECT 
    sd.skills, 
    LN(COUNT(jpf.*)) AS demand_order,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    ROUND(MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)) / 1000000, 2) AS optimal_score
FROM 
    job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd
    ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_work_from_home = 'True'
    AND jpf.job_title = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING
     COUNT(jpf.*)>100
ORDER BY 
    optimal_score DESC
LIMIT 25;

/*
┌─────────┬───────────────────┬───────────────┬───────────────┐
│ skills  │   demand_order    │ median_salary │ optimal_score │
│ varchar │      double       │    double     │    double     │
├─────────┼───────────────────┼───────────────┼───────────────┤
│ python  │ 5.645446897643238 │      122500.0 │          0.69 │
│ sql     │ 5.777652323222656 │      120000.0 │          0.69 │
│ aws     │ 5.267858159063328 │      122500.0 │          0.65 │
│ spark   │ 4.762173934797756 │      125000.0 │           0.6 │
│ azure   │ 4.820281565605037 │      120000.0 │          0.58 │
└─────────┴───────────────────┴───────────────┴───────────────┘
/*