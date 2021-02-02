INSERT_COVID_DATA = """
insert into public.covid_data (report_date, report_year, report_week, cases_weekly, deaths_weekly,
                               countries_and_territories, geo_id, country_territory_code, pop_data_2019,
                               continent_exp, notification_rate)
values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

INSERT_COUNTRIES_DATA = """
insert into public.countries (country, region, population, area, population_density, coastline, net_migration,
                              infant_mortality, gdp, literacy, phones, arable, crops, other, climate, birth_rate,
                              death_rate, agriculture, industry, service)
values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
"""

INSERT_VACCINATION_DATA = """
insert into public.vaccination (location, iso_code, report_date, total_vaccinations, people_vaccinated,
                                people_fully_vaccinated, daily_vaccinations_raw, daily_vaccinations,
                                total_vaccinations_per_hundred, people_vaccinated_per_hundred,
                                people_fully_vaccinated_per_hundred, daily_vaccinations_per_million)
values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)                        
"""

GET_LAST_COVID_REPORT_DATE = """
select cd.report_date
  from public.covid_data cd
order by cd.report_date desc
limit 1
"""

GET_LAST_VACCINATION_REPORT_DATE = """
select v.report_date
  from public.vaccination v
order by v.report_date desc
limit 1
"""