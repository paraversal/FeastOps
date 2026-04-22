
CREATE TABLE "STATIC_stores" (
	id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	PRIMARY KEY (id)
)



CREATE TABLE "STATIC_recipe_plan_types" (
	id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	PRIMARY KEY (id)
)



CREATE TABLE "STATIC_recipe_types" (
	id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	PRIMARY KEY (id)
)



CREATE TABLE "STATIC_event_namespaces" (
	id INTEGER NOT NULL, 
	namespace VARCHAR NOT NULL, 
	description VARCHAR NOT NULL, 
	PRIMARY KEY (id)
)



CREATE TABLE "EVENT_NebuSummer2026_RecipePlans" (
	id INTEGER NOT NULL, 
	recipe_id INTEGER NOT NULL, 
	plan_type INTEGER NOT NULL, 
	PRIMARY KEY (id)
)



CREATE TABLE "STATIC_ingredients" (
	id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	unit VARCHAR NOT NULL, 
	price_per_unit FLOAT NOT NULL, 
	store_id INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(store_id) REFERENCES "STATIC_stores" (id)
)



CREATE TABLE "STATIC_recipes" (
	id INTEGER NOT NULL, 
	name VARCHAR NOT NULL, 
	steps VARCHAR NOT NULL, 
	additional_info VARCHAR NOT NULL, 
	type INTEGER NOT NULL, 
	result_amount_pp_g FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(type) REFERENCES "STATIC_recipe_types" (id)
)



CREATE TABLE "EVENT_NebuSummer2026_Outline" (
	id INTEGER NOT NULL, 
	namespace INTEGER NOT NULL, 
	participants INTEGER NOT NULL, 
	thursday_stays INTEGER NOT NULL, 
	additional_hunger_modifier FLOAT NOT NULL, 
	helper_food_modifier FLOAT NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(namespace) REFERENCES "STATIC_event_namespaces" (id)
)



CREATE TABLE "STATIC_ingredient_recipes" (
	ingredient_id INTEGER NOT NULL, 
	recipe_id INTEGER NOT NULL, 
	amount FLOAT, 
	PRIMARY KEY (ingredient_id, recipe_id), 
	FOREIGN KEY(ingredient_id) REFERENCES "STATIC_ingredients" (id), 
	FOREIGN KEY(recipe_id) REFERENCES "STATIC_recipes" (id)
)



CREATE TABLE "STATIC_EANs" (
	id INTEGER NOT NULL, 
	ean INTEGER NOT NULL, 
	product_id INTEGER NOT NULL, 
	PRIMARY KEY (id), 
	FOREIGN KEY(product_id) REFERENCES "STATIC_ingredients" (id)
)


