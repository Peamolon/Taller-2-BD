CREATE TRIGGER trigger_update BEFORE UPDATE or DELETE ON marketplace.products
FOR EACH ROW 
EXECUTE PROCEDURE set_exist_product();

CREATE TRIGGER trigger_insert BEFORE INSERT ON marketplace.products
FOR EACH ROW 
EXECUTE PROCEDURE set_new_product();
