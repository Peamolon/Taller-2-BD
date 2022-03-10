CREATE TRIGGER trigger_update BEFORE UPDATE or DELETE or INSERT ON marketplace.products
FOR EACH ROW 
EXECUTE PROCEDURE set_product();