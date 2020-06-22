% FloydWarshall.m
function [dist, prev] = FloydWarshall(Graph)
    n = length(Graph);

    dist = Inf(n);
    prev = zeros(n);

    for u = 1:n

        for v = 1:n

            if Graph(u, v) ~= Inf
                dist(u, v) = Graph(u, v);
                prev(u, v) = u;
            end

        end

    end

    for w = 1:n

        for u = 1:n

            for v = 1:n

                if dist(u, w) + dist(w, v) < dist(u, v)
                    dist(u, v) = dist(u, w) + dist(w, v);
                    prev(u, v) = prev(w, v);
                end

            end

        end

    end

end
