import matplotlib
import osmnx as ox
import numpy as np
import pandas as pd
import networkx as nx
import matplotlib.cm as cm
import matplotlib.pyplot as plt

from time import time
from tqdm import trange
from osmnx.plot import get_edge_colors_by_attr


def download():
    G = ox.graph_from_place('Chaoyang District, Beijing, China',
                            network_type='drive')
    ox.save_graphml(G, filepath='data/Chaoyang.graphml')

    G = ox.graph_from_place('Haidian District, Beijing, China',
                            network_type='drive')
    ox.save_graphml(G, filepath='data/Haidian.graphml')

    G = ox.graph_from_address('北京邮电大学', dist=2000, network_type='all')
    ox.save_graphml(G, filepath='data/BUPT.graphml')

    G = ox.graph_from_place('Beijing, China', which_result=2,
                            network_type='drive')
    ox.save_graphml(G, filepath='data/Beijing.graphml')


def lab_1():
    G = ox.load_graphml('data/BUPT.graphml')
    ec = get_edge_colors_by_attr(G, attr='length', cmap='hsv')
    ox.plot_graph(G, edge_color=ec, figsize=(20, 20))

    G = ox.load_graphml('data/Haidian.graphml')
    ec = get_edge_colors_by_attr(G, attr='length', cmap='hsv')
    ox.plot_graph(G, edge_color=ec, figsize=(20, 20))

    G = ox.load_graphml('data/Beijing.graphml')
    ox.plot_graph(G, figsize=(20, 20))


def lab_2():
    np.random.seed(int(time()))
    G = ox.load_graphml('data/BUPT.graphml')
    print(len(G.nodes))  # 2164
    print(len(G.edges))  # 5226
    src = np.random.choice(G.nodes)
    dst = np.random.choice(G.nodes)
    route = nx.dijkstra_path(G, src, dst, weight='length')
    ox.plot_graph_route(G, route, figsize=(20, 20))


def lab_3():
    np.random.seed(int(time()))
    G = nx.Graph(ox.load_graphml('data/Beijing.graphml'))
    print(len(G.nodes))  # 61525
    print(len(G.edges))  # 90657
    
    iterations = 100
    result = np.zeros((iterations, 3))
    
    def heuristic(u, v):
        x1, y1 = G.nodes[u]['x'], G.nodes[u]['y']
        x2, y2 = G.nodes[v]['x'], G.nodes[v]['y']
        return np.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)
    
    for i in trange(iterations):
        src = np.random.choice(G.nodes)
        dst = np.random.choice(G.nodes)
    
        t = time()
        nx.dijkstra_path(G, src, dst, weight='length')
        result[i][0] = time() - t
    
        t = time()
        nx.bellman_ford_path(G, src, dst, weight='length')
        result[i][1] = time() - t
    
        t = time()
        nx.astar_path(G, src, dst, heuristic, weight='length')
        result[i][2] = time() - t
    
    np.save('out/lab3.npy', result)

    result = np.load('out/lab3.npy')
    x = np.arange(result.shape[0])

    matplotlib.rc('font', **{'size': 24})

    plt.figure(figsize=(12, 9))
    plt.title('Time')
    plt.scatter(x, result[:, 0], color='#5FACFC', label='Dijkstra')
    plt.scatter(x, result[:, 1], color='#D5EB59', label='Bellman-Ford')
    plt.scatter(x, result[:, 2], color='#FA816D', label='A-Star')
    plt.legend(loc='upper right')
    plt.ylabel('Seconds')
    plt.show()

    x = np.arange(result.shape[1])
    y = np.zeros(result.shape[1])
    for i in x:
        y[i] = np.average(result[:, i])

    plt.figure(figsize=(12, 9))
    plt.title('Average Time')
    plt.bar(x[0], y[0], color='#5FACFC')
    plt.bar(x[1], y[1], color='#D5EB59')
    plt.bar(x[2], y[2], color='#FA816D')
    plt.xticks(x, ['Dijktra', 'Bellman-Ford', 'A-Star'])
    plt.ylabel('Seconds')
    plt.show()


def lab_4():
    G = ox.load_graphml('data/Haidian.graphml')
    G_projected = ox.project_graph(G)
    extended_stats = ox.extended_stats(G, ecc=True, bc=True, cc=True)

    def get_color_list(n, color_map='plasma', start=0, end=1):
        return [cm.get_cmap(color_map)(x) for x in np.linspace(start, end, n)]

    def get_node_colors_by_stat(G, data, start=0, end=1):
        df = pd.DataFrame(data=pd.Series(data).sort_values(),
                          columns=['value'])
        df['colors'] = get_color_list(len(df), start=start, end=end)
        df = df.reindex(G.nodes())
        return df['colors'].tolist()

    nc = get_node_colors_by_stat(G_projected,
                                 data=extended_stats['betweenness_centrality'])
    ox.plot_graph(G, figsize=(20, 20), node_color=nc, node_size=20,
                  bgcolor='k', node_zorder=2, edge_linewidth=2,
                  edge_color='#333333')


def lab_5():
    def graph(n, k, p):
        G = nx.watts_strogatz_graph(n, k, p)
        if not nx.is_connected(G):
            return graph(size, k, p)
        return G

    iterations = 100
    size = np.arange(1, 6)
    data = np.zeros((iterations, len(size)))
    for i in trange(iterations):
        for j in size:
            G = graph(j * 100, 10, 0.5)
            t = time()
            nx.floyd_warshall(G)
            data[i][j - 1] = time() - t

    np.save('out/lab5.npy', data)

    x = np.arange(100, 600, 100)
    data = np.load('out/lab5.npy')
    y = np.zeros(5)
    for i in range(5):
        y[i] = np.average(data[:, i])

    matplotlib.rc('font', **{'size': 24})

    plt.figure(figsize=(12, 9))
    plt.title('Average Time')
    plt.plot(x, y, color='#FA816D', linewidth=3)

    plt.xlabel('Network Size')
    plt.xticks(x)
    plt.ylabel('Seconds')
    plt.show()


if __name__ == "__main__":
    download()
    lab_1()
    lab_2()
    lab_3()
    lab_4()
    lab_5()
