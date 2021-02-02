select c.country
     , c.region
     , c.population_density
     , cast(cast(1 as decimal(8,3)) * cd.cases_weekly * 1000000 / cd.pop_data_2019 as decimal(8,3)) as cases_per_million
  from public.covid_data cd
       join countries_mapping_table mp
            on cd.countries_and_territories = mp.covid_data_name
       join public.countries c
            on c.country = mp.countries_data_name
 where cd.report_date = '2020-08-03';
