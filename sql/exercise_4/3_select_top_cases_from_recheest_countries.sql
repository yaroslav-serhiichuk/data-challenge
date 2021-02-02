select c.country
     , c.gdp
     , max(cd.cases_weekly)
  from public.covid_data cd
       join countries_mapping_table mp
            on cd.countries_and_territories = mp.covid_data_name
       join (select c2.country
                  , c2.gdp
               from public.countries c2
              where c2.gdp is not null
              order by c2.gdp desc
              limit 20
            ) c
            on c.country = mp.countries_data_name
 group by c.country
        , c.gdp
 order by c.gdp desc
 limit 10;
