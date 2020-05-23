
% Returns a list of available heroes.
% Each hero's information is also stored as a list.
employees(E) :- E = [
  [superman, clark, kent, 475000],
  [batman, bruce, wayne, 342000],
  [wonder_woman, diana, prince, 297000],
  [green_arrow, oliver, queen, 210000],
  [flash, barry, allen, 184000],
  [aquaman, arthur, curry, 5000] ].

% Helper rule that may be used to extract information from an
% employee.  For instance, if you know an employee's name,
% you can use this rule to look up their salary.
hero(HeroName, SecretIdentFname, SecretIdentLname, Salary) :-
  employees(EmpList),
  member(H, EmpList),
  H = [HeroName, SecretIdentFname, SecretIdentLname, Salary].


% Given a list of hero names, return the list of heroes
% and the total cost of all heroes.  (Since there should
% only be one match, you might consider using a green cut).
make_team([], [], 0).
make_team([HeroName|Tail], HeroList, TotalCost) :-
 employees(EmpList),
 member(HeroName,EmpList),
 hero(HeroName, _, _, S),
 append(HeroName, HeroList, newHL),
 TotalCost is TotalCost + S,
 make_team(Tail, newHL, TotalCost).

% Given a budget, find combinations of heroes who are under
% that budget.  (Give some careful thought to the base case).
budget_team(TotalBudget, HeroList) :-
  employees(EmpList),
  budget_team(TotalBudget,HeroList,EmpList).
 budget_team(TotalBudget,HeroList,[Hero|Tail]) :-
 
  %get heros information
  Hero = [_,_,_,Salary],
 
  %check heros not a member of HeroList already
  \+member(Hero,HeroList),
 
 
  %check salary of hero is lest than budget
  Salary @< TotalBudget,
 
  %decrement TotalBudget
  TotalBudget is TotalBudget - Salary,
 
  %add to heroList
  append(HeroList,Hero,newHeroList),
 
 
  %call budget_team rec.
  budget_team(TotalBudget,newHeroList,Tail).



