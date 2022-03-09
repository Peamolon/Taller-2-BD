CREATE FUNCTION set_exist_product() RETURNS TRIGGER 
AS
$$
BEGIN
INSERT INTO marketplace.product_audit VALUES(default, old.name, old.price, old.brand, old.product_categories_id);
RETURN NEW;
END 
$$
LANGUAGE plpgsql

CREATE FUNCTION set_new_product() RETURNS TRIGGER
AS 
$$
BEGIN 
INSERT INTO marketplace.product_audit VALUES(default, new.name, new.price, new.brand, new.product_categories_id);
RETURN NEW;
END 
$$




