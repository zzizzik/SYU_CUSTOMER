create view custorecipe as select r.recipeseq, r.recipename, r.recipeintro, r.recipecategoey, c.usernick,
r.recipecontent, c.usergrade, r.wi_date, r.boardhit, r.boardgood, r.boardbad, r.recipecalorie,
r.recipetime, r.mainimage  from customer c, recipe r where c.userid = r.userid;