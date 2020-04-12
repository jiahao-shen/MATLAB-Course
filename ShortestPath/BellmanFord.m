function [flag, dist, prev] = BellmanFord(Graph, source)
    n = length(Graph);

    flag = false;
    dist = Inf(1, n);
    prev = zeros(1, n);

    dist(source) = 0;
    prev(source) = source;

    for i = 1:n - 1

        for u = 1:n

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

    for u = 1:n

        for v = 1:n

            if Graph(u, v) ~= Inf

                if dist(u) + Graph(u, v) < dist(v)
                    flag = true;
                    break;
                end

            end

        end

    end

end
