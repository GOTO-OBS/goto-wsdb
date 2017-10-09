CREATE TABLE IF NOT EXISTS goto_simulated_images (
    id serial primary key,
    basename varchar,
    ingested_timestamp timestamp
);

CREATE TABLE IF NOT EXISTS goto_simulated_detections (
    id serial primary key,
    image_id integer not null,
    flux_best real,
    fluxerr_best real,
    mag_best real,
    magerr_best real,
    background real,
    threshold real,
    flux_max real,
    x_image real,
    y_image real,
    x2_image real,
    y2_image real,
    a_image real,
    b_image real,
    theta_image real,
    erra_image real,
    errb_image real,
    errtheta_image real,
    flags integer,
    flags_weight integer,
    flags_win integer,
    elongation real,
    fwhm_image real,

    x real,
    y real,
    mag real,
    merr real,
    flux real,
    flux_err real,
    fwhm real,
    s2n real,
    ra real,
    dec real,
    err_ra real,
    err_dec real,
    calcat_ra real,
    calcat_dec real,
    calcat_id varchar,
    calcat_mag_r real,
    calcat_merr_r real,
    calcat_dist_r real,
    zp_r real,
    zp_err_r real,
    mag_r real,
    merr_r real,
    calcat_mag_v real,
    calcat_merr_v real,
    calcat_dist_v real,
    zp_v real,
    zp_err_v real,
    mag_v real
);