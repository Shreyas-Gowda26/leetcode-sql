select distinct max(salary) as SecondHighestSalary from Employee where salary < (select max(salary) from Employee);

//2nd approach
SELECT IFNULL(
    (
        SELECT salary
        FROM (
            SELECT salary,
                   DENSE_RANK() OVER (ORDER BY salary DESC) AS dr
            FROM Employee
        ) t
        WHERE dr = 2
        LIMIT 1
    ),
    NULL
) AS SecondHighestSalary;
