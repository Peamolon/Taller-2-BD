/*---- PUNTO 1 ----*/
CREATE TRIGGER trigger_update BEFORE UPDATE or DELETE or INSERT ON marketplace.products
FOR EACH ROW 
EXECUTE PROCEDURE set_product();

/*------PUNTO 2-----*/
CREATE TRIGGER trigger_update BEFORE INSERT ON marketplace.order
FOR EACH ROW 
EXECUTE PROCEDURE validate_order();

/*------PUNTO 3 Optional-----*/
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