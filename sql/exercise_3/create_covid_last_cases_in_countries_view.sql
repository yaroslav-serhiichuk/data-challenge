create or replace view public.covid_last_cases_in_countries as (
    select cd.cases_weekly
         , cd.notification_rate
         , cd.report_date
         , coalesce(c.country, cd.countries_and_territories) as country
         , c.region
         , c.population
         , c.area
         , c.population_density
         , c.coastline
         , c.net_migration
         , c.infant_mortality
         , c.gdp
         , c.literacy
         , c.phones
         , c.arable
         , c.crops
         , c.other
         , c.climate
         , c.birth_rate
         , c.death_rate
         , c.agriculture
         , c.industry
         , c.service
         , v.total_vaccinations
         , v.people_vaccinated
      from public.covid_data cd
           join public.countries_mapping_table mp
                on cd.countries_and_territories = mp.covid_data_name
           join (select max(cd_1.report_date) as report_date
                      , cd_1.countries_and_territories
                   from public.covid_data cd_1
                  group by cd_1.countries_and_territories
                ) lc
                on cd.report_date = lc.report_date
                   and cd.countries_and_territories = lc.countries_and_territories
           left join public.countries c
                on c.country = mp.countries_data_name
           left join public.vaccination v
                on mp.alfa_3_code = v.iso_code
                   and cd.report_date = v.report_date
  order by c.country
         , cd.countries_and_territories
);