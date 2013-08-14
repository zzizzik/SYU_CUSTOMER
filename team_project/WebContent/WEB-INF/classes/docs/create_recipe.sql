Create table recipe(
	recipeSEQ number (10) ,
	boardCode varchar2 (10) ,
	userid varchar2 (10) not null ,
	recipeName varchar2 (30) not null,
	recipeIntro varchar2 (100) not null,
	recipeCategoey varchar2 (15) not null,
	recipeContent NCLOB not null,
	Wi_Date DATE not null ,
	boardHit number (10) not null ,
	boardGood number (10) not null,
	boardBad number (10) not null,
	recipeCalorie number (10) not null,
	recipeTime number (10),
	mainImage varchar2 (30)
);

ALTER TABLE recipe ADD(CONSTRAINT recipe_recipe_pk PRIMARY KEY (recipeSEQ,boardCode));

CREATE SEQUENCE recipeSEQ;
