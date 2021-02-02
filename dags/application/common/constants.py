UTF_8 = 'utf-8'

# Data endpoints
COVID_DATA_API_ENDPOINT = 'https://opendata.ecdc.europa.eu/covid19/casedistribution/json/'
COUNTRIES_CSV_URL = 'https://storage.googleapis.com/kagglesdsdata/datasets/23752/30346/countries%20of%20the%20world.csv?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20210128%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20210128T222725Z&X-Goog-Expires=259199&X-Goog-SignedHeaders=host&X-Goog-Signature=8cf0b48fcaa1ceb8730e0bd487e3260992c164f42ae80f78049a39da296d7a7e70f4374ad35d85bdb719989f178e1ad1d36728bd999cf0b8eb462cd7960def13fd0803e7e2bea6c1a557d48492242896869fb11b75b8683342302a265ac2f1aa11c12cb473664ae3243a862507a7aabe2446a921cad1158c13d60a0db8e2c8a26671ad64db18778f2e6c6ba5409ec61a2acefebf0db40622f9e6868c9397e9d5d960eeee1fa5bef49005b179b7d4c8edb2c02db19ed3d37200312d810feb9486f4c545a9b4f6e1fb04cae8f5bb850352d86afeb3d91854c82400febca1cfe44984e78a48b30bda102378fdd0869a2b9da5e1c3552ab0c68fae1074041adf8439'
VACCINATION_CSV_URL = 'https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/vaccinations/vaccinations.csv'

# Headers
COUNTRIES_CSV_HEADER = ['country', 'region', 'population', 'area', 'population_density', 'coastline', 'net_migration',
                        'infant_mortality', 'gdp', 'literacy', 'phones', 'arable', 'crops', 'other', 'climate',
                        'birth_rate', 'death_rate', 'agriculture', 'industry', 'service']

VACCINATION_CSV_HEADER = ['location', 'iso_code', 'report_date', 'total_vaccinations', 'people_vaccinated',
                          'people_fully_vaccinated', 'daily_vaccinations_raw', 'daily_vaccinations',
                          'total_vaccinations_per_hundred', 'people_vaccinated_per_hundred',
                          'people_fully_vaccinated_per_hundred', 'daily_vaccinations_per_million']
