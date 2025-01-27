create view <?= DB_SCHEMA ?>.reporting_ages as with recursive sequence as (
	select 2017 as level
	union all
	select level + 1 as value from sequence where sequence.level < year(curdate()) + 10
)
select level as _id from sequence;

