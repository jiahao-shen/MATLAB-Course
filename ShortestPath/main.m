% main.m

% Dijkstra
G = Inf(6);

for i = 1:length(G)
    G(i, i) = 0;
end

G(1, 2) = 4;
G(1, 3) = 3;
G(2, 4) = 1;
G(2, 5) = 3;
G(3, 2) = 2;
G(3, 4) = 5;
G(3, 5) = 6;
G(4, 5) = 7;
G(4, 6) = 4;
G(5, 6) = 1;

disp('Dijkstra')
[dist, prev] = Dijkstra(G, 1)


% Bellman-Ford
G = Inf(5);

for i = 1:length(G)
    G(i, i) = 0;
end

G(1, 2) = -1;
G(1, 3) = 4;
G(2, 3) = 3;
G(2, 4) = -2;
G(2, 5) = 2;
G(4, 2) = 1;
G(4, 3) = 5;
G(5, 4) = -3;

disp('Bellman-Ford')
[flag, dist, prev] = BellmanFord(G, 1)

% SPFA
G = Inf(6);

for i = 1:length(G)
    G(i, i) = 0;
end

G(1, 2) = 4;
G(1, 3) = 3;
G(2, 4) = 1;
G(2, 5) = 3;
G(3, 2) = 2;
G(3, 4) = 5;
G(3, 5) = 6;
G(4, 5) = 7;
G(4, 6) = 4;
G(5, 6) = 1;

disp('Shortest Path Faster Algorithm')
[dist, prev] = ShortestPathFasterAlgorithm(G, 1)

% Floyd-Warshall
G = Inf(4);

for i = 1:length(G)
    G(i, i) = 0;
end

G(1, 2) = 4;
G(1, 3) = -3;
G(2, 1) = -3;
G(2, 3) = -7;
G(3, 2) = 10;
G(3, 4) = 3;
G(4, 1) = 5;
G(4, 2) = 6;
G(4, 3) = 6;

disp('Floyd-Warshall')
[dist, prev] = FloydWarshall(G)