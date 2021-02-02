create table if not exists public.covid_data (
      report_date date
    , report_year int
    , report_week int
    , cases_weekly int
    , deaths_weekly int
    , countries_and_territories varchar(50)
    , geo_id varchar(8)
    , country_territory_code varchar(7)
    , pop_data_2019 int
    , continent_exp varchar(15)
    , notification_rate decimal(6,2)
);

create table if not exists public.countries (
      country varchar(50)
    , region varchar(50)
    , population bigint
    , area int
    , population_density decimal(6,1)
    , coastline decimal(5,2)
    , net_migration decimal(5,2)
    , infant_mortality decimal(5,2)
    , gdp int
    , literacy decimal(5,2)
    , phones decimal(5,1)
    , arable decimal(5,2)
    , crops decimal(5,2)
    , other decimal(5,2)
    , climate decimal(5,2)
    , birth_rate decimal(5,2)
    , death_rate decimal(5,2)
    , agriculture decimal(5,3)
    , industry decimal(5,3)
    , service decimal(5,3)
);

create table if not exists public.vaccination (
      location varchar(50)
    , iso_code varchar(8)
    , report_date date
    , total_vaccinations int
    , people_vaccinated int
    , people_fully_vaccinated int
    , daily_vaccinations_raw int
    , daily_vaccinations int
    , total_vaccinations_per_hundred decimal(5,2)
    , people_vaccinated_per_hundred decimal(5,2)
    , people_fully_vaccinated_per_hundred decimal(5,2)
    , daily_vaccinations_per_million decimal(9,2)
);

create table public.countries_mapping_table (
      countries_data_name varchar(50)
    , covid_data_name varchar(50)
    , canonical_name varchar(60)
    , alfa_2_code varchar(2)
    , alfa_3_code varchar(3)
    , digital_code int
);

insert into public.countries_mapping_table (countries_data_name, covid_data_name, canonical_name,
                                            alfa_2_code, alfa_3_code, digital_code)
