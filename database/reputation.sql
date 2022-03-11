CREATE TABLE marketplace.reputation_suplier(
    id SERIAL PRIMARY KEY,
    id_suplier INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    reputacion varcahr(255) NOT NULL DEFAULT 'baja',
    FOREIGN KEY (id_suplier) REFERENCES marketplace.suplier(id), 
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



CREATE FUNCTION marketplace.calculate_reputation() RETURNS TRIGGER
AS 
$$
BEGIN

    CREATE TEMP TABLE reputaciones_mes_corrido AS
    SELECT id_suplier, rating, reputacion, created_on
    FROM marketplace.reputation_suplier
    WHERE created_on >= (CURRENT_DATE - INTERVAL '1 month');

    UPDATE TEMP TABLE reputaciones_mes_corrido
    SET reputacion = CASE
        WHEN rating <= 5 THEN 'baja'
        WHEN rating > 5 AND rating <= 10 THEN 'baja-media'
        WHEN rating > 10 AND rating <= 15 THEN 'media'
        WHEN rating > 15 AND rating <= 20 THEN 'media-alta'
        WHEN rating > 20 THEN 'alta'
END



CREATE TRIGGER calculate_reputation_trigger 
ON SHEDULE EVERY 1 DAY AT '00:00:00'
DO
    EXECUTE FUNCTION marketplace.calculate_reputation();
DATE_ADD(
    CURRENT_DATE, 
    INTERVAL (DAYOFWEEK(CURRENT_DATE) - 1) DAY
);
, INTERVAL 7 DAY)
END;



