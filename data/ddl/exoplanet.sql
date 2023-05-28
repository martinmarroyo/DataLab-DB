/* Creates the tables for the exoplanet schema */
CREATE TABLE IF NOT EXISTS exoplanet.raw_exoplanet (
    index DOUBLE PRECISION,
    planet_name TEXT,
    planet_status TEXT,
    mass DOUBLE PRECISION,
    mass_error_min DOUBLE PRECISION,
    mass_error_max DOUBLE PRECISION,
    mass_sini DOUBLE PRECISION,
    mass_sini_error_min DOUBLE PRECISION,
    mass_sini_error_max DOUBLE PRECISION,
    radius DOUBLE PRECISION,
    radius_error_min DOUBLE PRECISION,
    radius_error_max DOUBLE PRECISION,
    orbital_period DOUBLE PRECISION,
    orbital_period_error_min DOUBLE PRECISION,
    orbital_period_error_max DOUBLE PRECISION,
    semi_major_axis DOUBLE PRECISION,
    semi_major_axis_error_min DOUBLE PRECISION,
    semi_major_axis_error_max DOUBLE PRECISION,
    eccentricity DOUBLE PRECISION,
    eccentricity_error_min DOUBLE PRECISION,
    eccentricity_error_max DOUBLE PRECISION,
    inclination DOUBLE PRECISION,
    inclination_error_min DOUBLE PRECISION,
    inclination_error_max DOUBLE PRECISION,
    angular_distance DOUBLE PRECISION,
    discovered  DOUBLE PRECISION,
    updated TEXT,
    omega DOUBLE PRECISION,
    omega_error_min DOUBLE PRECISION,
    omega_error_max DOUBLE PRECISION,
    tperi DOUBLE PRECISION, 
    tperi_error_min DOUBLE PRECISION,
    tperi_error_max DOUBLE PRECISION,
    tconj DOUBLE PRECISION,
    tconj_error_min DOUBLE PRECISION,
    tconj_error_max DOUBLE PRECISION,
    tzero_tr DOUBLE PRECISION,
    tzero_tr_error_min DOUBLE PRECISION,
    tzero_tr_error_max DOUBLE PRECISION,
    tzero_tr_sec DOUBLE PRECISION,
    tzero_tr_sec_error_min DOUBLE PRECISION,
    tzero_tr_sec_error_max DOUBLE PRECISION,
    lambda_angle DOUBLE PRECISION,
    lambda_angle_error_min DOUBLE PRECISION,
    lambda_angle_error_max DOUBLE PRECISION,
    impact_parameter DOUBLE PRECISION,
    impact_parameter_error_min DOUBLE PRECISION,
    impact_parameter_error_max DOUBLE PRECISION,
    tzero_vr DOUBLE PRECISION,
    tzero_vr_error_min DOUBLE PRECISION,
    tzero_vr_error_max DOUBLE PRECISION,
    k DOUBLE PRECISION,
    k_error_min DOUBLE PRECISION,
    k_error_max DOUBLE PRECISION,
    temp_calculated DOUBLE PRECISION,
    temp_calculated_error_min DOUBLE PRECISION,
    temp_calculated_error_max DOUBLE PRECISION,
    temp_measured DOUBLE PRECISION,
    hot_point_lon DOUBLE PRECISION,
    geometric_albedo DOUBLE PRECISION,
    geometric_albedo_error_min DOUBLE PRECISION,
    geometric_albedo_error_max DOUBLE PRECISION,
    log_g DOUBLE PRECISION,
    publication TEXT,
    detection_type TEXT,
    mass_detection_type TEXT,
    radius_detection_type TEXT,
    alternate_names TEXT,
    molecules TEXT,
    star_name TEXT,
    ra DOUBLE PRECISION,
    dec DOUBLE PRECISION,
    mag_v DOUBLE PRECISION,
    mag_i DOUBLE PRECISION,
    mag_j DOUBLE PRECISION,
    mag_h DOUBLE PRECISION,
    mag_k DOUBLE PRECISION,
    star_distance DOUBLE PRECISION,
    star_distance_error_min DOUBLE PRECISION,
    star_distance_error_max DOUBLE PRECISION,
    star_metallicity DOUBLE PRECISION,
    star_metallicity_error_min DOUBLE PRECISION,
    star_metallicity_error_max DOUBLE PRECISION,
    star_mass DOUBLE PRECISION,
    star_mass_error_min DOUBLE PRECISION,
    star_mass_error_max DOUBLE PRECISION,
    star_radius DOUBLE PRECISION,
    star_radius_error_min DOUBLE PRECISION,
    star_radius_error_max DOUBLE PRECISION,
    star_sp_type TEXT,
    star_age DOUBLE PRECISION,
    star_age_error_min DOUBLE PRECISION,
    star_age_error_max DOUBLE PRECISION,
    star_teff DOUBLE PRECISION,
    star_teff_error_min DOUBLE PRECISION,
    star_teff_error_max DOUBLE PRECISION,
    star_detected_disc TEXT,
    star_magnetic_field TEXT,
    star_alternate_names TEXT
);

CREATE TABLE IF NOT EXISTS exoplanet.dim_planet (
    planet_key BIGSERIAL,
    planet_name TEXT,
    planet_status TEXT,
    discovered DOUBLE PRECISION,
    publication TEXT,
    detection_type TEXT,
    mass_detection_type TEXT,
    radius_detection_type TEXT,
    molecules TEXT,
    alternate_names TEXT,
    row_current BOOLEAN,
    current_as_of DATE,
    row_expired_date DATE
);

