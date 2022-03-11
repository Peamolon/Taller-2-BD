/* Crear tabla punto 1*/

CREATE TABLE marketplace.product_audit(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    brand VARCHAR(255) NOT NULL,
    product_category VARCHAR(255) NOT NULL,
	event_type VARCHAR(50) NOT NULL,
	size VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/* Crear tabla punto 3*/

CREATE TABLE marketplace.reputation_suplier(
    id SERIAL PRIMARY KEY,
    id_suplier INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    reputacion varcahr(255) NOT NULL DEFAULT 'baja',
    FOREIGN KEY (id_suplier) REFERENCES marketplace.suplier(id), 
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

