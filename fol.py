# code de tri à bulle ?

# Ecrire une procédure réalisant le tri à bulles d’une liste de données numériques

def tri_a_bulles(liste):
    for j in range(len(liste)-1):
        for i in range(len(liste)-1):
            if liste[i] > liste[i+1]:
                liste[i], liste[i+1] = liste[i+1], liste[i]
    print(liste)

liste = [5,8,2,9,5]
liste = tri_a_bulles(liste)

# ou
def tri(liste):
    while max(liste) != liste[len(liste) - 1] or min(liste) != liste[0]:
        for i in range(len(liste)):
            if i != len(liste) - 1:
                if liste[i] > liste[i + 1]:
                    liste[i + 1], liste[i] = liste[i], liste[i + 1]
    print(liste)


liste = [1, 3, 6, 2, 4, 1, 2, 3, 4, 6, 2, 3, 2, 2, 1, 0]
tri(liste) 