CREATE TABLE IF NOT EXISTS exoplanet.dim_star (
    star_key BIGSERIAL,
    star_name TEXT,
    star_detected_disc TEXT,
    star_age DOUBLE PRECISION,
    star_metallicity DOUBLE PRECISION,
    star_sp_type TEXT,
    star_teff DOUBLE PRECISION,
    star_magnetic_field TEXT,
    star_alternate_names TEXT,
    row_current BOOLEAN,
    current_as_of DATE,
    row_expired_date DATE
);

CREATE TABLE IF NOT EXISTS exoplanet.fact_planet_star (
    planet_key BIGINT,
    star_key BIGINT,
    date_key BIGINT,
    planet_mass DOUBLE PRECISION,
    planet_mass_error_min DOUBLE PRECISION,
    planet_mass_error_max DOUBLE PRECISION,
    planet_mass_sini DOUBLE PRECISION,
    planet_mass_sini_error_min DOUBLE PRECISION,
    planet_mass_sini_error_max DOUBLE PRECISION,
    planet_radius DOUBLE PRECISION,
    planet_radius_error_min DOUBLE PRECISION,
    planet_radius_error_max DOUBLE PRECISION,
    planet_orbital_period DOUBLE PRECISION,
    planet_orbital_period_error_min DOUBLE PRECISION,
    planet_orbital_period_error_max DOUBLE PRECISION,
    planet_semi_major_axis DOUBLE PRECISION,
    planet_semi_major_axis_error_min DOUBLE PRECISION,
    planet_semi_major_axis_error_max DOUBLE PRECISION,
    planet_eccentricity DOUBLE PRECISION,
    planet_eccentricity_error_min DOUBLE PRECISION,
    planet_eccentricity_error_max DOUBLE PRECISION,
    planet_inclination DOUBLE PRECISION,
    planet_inclination_error_min DOUBLE PRECISION,
    planet_inclination_error_max DOUBLE PRECISION,
    planet_angular_distance DOUBLE PRECISION,
    planet_omega DOUBLE PRECISION,
    planet_omega_error_min DOUBLE PRECISION,
    planet_omega_error_max DOUBLE PRECISION,
    planet_tperi DOUBLE PRECISION,
    planet_tperi_error_min DOUBLE PRECISION,
    planet_tperi_error_max DOUBLE PRECISION,
    planet_tconj DOUBLE PRECISION,
    planet_tconj_error_min DOUBLE PRECISION,
    planet_tconj_error_max DOUBLE PRECISION,
    planet_tzero_tr DOUBLE PRECISION,
    planet_tzero_tr_error_min DOUBLE PRECISION,
    planet_tzero_tr_error_max DOUBLE PRECISION,
    planet_tzero_tr_sec DOUBLE PRECISION,
    planet_tzero_tr_sec_error_min DOUBLE PRECISION,
    planet_tzero_tr_sec_error_max DOUBLE PRECISION,
    planet_lambda_angle DOUBLE PRECISION,
    planet_lambda_angle_error_min DOUBLE PRECISION,
    planet_lambda_angle_error_max DOUBLE PRECISION,
    planet_impact_parameter DOUBLE PRECISION,
    planet_impact_parameter_error_min DOUBLE PRECISION,
    planet_impact_parameter_error_max DOUBLE PRECISION,
    planet_tzero_vr DOUBLE PRECISION,
    planet_tzero_vr_error_min DOUBLE PRECISION,
    planet_tzero_vr_error_max DOUBLE PRECISION,
    planet_k DOUBLE PRECISION,
    planet_k_error_min DOUBLE PRECISION,
    planet_k_error_max DOUBLE PRECISION,
    planet_temp_calculated DOUBLE PRECISION,
    planet_temp_calculated_error_min DOUBLE PRECISION,
    planet_temp_calculated_error_max DOUBLE PRECISION,
    planet_temp_measured DOUBLE PRECISION,
    planet_hot_point_lon DOUBLE PRECISION,
    planet_geometric_albedo DOUBLE PRECISION,
    planet_geometric_albedo_error_min DOUBLE PRECISION,
    planet_geometric_albedo_error_max DOUBLE PRECISION,
    planet_log_g DOUBLE PRECISION,
    star_ra DOUBLE PRECISION,
    star_dec DOUBLE PRECISION,
    star_mag_v DOUBLE PRECISION,
    star_mag_i DOUBLE PRECISION,
    star_mag_j DOUBLE PRECISION,
    star_mag_h DOUBLE PRECISION,
    star_mag_k DOUBLE PRECISION,
    star_distance DOUBLE PRECISION,
    star_distance_error_min DOUBLE PRECISION,
    star_distance_error_max DOUBLE PRECISION,
    star_metallicity_error_min DOUBLE PRECISION,
    star_metallicity_error_max DOUBLE PRECISION,
    star_mass DOUBLE PRECISION,
    star_mass_error_min DOUBLE PRECISION,
    star_mass_error_max DOUBLE PRECISION,
    star_radius DOUBLE PRECISION,
    star_radius_error_min DOUBLE PRECISION,
    star_radius_error_max DOUBLE PRECISION,
    star_age_error_min DOUBLE PRECISION,
    star_age_error_max DOUBLE PRECISION,
    star_teff_error_min DOUBLE PRECISION,
    star_teff_error_max DOUBLE PRECISION,
    row_entry_date DATE
);