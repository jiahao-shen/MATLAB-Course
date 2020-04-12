function [dist, prev] = Dijkstra(Graph, source)
    n = length(Graph);

    Q = 1:n;
    dist = Inf(1, n);
    prev = zeros(1, n);

    dist(source) = 0;
    prev(source) = source;

    while ~isempty(Q)
        u = -1;
        t = Inf;

        for i = 1:length(Q)

            if dist(Q(i)) < t
                t = dist(Q(i));
                u = Q(i);
            end

        end

        Q(Q == u) = [];

        for v = 1:n

            if Graph(u, v) ~= Inf

                if dist(u) + Graph(u, v) < dist(v)
                    dist(v) = dist(u) + Graph(u, v);
                    prev(v) = u;
                end

            end

        end

    end

end
