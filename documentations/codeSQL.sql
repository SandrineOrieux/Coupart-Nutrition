CREATE DATABASE coupart - nutrition;

CREATE TABLE allergen (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, name VARCHAR (255) NOT NULL
);

CREATE TABLE diet (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, name VARCHAR (255) NOT NULL, description LONGTEXT NOT NULL
);

CREATE TABLE quantity (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, number INT DEFAULT NULL, unity VARCHAR (255) DEFAULT NULL
);

CREATE TABLE type_of_recipe (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, name VARCHAR (255) NOT NULL
);

CREATE TABLE user (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, email VARCHAR(180) NOT NULL UNIQUE, roles JSON NOT NULL, password VARCHAR (255) NOT NULL, first_name VARCHAR (255) NOT NULL, last_name VARCHAR (255) NOT NULL, birthday DATE NOT NULL
);

CREATE TABLE user_allergen (
    user_id INT NOT NULL FOREIGN KEY REFERENCES user (id) ON DELETE CASCADE, allergen_id INT NOT NULL FOREIGN KEY REFERENCES allergen (id) ON DELETE CASCADE
);

CREATE TABLE user_diet (
    user_id INT NOT NULL FOREIGN KEY REFERENCES user (id) ON DELETE CASCADE, diet_id INT NOT NULL FOREIGN KEY REFERENCES diet (id) ON DELETE CASCADE
);

CREATE TABLE ingredient (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, quantity_id INT DEFAULT NULL FOREIGN KEY REFERENCES quantity (id), allergen_id INT DEFAULT NULL FOREIGN KEY REFERENCES allergen (id), name VARCHAR (255) NOT NULL
);

CREATE TABLE ingredient_recipe (
    ingredient_id INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES ingredient (id) ON DELETE CASCADE, recipe_id INT NOT NULL FOREIGN KEY REFERENCES recipe (id) ON DELETE CASCADE
);

CREATE TABLE recipe (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, type_of_recipe_id INT NOT NULL FOREIGN KEY REFERENCES type_of_recipe (id), title VARCHAR (255) NOT NULL, decription LONGTEXT NOT NULL, preparation_time INT NOT NULL, resting_time INT DEFAULT NULL, cooking_time INT DEFAULT NULL, steps LONGTEXT NOT NULL, is_public TINYINT (1) NOT NULL
);

CREATE TABLE recipe_diet (
    recipe_id INT NOT NULL FOREIGN KEY REFERENCES recipe (id) ON DELETE CASCADE, diet_id INT NOT NULL FOREIGN KEY REFERENCES diet (id) ON DELETE CASCADE
);

CREATE TABLE review (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, user_id INTNOT NULL FOREIGN KEY REFERENCES user (id), recipe_id INT NOT NULL FOREIGN KEY REFERENCES recipe (id), rate SMALLINT NOT NULL, comment LONGTEXT DEFAULT NULL, is_validated TINYINT(1) NOT NULL
);

/*find recipe with allergen*/
SELECT recipe.id
FROM
    recipe
    INNER JOIN ingredient_recipe ON recipe.id = ingredient_recipe.recipe_id
    INNER JOIN ingredient ON ingredient.id = ingredient_recipe.ingredient_id
    INNER JOIN allergen ON ingredient.allergen_id = allergen.id
WHERE
    allergen.id = 11
    /*find recipes compatible with diets*/
SELECT *
FROM
    recipe
    INNER JOIN recipe_diet ON recipe.id = recipe_diet.recipe_id
    INNER JOIN diet ON diet.id = recipe_diet.diet_id
    INNER JOIN user_diet ON diet.id = user_diet.diet_id
    INNER JOIN user ON user.id = user_diet.user_id
WHERE
    user.id = 2;

/*we remove recipes that contain the allergen from recipes compatible with diets*/
SELECT *
FROM recipe
WHERE
    recipe.id IN (2, 3, 6, 7)
    AND recipe.id NOT IN(3);