values ('Afghanistan', 'Afghanistan', 'Afghanistan', 'AF', 'AFG', 4),
       ('Albania', 'Albania', 'Albania', 'AL', 'ALB', 8),
       ('Algeria', 'Algeria', 'Algeria', 'DZ', 'DZA', 12),
       ('American Samoa', null, 'American Samoa', 'AS', 'ASM', 16),
       ('Andorra', 'Andorra', 'Andorra', 'AD', 'AND', 20),
       ('Angola', 'Angola', 'Angola', 'AO', 'AGO', 24),
       ('Anguilla', 'Anguilla', 'Anguilla', 'AI', 'AIA', 660),
       (null, null, 'Antarctica', 'AQ', 'ATA', 10),
       ('Antigua & Barbuda', 'Antigua_and_Barbuda', 'Antigua and Barbuda', 'AG', 'ATG', 28),
       ('Argentina', 'Argentina', 'Argentina', 'AR', 'ARG', 32),
       ('Armenia', 'Armenia', 'Armenia', 'AM', 'ARM', 51),
       ('Aruba', 'Aruba', 'Aruba', 'AW', 'ABW', 533),
       ('Australia', 'Australia', 'Australia', 'AU', 'AUS', 36),
       ('Austria', 'Austria', 'Austria', 'AT', 'AUT', 40),
       ('Azerbaijan', 'Azerbaijan', 'Azerbaijan', 'AZ', 'AZE', 31),
       ('Bahamas, The', 'Bahamas', 'Bahamas (the)', 'BS', 'BHS', 44),
       ('Bahrain', 'Bahrain', 'Bahrain', 'BH', 'BHR', 48),
       ('Bangladesh', 'Bangladesh', 'Bangladesh', 'BD', 'BGD', 50),
       ('Barbados', 'Barbados', 'Barbados', 'BB', 'BRB', 52),
       ('Belarus', 'Belarus', 'Belarus', 'BY', 'BLR', 112),
       ('Belgium', 'Belgium', 'Belgium', 'BE', 'BEL', 56),
       ('Belize', 'Belize', 'Belize', 'BZ', 'BLZ', 84),
       ('Benin', 'Benin', 'Benin', 'BJ', 'BEN', 204),
       ('Bermuda', 'Bermuda', 'Bermuda', 'BM', 'BMU', 60),
       ('Bhutan', 'Bhutan', 'Bhutan', 'BT', 'BTN', 64),
       ('Bolivia', 'Bolivia', 'Bolivia (Plurinational State of)', 'BO', 'BOL', 68),
       (null, 'Bonaire, Saint Eustatius and Saba', 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535),
       ('Bosnia & Herzegovina', 'Bosnia_and_Herzegovina', 'Bosnia and Herzegovina', 'BA', 'BIH', 70),
       ('Botswana', 'Botswana', 'Botswana', 'BW', 'BWA', 72),
       (null, null, 'Bouvet Island', 'BV', 'BVT', 74),
       ('Brazil', 'Brazil', 'Brazil', 'BR', 'BRA', 76),
       (null, null, 'British Indian Ocean Territory (the)', 'IO', 'IOT', 86),
       ('British Virgin Is.', 'British_Virgin_Islands', 'Virgin Islands (British)', 'VG', 'VGB', 92),
       ('Brunei', 'Brunei_Darussalam', 'Brunei Darussalam', 'BN', 'BRN', 96),
       ('Bulgaria', 'Bulgaria', 'Bulgaria', 'BG', 'BGR', 100),
       ('Burkina Faso', 'Burkina_Faso', 'Burkina Faso', 'BF', 'BFA', 854),
       ('Burma', 'Myanmar', 'Myanmar', 'MM', 'MMR', 104),
       ('Burundi', 'Burundi', 'Burundi', 'BI', 'BDI', 108),
       ('Cambodia', 'Cambodia', 'Cambodia', 'KH', 'KHM', 116),
       ('Cameroon', 'Cameroon', 'Cameroon', 'CM', 'CMR', 120),
       ('Canada', 'Canada', 'Canada', 'CA', 'CAN', 124),
       ('Cape Verde', 'Cape_Verde', 'Cabo Verde', 'CV', 'CPV', 132),
       (null, 'Cases_on_an_international_conveyance_Japan', null, null, null, null),
       ('Cayman Islands', 'Cayman_Islands', 'Cayman Islands (the)', 'KY', 'CYM', 136),
       ('Central African Rep.', 'Central_African_Republic', 'Central African Republic (the)', 'CF', 'CAF', 140),
       ('Chad', 'Chad', 'Chad', 'TD', 'TCD', 148),
       ('Chile', 'Chile', 'Chile', 'CL', 'CHL', 152),
       ('China', 'China', 'China', 'CN', 'CHN', 156),
       (null, null, 'Christmas Island', 'CX', 'CXR', 162),
       (null, null, 'Cocos (Keeling) Islands (the)', 'CC', 'CCK', 166),
       ('Colombia', 'Colombia', 'Colombia', 'CO', 'COL', 170),
       ('Comoros', 'Comoros', 'Comoros (the)', 'KM', 'COM', 174),
       ('Congo, Repub. of the', 'Congo', 'Congo (the)', 'CG', 'COG', 178),
       ('Congo, Dem. Rep.', 'Democratic_Republic_of_the_Congo', 'Congo (the Democratic Republic of the)', 'CD', 'COD', 180),
       ('Cook Islands', null, 'Cook Islands (the)', 'CK', 'COK', 184),
       ('Costa Rica', 'Costa_Rica', 'Costa Rica', 'CR', 'CRI', 188),
       ('Cote dnullIvoire', 'Cote_dIvoire', 'Côte dnullIvoire', 'CI', 'CIV', 384),
       ('Croatia', 'Croatia', 'Croatia', 'HR', 'HRV', 191),
       ('Cuba', 'Cuba', 'Cuba', 'CU', 'CUB', 192),
       (null, 'Curaçao', 'Curaçao', 'CW', 'CUW', 531),
       ('Cyprus', 'Cyprus', 'Cyprus', 'CY', 'CYP', 196),
       ('Czech Republic', 'Czechia', 'Czechia', 'CZ', 'CZE', 203),
       ('Denmark', 'Denmark', 'Denmark', 'DK', 'DNK', 208),
       ('Djibouti', 'Djibouti', 'Djibouti', 'DJ', 'DJI', 262),
       ('Dominica', 'Dominica', 'Dominica', 'DM', 'DMA', 212),
       ('Dominican Republic', 'Dominican_Republic', 'Dominican Republic (the)', 'DO', 'DOM', 214),
       ('East Timor', 'Timor_Leste', 'Timor-Leste', 'TL', 'TLS', 626),
       ('Ecuador', 'Ecuador', 'Ecuador', 'EC', 'ECU', 218),
       ('Egypt', 'Egypt', 'Egypt', 'EG', 'EGY', 818),
       ('El Salvador', 'El_Salvador', 'El Salvador', 'SV', 'SLV', 222),
       ('Equatorial Guinea', 'Equatorial_Guinea', 'Equatorial Guinea', 'GQ', 'GNQ', 226),
       ('Eritrea', 'Eritrea', 'Eritrea', 'ER', 'ERI', 232),
       ('Estonia', 'Estonia', 'Estonia', 'EE', 'EST', 233),
       ('Swaziland', 'Eswatini', 'Eswatini', 'SZ', 'SWZ', 748),
       ('Ethiopia', 'Ethiopia', 'Ethiopia', 'ET', 'ETH', 231),
       (null, 'Falkland_Islands_(Malvinas)', 'Falkland Islands (the) [Malvinas]', 'FK', 'FLK', 238),
       ('Faroe Islands', 'Faroe_Islands', 'Faroe Islands (the)', 'FO', 'FRO', 234),
       ('Fiji', 'Fiji', 'Fiji', 'FJ', 'FJI', 242),
       ('Finland', 'Finland', 'Finland', 'FI', 'FIN', 246),
       ('France', 'France', 'France', 'FR', 'FRA', 250),
       ('French Guiana', null, 'French Guiana', 'GF', 'GUF', 254),
       ('French Polynesia', 'French_Polynesia', 'French Polynesia', 'PF', 'PYF', 258),
       (null, null, 'French Southern Territories (the)', 'TF', 'ATF', 260),
       ('Gabon', 'Gabon', 'Gabon', 'GA', 'GAB', 266),
       ('Gambia, The', 'Gambia', 'Gambia (the)', 'GM', 'GMB', 270),
       ('Georgia', 'Georgia', 'Georgia', 'GE', 'GEO', 268),
       ('Germany', 'Germany', 'Germany', 'DE', 'DEU', 276),
       ('Ghana', 'Ghana', 'Ghana', 'GH', 'GHA', 288),
       ('Gibraltar', 'Gibraltar', 'Gibraltar', 'GI', 'GIB', 292),
       ('Greece', 'Greece', 'Greece', 'GR', 'GRC', 300),
       ('Greenland', 'Greenland', 'Greenland', 'GL', 'GRL', 304),
       ('Grenada', 'Grenada', 'Grenada', 'GD', 'GRD', 308),
       ('Guadeloupe', null, 'Guadeloupe', 'GP', 'GLP', 312),
       ('Guam', 'Guam', 'Guam', 'GU', 'GUM', 316),
       ('Guatemala', 'Guatemala', 'Guatemala', 'GT', 'GTM', 320),
       ('Guernsey', 'Guernsey', 'Guernsey', 'GG', 'GGY', 831),
       ('Guinea', 'Guinea', 'Guinea', 'GN', 'GIN', 324),
       ('Guinea-Bissau', 'Guinea_Bissau', 'Guinea-Bissau', 'GW', 'GNB', 624),
       ('Guyana', 'Guyana', 'Guyana', 'GY', 'GUY', 328),
       ('Haiti', 'Haiti', 'Haiti', 'HT', 'HTI', 332),
       (null, null, 'Heard Island and McDonald Islands', 'HM', 'HMD', 334),
       (null, 'Holy_See', 'Holy See (the)', 'VA', 'VAT', 336),
       ('Honduras', 'Honduras', 'Honduras', 'HN', 'HND', 340),
       ('Hong Kong', null, 'Hong Kong', 'HK', 'HKG', 344),
       ('Hungary', 'Hungary', 'Hungary', 'HU', 'HUN', 348),
       ('Iceland', 'Iceland', 'Iceland', 'IS', 'ISL', 352),
       ('India', 'India', 'India', 'IN', 'IND', 356),
       ('Indonesia', 'Indonesia', 'Indonesia', 'ID', 'IDN', 360),
       ('Iran', 'Iran', 'Iran (Islamic Republic of)', 'IR', 'IRN', 364),
       ('Iraq', 'Iraq', 'Iraq', 'IQ', 'IRQ', 368),
       ('Ireland', 'Ireland', 'Ireland', 'IE', 'IRL', 372),
       ('Isle of Man', 'Isle_of_Man', 'Isle of Man', 'IM', 'IMN', 833),
       ('Israel', 'Israel', 'Israel', 'IL', 'ISR', 376),
       ('Italy', 'Italy', 'Italy', 'IT', 'ITA', 380),
       ('Jamaica', 'Jamaica', 'Jamaica', 'JM', 'JAM', 388),
       ('Japan', 'Japan', 'Japan', 'JP', 'JPN', 392),
       ('Jersey', 'Jersey', 'Jersey', 'JE', 'JEY', 832),
       ('Jordan', 'Jordan', 'Jordan', 'JO', 'JOR', 400),
       ('Kazakhstan', 'Kazakhstan', 'Kazakhstan', 'KZ', 'KAZ', 398),
       ('Kenya', 'Kenya', 'Kenya', 'KE', 'KEN', 404),
       (null, 'Kosovo', 'Kosovo', 'XK', 'XKX', null),
       ('Kiribati', null, 'Kiribati', 'KI', 'KIR', 296),
       ('Kuwait', 'Kuwait', 'Kuwait', 'KW', 'KWT', 414),
       ('Korea, North', null, 'Korea (the Democratic Peoplenulls Republic of)', 'KP', 'PRK', 408),
       ('Korea, South', 'South_Korea', 'Korea (the Republic of)', 'KR', 'KOR', 410),
       ('Kyrgyzstan', 'Kyrgyzstan', 'Kyrgyzstan', 'KG', 'KGZ', 417),
       ('Laos', 'Laos', 'Lao Peoplenulls Democratic Republic (the)', 'LA', 'LAO', 418),
       ('Latvia', 'Latvia', 'Latvia', 'LV', 'LVA', 428),
       ('Lebanon', 'Lebanon', 'Lebanon', 'LB', 'LBN', 422),
       ('Lesotho', 'Lesotho', 'Lesotho', 'LS', 'LSO', 426),
       ('Liberia', 'Liberia', 'Liberia', 'LR', 'LBR', 430),
       ('Libya', 'Libya', 'Libya', 'LY', 'LBY', 434),
       ('Liechtenstein', 'Liechtenstein', 'Liechtenstein', 'LI', 'LIE', 438),
       ('Lithuania', 'Lithuania', 'Lithuania', 'LT', 'LTU', 440),
       ('Luxembourg', 'Luxembourg', 'Luxembourg', 'LU', 'LUX', 442),
       ('Macau', null, 'Macao', 'MO', 'MAC', 446),
       ('Macedonia', 'North_Macedonia', 'Republic of North Macedonia', 'MK', 'MKD', 807),
       ('Madagascar', 'Madagascar', 'Madagascar', 'MG', 'MDG', 450),
       ('Malawi', 'Malawi', 'Malawi', 'MW', 'MWI', 454),
       ('Malaysia', 'Malaysia', 'Malaysia', 'MY', 'MYS', 458),
       ('Maldives', 'Maldives', 'Maldives', 'MV', 'MDV', 462),
       ('Mali', 'Mali', 'Mali', 'ML', 'MLI', 466),
       ('Malta', 'Malta', 'Malta', 'MT', 'MLT', 470),
       ('Marshall Islands', 'Marshall_Islands', 'Marshall Islands (the)', 'MH', 'MHL', 584),
       ('Martinique', null, 'Martinique', 'MQ', 'MTQ', 474),
       ('Mauritania', 'Mauritania', 'Mauritania', 'MR', 'MRT', 478),
       ('Mauritius', 'Mauritius', 'Mauritius', 'MU', 'MUS', 480),
       ('Mayotte', null, 'Mayotte', 'YT', 'MYT', 175),
       ('Mexico', 'Mexico', 'Mexico', 'MX', 'MEX', 484),
       ('Micronesia, Fed. St.', 'Micronesia_(Federated_States_of)', 'Micronesia (Federated States of)', 'FM', 'FSM', 583),
       ('Moldova', 'Moldova', 'Moldova (the Republic of)', 'MD', 'MDA', 498),
       ('Monaco', 'Monaco', 'Monaco', 'MC', 'MCO', 492),
       ('Mongolia', 'Mongolia', 'Mongolia', 'MN', 'MNG', 496),
       (null, 'Montenegro', 'Montenegro', 'ME', 'MNE', 499),
       ('Montserrat', 'Montserrat', 'Montserrat', 'MS', 'MSR', 500),
       ('Morocco', 'Morocco', 'Morocco', 'MA', 'MAR', 504),
       ('Mozambique', 'Mozambique', 'Mozambique', 'MZ', 'MOZ', 508),
       ('Namibia', 'Namibia', 'Namibia', 'NA', 'NAM', 516),
       ('Nauru', null, 'Nauru', 'NR', 'NRU', 520),
       ('Nepal', 'Nepal', 'Nepal', 'NP', 'NPL', 524),
       ('Netherlands', 'Netherlands', 'Netherlands (the)', 'NL', 'NLD', 528),
       ('Netherlands Antilles', null, null, null, null, null),
       ('New Caledonia', 'New_Caledonia', 'New Caledonia', 'NC', 'NCL', 540),
       ('New Zealand', 'New_Zealand', 'New Zealand', 'NZ', 'NZL', 554),
       ('Nicaragua', 'Nicaragua', 'Nicaragua', 'NI', 'NIC', 558),
       ('Niger', 'Niger', 'Niger (the)', 'NE', 'NER', 562),
       ('Nigeria', 'Nigeria', 'Nigeria', 'NG', 'NGA', 566),
       ('N. Mariana Islands', 'Northern_Mariana_Islands', null, null, null, null),
       ('Norway', 'Norway', 'Norway', 'NO', 'NOR', 578),
       ('Oman', 'Oman', 'Oman', 'OM', 'OMN', 512),
       ('Pakistan', 'Pakistan', 'Pakistan', 'PK', 'PAK', 586),
       ('Gaza Strip', 'Palestine', 'Palestine, State of', 'PS', 'PSE', 275),
       ('West Bank', null, null, null, null, null),
       (null, null, 'Niue', 'NU', 'NIU', 570),
       (null, null, 'Norfolk Island', 'NF', 'NFK', 574),
       (null, null, 'Northern Mariana Islands (the)', 'MP', 'MNP', 580),
       ('Palau', null, 'Palau', 'PW', 'PLW', 585),
       ('Panama', 'Panama', 'Panama', 'PA', 'PAN', 591),
       ('Papua New Guinea', 'Papua_New_Guinea', 'Papua New Guinea', 'PG', 'PNG', 598),
       ('Paraguay', 'Paraguay', 'Paraguay', 'PY', 'PRY', 600),
       ('Peru', 'Peru', 'Peru', 'PE', 'PER', 604),
       ('Philippines', 'Philippines', 'Philippines (the)', 'PH', 'PHL', 608),
       (null, null, 'Pitcairn', 'PN', 'PCN', 612),
       ('Poland', 'Poland', 'Poland', 'PL', 'POL', 616),
       ('Portugal', 'Portugal', 'Portugal', 'PT', 'PRT', 620),
       ('Puerto Rico', 'Puerto_Rico', 'Puerto Rico', 'PR', 'PRI', 630),
       ('Qatar', 'Qatar', 'Qatar', 'QA', 'QAT', 634),
       ('Reunion', null, 'Réunion', 'RE', 'REU', 638),
       ('Romania', 'Romania', 'Romania', 'RO', 'ROU', 642),
       ('Russia', 'Russia', 'Russian Federation (the)', 'RU', 'RUS', 643),
       ('Rwanda', 'Rwanda', 'Rwanda', 'RW', 'RWA', 646),
       ('Saint Helena', null, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', 654),
       (null, null, 'Saint Barthélemy', 'BL', 'BLM', 652),
       ('Saint Kitts & Nevis', 'Saint_Kitts_and_Nevis', 'Saint Kitts and Nevis', 'KN', 'KNA', 659),
       ('Saint Lucia', 'Saint_Lucia', 'Saint Lucia', 'LC', 'LCA', 662),
       (null, null, 'Saint Martin (French part)', 'MF', 'MAF', 663),
       ('St Pierre & Miquelon', null, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666),
       ('Saint Vincent and the Grenadines', 'Saint_Vincent_and_the_Grenadines', 'Saint Vincent and the Grenadines', 'VC', 'VCT', 670),
       ('Samoa', null, 'Samoa', 'WS', 'WSM', 882),
       ('San Marino', 'San_Marino', 'San Marino', 'SM', 'SMR', 674),
       ('Sao Tome & Principe', 'Sao_Tome_and_Principe', 'Sao Tome and Principe', 'ST', 'STP', 678),
       ('Saudi Arabia', 'Saudi_Arabia', 'Saudi Arabia', 'SA', 'SAU', 682),
       ('Senegal', 'Senegal', 'Senegal', 'SN', 'SEN', 686),
       ('Serbia', 'Serbia', 'Serbia', 'RS', 'SRB', 688),
       ('Seychelles', 'Seychelles', 'Seychelles', 'SC', 'SYC', 690),
       ('Sierra Leone', 'Sierra_Leone', 'Sierra Leone', 'SL', 'SLE', 694),
       ('Singapore', 'Singapore', 'Singapore', 'SG', 'SGP', 702),
       (null, 'Sint_Maarten', 'Sint Maarten (Dutch part)', 'SX', 'SXM', 534),
       ('Slovakia', 'Slovakia', 'Slovakia', 'SK', 'SVK', 703),
       ('Slovenia', 'Slovenia', 'Slovenia', 'SI', 'SVN', 705),
       ('Solomon Islands', 'Solomon_Islands', 'Solomon Islands', 'SB', 'SLB', 90),
       ('Somalia', 'Somalia', 'Somalia', 'SO', 'SOM', 706),
       ('South Africa', 'South_Africa', 'South Africa', 'ZA', 'ZAF', 710),
       (null, null, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 239),
       (null, 'South_Sudan', 'South Sudan', 'SS', 'SSD', 728),
       ('Spain', 'Spain', 'Spain', 'ES', 'ESP', 724),
       ('Sri Lanka', 'Sri_Lanka', 'Sri Lanka', 'LK', 'LKA', 144),
       ('Sudan', 'Sudan', 'Sudan (the)', 'SD', 'SDN', 729),
       ('Suriname', 'Suriname', 'Suriname', 'SR', 'SUR', 740),
       (null, null, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744),
       ('Sweden', 'Sweden', 'Sweden', 'SE', 'SWE', 752),
       ('Switzerland', 'Switzerland', 'Switzerland', 'CH', 'CHE', 756),
       ('Syria', 'Syria', 'Syrian Arab Republic', 'SY', 'SYR', 760),
       ('Taiwan', 'Taiwan', 'Taiwan (Province of China)', 'TW', 'TWN', 158),
       ('Tajikistan', 'Tajikistan', 'Tajikistan', 'TJ', 'TJK', 762),
       ('Tanzania', 'United_Republic_of_Tanzania', 'Tanzania, United Republic of', 'TZ', 'TZA', 834),
       ('Thailand', 'Thailand', 'Thailand', 'TH', 'THA', 764),
       ('Togo', 'Togo', 'Togo', 'TG', 'TGO', 768),
       (null, null, 'Tokelau', 'TK', 'TKL', 772),
       ('Tonga', null, 'Tonga', 'TO', 'TON', 776),
       ('Trinidad & Tobago', 'Trinidad_and_Tobago', 'Trinidad and Tobago', 'TT', 'TTO', 780),
       ('Tunisia', 'Tunisia', 'Tunisia', 'TN', 'TUN', 788),
       ('Turkey', 'Turkey', 'Turkey', 'TR', 'TUR', 792),
       ('Turkmenistan', null, 'Turkmenistan', 'TM', 'TKM', 795),
       ('Turks & Caicos Is', 'Turks_and_Caicos_islands', 'Turks and Caicos Islands (the)', 'TC', 'TCA', 796),
       ('Tuvalu', null, 'Tuvalu', 'TV', 'TUV', 798),
       ('Uganda', 'Uganda', 'Uganda', 'UG', 'UGA', 800),
       ('Ukraine', 'Ukraine', 'Ukraine', 'UA', 'UKR', 804),
       ('United Arab Emirates', 'United_Arab_Emirates', 'United Arab Emirates (the)', 'AE', 'ARE', 784),
       ('United Kingdom', 'United_Kingdom', 'United Kingdom of Great Britain and Northern Ireland (the)', 'GB', 'GBR', 826),
       (null, null, 'United States Minor Outlying Islands (the)', 'UM', 'UMI', 581),
       ('United States', 'United_States_of_America', 'United States of America (the)', 'US', 'USA', 840),
       ('Uruguay', 'Uruguay', 'Uruguay', 'UY', 'URY', 858),
       ('Uzbekistan', 'Uzbekistan', 'Uzbekistan', 'UZ', 'UZB', 860),
       ('Vanuatu', 'Vanuatu', 'Vanuatu', 'VU', 'VUT', 548),
       ('Venezuela', 'Venezuela', 'Venezuela (Bolivarian Republic of)', 'VE', 'VEN', 862),
       ('Vietnam', 'Vietnam', 'Viet Nam', 'VN', 'VNM', 704),
       ('Virgin Islands', 'United_States_Virgin_Islands', 'Virgin Islands (U.S.)', 'VI', 'VIR', 850),
       ('Wallis and Futuna', 'Wallis_and_Futuna', 'Wallis and Futuna', 'WF', 'WLF', 876),
       ('Western Sahara', 'Western_Sahara', 'Western Sahara', 'EH', 'ESH', 732),
       ('Yemen', 'Yemen', 'Yemen', 'YE', 'YEM', 887),
       ('Zambia', 'Zambia', 'Zambia', 'ZM', 'ZMB', 894),
       ('Zimbabwe', 'Zimbabwe', 'Zimbabwe', 'ZW', 'ZWE', 716),
       (null, null, 'Åland Islands', 'AX', 'ALA', 248);
