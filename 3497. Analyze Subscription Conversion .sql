/* Write your T-SQL query statement below */
with  cte_AVG_free_trial as (
select    user_id ,  round(avg(activity_duration*1.0),2) as trial_avg_duration
from   UserActivity
where  activity_type ='free_trial'
group by user_id
)  ,  cte_AVG_paid as (
select    user_id ,  round(avg(activity_duration*1.0),2) as paid_avg_duration 
from   UserActivity
where  activity_type ='paid'
group by user_id
)
select x.user_id  , trial_avg_duration , paid_avg_duration 
from  cte_AVG_free_trial x  inner  join  cte_AVG_paid y  on (x.user_id = y.user_id)