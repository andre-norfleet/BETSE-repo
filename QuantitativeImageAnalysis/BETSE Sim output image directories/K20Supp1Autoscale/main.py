import networkx as nx
import numpy as np
import matplotlib.pyplot as plt


G = nx.read_gpickle("RA24_ACinh200_11_4.5.gpickle")

cells = list(G.__dict__["node"].keys())

colors = np.zeros(len(cells))
locations = np.zeros((len(cells), 3))
for i in range(len(cells)):
    cell = cells[i]
    locations[i] = np.asarray(cell.location)
    if cell.state == "U":
        colors[i] = 0
    else:
        colors[i] = 1


plt.scatter(locations[:, 0], locations[:, 1], c=colors)
plt.savefig("output.png")

