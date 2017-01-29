\* salad *\
Maximize
OBJ: 41 ingr_carrot + 164 ingr_chickpeas + 16 ingr_lettuce + 884 ingr_oil
 + 40 ingr_spinach + 585 ingr_sunflour + 120 ingr_tofu + 21 ingr_tomato
Subject To
FatRequirement: 0.24 ingr_carrot + 2.6 ingr_chickpeas + 0.2 ingr_lettuce
 + 100 ingr_oil + 0.39 ingr_spinach + 48.7 ingr_sunflour + 5 ingr_tofu
 + 0.33 ingr_tomato >= 10
ProteinRequirement: 0.93 ingr_carrot + 9 ingr_chickpeas + 1.62 ingr_lettuce
 + 2.86 ingr_spinach + 23.4 ingr_sunflour + 16 ingr_tofu + 0.85 ingr_tomato
 >= 15
SaltRequirement: 69 ingr_carrot + 78 ingr_chickpeas + 28 ingr_lettuce
 + 65 ingr_spinach + 3.8 ingr_sunflour + 120 ingr_tofu + 9 ingr_tomato <= 0.2
carbsRequirement: 9.58 ingr_carrot + 27 ingr_chickpeas + 2.37 ingr_lettuce
 + 3.63 ingr_spinach + 15 ingr_sunflour + 3 ingr_tofu + 4.64 ingr_tomato >= 4
percentage: ingr_carrot + ingr_chickpeas + ingr_lettuce + ingr_oil
 + ingr_spinach + ingr_sunflour + ingr_tofu + ingr_tomato = 21.2
End
