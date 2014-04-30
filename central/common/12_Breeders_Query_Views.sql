drop view if exists trial_study_locations;

CREATE VIEW `trial_study_locations` AS 
select distinct `gp`.`nd_geolocation_id` AS `envtId`,`l`.`lname` AS `locationName`,
	`prov`.`lname` AS `provinceName`,`c`.`isoabbr` AS `isoabbr`,`p`.`project_id` AS `project_id`,
	`p`.`name` AS `name`,`gp`.`value` AS `locationId`,`p`.`description` AS `description` 
	from (((((((`nd_geolocationprop` `gp` 
		join `nd_experiment` `e` 
		on(((`e`.`nd_geolocation_id` = `gp`.`nd_geolocation_id`) and 
			(`e`.`nd_experiment_id` = (
				select min(`min`.`nd_experiment_id`) from `nd_experiment` `min` 
				where (`min`.`nd_geolocation_id` = `gp`.`nd_geolocation_id`)))))) 
	join `nd_experiment_project` `ep` on((`ep`.`nd_experiment_id` = `e`.`nd_experiment_id`))) 
	join `project_relationship` `pr` on((((`pr`.`object_project_id` = `ep`.`project_id`) 
		or (`pr`.`subject_project_id` = `ep`.`project_id`)) and (`pr`.`type_id` = 1150)))) 
	join `project` `p` on((`p`.`project_id` = `pr`.`object_project_id`))) 
	left join `location` `l` on((`l`.`locid` = `gp`.`value`))) 
	left join `location` `prov` on((`prov`.`locid` = `l`.`snl1id`))) 
	left join `cntry` `c` on((`c`.`cntryid` = `l`.`cntryid`))) 
	where (`gp`.`type_id` = 8190);

drop view if exists germplasm_trial_details;

CREATE VIEW `germplasm_trial_details` AS
    select 
        `pr`.`object_project_id` AS `study_id`,
        `ep`.`project_id` AS `project_id`,
        `e`.`type_id` AS `type_id`,
        `e`.`nd_geolocation_id` AS `envt_id`,
        `e`.`type_id` AS `observation_type`,
        `e`.`nd_experiment_id` AS `experiment_id`,
        `p`.`phenotype_id` AS `phenotype_id`,
        `td`.`trait_name` AS `trait_name`,
        `svd`.`cvterm_id` AS `stdvar_id`,
        `svd`.`stdvar_name` AS `stdvar_name`,
        `p`.`value` AS `observed_value`,
        `s`.`stock_id` AS `stock_id`,
        `s`.`name` AS `entry_designation`,
        `g`.`gid` AS `gid`
    from
        (((((((((`stock` `s`
        join `nd_experiment_stock` `es` ON ((`es`.`stock_id` = `s`.`stock_id`)))
        join `nd_experiment` `e` ON ((`e`.`nd_experiment_id` = `es`.`nd_experiment_id`)))
        join `nd_experiment_project` `ep` ON ((`ep`.`nd_experiment_id` = `e`.`nd_experiment_id`)))
        join `nd_experiment_phenotype` `epx` ON ((`epx`.`nd_experiment_id` = `e`.`nd_experiment_id`)))
        join `phenotype` `p` ON ((`p`.`phenotype_id` = `epx`.`phenotype_id`)))
        join `standard_variable_details` `svd` ON ((`svd`.`cvterm_id` = `p`.`observable_id`)))
        join `trait_details` `td` ON ((`td`.`trait_id` = `svd`.`property_id`)))
        join `project_relationship` `pr` ON ((`pr`.`subject_project_id` = `ep`.`project_id`)))
        join `germplsm` `g` ON ((`s`.`dbxref_id` = `g`.`gid`)))
    where
        ((`e`.`type_id` = 1170)
            or ((`e`.`type_id` = 1155)
            and (1 = (select 
                count(0)
            from
                `project_relationship`
            where
                ((`project_relationship`.`object_project_id` = `pr`.`object_project_id`)
                    and (`project_relationship`.`type_id` = 1150))))))
    order by `ep`.`project_id` , `e`.`nd_geolocation_id` , `e`.`type_id` , `td`.`trait_name` , `s`.`name`;