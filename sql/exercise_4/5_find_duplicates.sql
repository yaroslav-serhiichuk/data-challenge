-- Covid data duplicate records
select c.country
     , c.region
     , c.population
     , c.area
     , c.population_density
     , c.coastline
     , c.net_migration
     , c.infant_mortality
     , c.gdp, literacy
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
     , count(*)
  from public.countries c
 group by c.country
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
   having count(*) > 1;

-- Countries data duplicate records
select country
     , region
     , population
     , area
     , population_density
     , coastline
     , net_migration
     , infant_mortality
     , gdp
     , literacy
     , phones
     , arable
     , crops
     , other
     , climate
     , birth_rate
     , death_rate
     , agriculture
     , industry
     , service
     , count(*)
  from public.countries c
 group by country
        , region
        , population
        , area
        , population_density
        , coastline
        , net_migration
        , infant_mortality
        , gdp
        , literacy
        , phones
        , arable
        , crops
        , other
        , climate
        , birth_rate
        , death_rate
        , agriculture
        , industry
        , service
   having count(*) > 1;
