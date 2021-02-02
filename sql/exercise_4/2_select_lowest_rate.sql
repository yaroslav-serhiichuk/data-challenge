select coalesce(c.country, cd.countries_and_territories) as country
     , cd.notification_rate
  from public.covid_data cd
       join public.countries_mapping_table mp
            on cd.countries_and_territories = mp.covid_data_name
       left join public.countries c
            on c.country = mp.countries_data_name
 where cd.report_date = '2020-08-03'
       and cd.notification_rate > 0
 order by cd.notification_rate
 limit 10;
