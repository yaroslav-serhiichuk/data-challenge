select c.country
     , c.population
     , v.total_vaccinations
     , cast(cast(1 as decimal(5,2)) * v.total_vaccinations * 100 / c.population as decimal(5,2)) as percentage
     , c.gdp
     , lv.report_date
  from public.countries c
       join public.countries_mapping_table mp
            on c.country = mp.countries_data_name
       join public.vaccination v
            on mp.alfa_3_code = v.iso_code
       join (select max(v1.report_date) as report_date
                      , v1."location"
                   from public.vaccination v1
                  group by v1."location"
            ) lv
            on v."location" = lv."location"
               and v.report_date = lv.report_date
order by v.total_vaccinations desc
limit 10
