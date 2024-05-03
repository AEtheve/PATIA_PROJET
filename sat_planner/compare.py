import matplotlib.pyplot as plt
import numpy as np

f = open("asp.out", "r")
lines = f.readlines()
f.close()

temps = []
makespan = []
probleme = []

for line in lines:
    line = line.split()
    makespan.append(float(line[0]))
    temps.append(float(line[1]))
    probleme.append(line[2])

temps, makespan, probleme = zip(*sorted(zip(temps, makespan, probleme)))

# print(temps)
# print(probleme)

x = np.arange(len(probleme))


f2 = open("satp.out", "r")
lines2 = f2.readlines()
f2.close()


temps2 = []
makespan2 = []
probleme2 = []

for line in lines2:
    line = line.split()
    makespan2.append(float(line[0]))
    temps2.append(float(line[1]))
    probleme2.append(line[2])

temps2, makespan2, probleme2 = zip(*sorted(zip(temps2, makespan2, probleme2)))


# on garde les memes problemes:
problem_final = []

for i in range(len(probleme)):
    if probleme[i] in probleme2:
        problem_final.append(probleme[i])


x = np.arange(len(problem_final))

# pour chaque probleme, on met le makespan de asp et de satp
# makespan_final = []
# makespan2_final = []

# for i in range(len(problem_final)):
#     makespan_final.append(makespan[i])
#     makespan2_final.append(makespan2[probleme2.index(problem_final[i])])

# print(makespan_final)
# print(makespan2_final)

# plt.plot(x, makespan_final, label="ASP")
# plt.plot(x, makespan2_final, label="SATP")

temps_final = []
temps2_final = []

for i in range(len(problem_final)):
    temps_final.append(temps[i])
    # temps2_final.append(temps2[probleme2.index(problem_final[i])])
    # on doit diviser par 1000 pour avoir le temps en secondes
    temps2_final.append(temps2[probleme2.index(problem_final[i])]/100)

plt.plot(x, temps_final, label="ASP")
plt.plot(x, temps2_final, label="SATP")


plt.xticks(x, problem_final)

plt.xlabel("Probleme")
plt.ylabel("Temps")
plt.title("Temps vs Probleme")
plt.legend()

plt.show()


# plt.plot(x, makespan, label="Makespan")
# plt.xticks(x, probleme)

# plt.xlabel("Probleme")
# plt.ylabel("Makespan")
# plt.title("Makespan vs Probleme")
# plt.legend()

# plt.show()