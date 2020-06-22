# import osmapi

# api = osmapi.OsmApi()
# print(api.NodeGet(123))

import osmnx as ox
import networkx as nx
# G = ox.graph_from_place('Piedmont, CA, USA', network_type='drive')
# G = ox.graph_from_place('beijing, china', network_type='drive')
# G = ox.graph_from_place('Shanghai, China', which_result=2, network_type='drive')
# G = ox.graph_from_address('北京邮电大学', dist=2000, network_type='all')
# G = ox.graph_from_place('Modena, Italy')
G = ox.graph_from_place('Chaoyang District, Beijing, China', network_type='drive')
ox.plot_graph(G)
# G = ox.gdf_from_place('海淀区,北京,中国')


