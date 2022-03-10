CREATE OR REPLACE FUNCTION set_product() RETURNS TRIGGER 
AS
$$
DECLARE 
product_category varchar(50);
product_size varchar(50);
product_color varchar(50);
BEGIN
IF (TG_OP = 'INSERT') THEN
	select size into product_size from marketplace.product_details where product_id = new.id;
	select color into product_color from marketplace.product_details where product_id = new.id;
	select name into product_category from marketplace.product_categories where id = new.product_categories_id;
	INSERT INTO marketplace.product_audit VALUES(default, new.name, new.price, new.brand, product_category, TG_OP, product_size, product_color);
ELSE
	select size into product_size from marketplace.product_details where product_id = old.id;
	select color into product_color from marketplace.product_details where product_id = old.id;
	select name into product_category from marketplace.product_categories where id = old.product_categories_id;
	INSERT INTO marketplace.product_audit VALUES(default, old.name, old.price, old.brand, product_category, TG_OP, product_size, product_color);
END IF;
RETURN NEW;
END 
$$
LANGUAGE plpgsql