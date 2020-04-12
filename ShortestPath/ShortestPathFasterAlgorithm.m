function [dist, prev] = ShortestPathFasterAlgorithm(Graph, source)
    n = length(Graph);

    dist = Inf(1, n);
    prev = zeros(1, n);

    dist(source) = 0;
    Q = [source];

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

                    if ~ismember(v, Q)
                        Q = [Q, v];
                    end

                end

            end

        end

    end

end