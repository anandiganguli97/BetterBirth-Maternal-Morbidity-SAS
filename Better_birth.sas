/*BetterBirth Analysis*/
/*Importing data*/
proc import
DATAFILE = "/home/u63574590/BetterBirth-DataSet.csv"
OUT = BetterBirth
DBMS = csv
REPLACE;
GETNAMES = yes;
run;
proc contents data= BetterBirth;
run;
/*Histogram*/
proc sgplot data=Betterbirth;
    histogram morbid;
    title 'Histogram of Maternal morbidity';
run;
/*Summary statistics of predictors*/
proc means data = betterbirth mean std n nmiss max min Range maxdec=3;
	var literacy age35plus ageunder25 scheduled obc meangravida complicbefore anemia;
run;
proc freq data = betterbirth;
	tables highincome lucknow;
run;
/*Correlation matrix*/
proc corr data=Betterbirth;
   var literacy highincome lucknow age35plus ageunder25 scheduled 
       obc meangravida complicbefore anemia;
run;
/*Full model*/
proc glm data=Betterbirth;
class highincome (Ref='0') lucknow (Ref='0');
model morbid = literacy age35plus ageunder25 scheduled obc meangravida 
complicbefore anemia highincome lucknow / ss3 solution clparm alpha=0.05;
run;
Data Birth;
Set Betterbirth;
If cmiss (scheduled, obc, meangravida, complicbefore,anemia) then delete;
run;
/*Forward Selection*/
proc glmselect data = Birth;
CLASS highincome(ref="0") lucknow(ref="0");
MODEL morbid = literacy age35plus ageunder25 scheduled obc meangravida complicbefore anemia highincome lucknow
/ selection = forward(select = AIC);
run;
/*Backward Elimination*/
proc glmselect data = Birth;
	class highincome(ref="0") lucknow(ref="0");
	model morbid = literacy age35plus ageunder25 scheduled obc meangravida complicbefore anemia highincome lucknow
	/ selection = backward (select = AIC);
run;
/*Stepwise selection*/
proc glmselect data = Birth;
 CLASS highincome (Ref="0") lucknow (Ref="0");
 MODEL morbid = literacy age35plus ageunder25 scheduled obc meangravida 
complicbefore anemia highincome lucknow
 / selection = stepwise(select = AIC);
 run;
 /*Final Model*/
proc genmod data = Birth;
MODEL morbid = literacy meangravida lucknow / type3;
run;








