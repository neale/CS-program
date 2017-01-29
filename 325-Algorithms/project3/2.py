from pulp import *



ingredients = ['tomato', 'lettuce', 'spinach', 'carrot', 'sunflour', 'tofu', 'chickpeas', 'oil']

protein = {
        'tomato': .85,
        'lettuce': 1.62,
        'spinach': 2.86, 
        'carrot': .93,
        'sunflour': 23.4,
        'tofu': 16.00,
        'chickpeas': 9.00, 
        'oil': 0.0 }

fat = {
        'tomato': .33,
        'lettuce': .20,
        'spinach': .39, 
        'carrot': .24,
        'sunflour': 48.7,
        'tofu': 5.0,
        'chickpeas': 2.6, 
        'oil': 100.00 }

carbs = {
        'tomato': 4.64,
        'lettuce': 2.37,
        'spinach': 3.63, 
        'carrot': 9.58,
        'sunflour': 15.00,
        'tofu': 3.00,
        'chickpeas': 27.0, 
        'oil': 0.0 }

sodium = {
        'tomato': .009,
        'lettuce': .028,
        'spinach': .065, 
        'carrot': .069,
        'sunflour': .003,
        'tofu': .120,
        'chickpeas': .078, 
        'oil': 0.0 }

cost = {
        'tomato': 1.0,
        'lettuce': .75,
        'spinach': .5, 
        'carrot': .5,
        'sunflour': .45,
        'tofu': 2.15,
        'chickpeas': .95, 
        'oil': 2.00 }

calories = {
        'tomato': 21,
        'lettuce': 16,
        'spinach': 40, 
        'carrot': 41,
        'sunflour': 585,
        'tofu': 120,
        'chickpeas': 164, 
        'oil': 884 }

green = {
        'tomato': 0.0,
        'lettuce': 1.0,
        'spinach': 1.0, 
        'carrot': 0.0,
        'sunflour': 0.0,
        'tofu': 0.0,
        'chickpeas': 0.0, 
        'oil': 0.0 }



prob = LpProblem("salad", LpMinimize)

nuts = [protein, fat, carbs, sodium, cost, calories]

ingredient_vars = LpVariable.dicts("ingr",ingredients,0)
print ingredient_vars
prob += lpSum([calories[i]*ingredient_vars[i] for i in ingredients])

#must have at least this much of everything
prob += lpSum([ingredient_vars[i] for i in ingredients]) >= 21, 'grams'

#leafy greens
prob += lpSum([green[i] * ingredient_vars[i] for i in ingredients]) >= (8.4), "greens" 
        
# protien 
prob += lpSum([protein[i] * ingredient_vars[i] for i in ingredients]) >= 15.0, "ProteinRequirement"

# Fat
prob += (2 <= (lpSum([fat[i] * ingredient_vars[i] for i in ingredients]) <= 8)), "FatRequirement"

# Carbs
prob += lpSum([carbs[i] * ingredient_vars[i] for i in ingredients]) >= 4.0, "carbsRequirement"

# sodium
prob += lpSum([sodium[i] * ingredient_vars[i] for i in ingredients]) <= 0.2, "SaltRequirement"

prob.solve()
print "Status:", LpStatus[prob.status]
for v in prob.variables():
    print v.name, "=", v.varValue
print "best caloric makeup = ", value(prob.objective)

