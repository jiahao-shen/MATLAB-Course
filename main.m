[x, y, z] = peaks(50);

subplot(3, 3, 1);
peaks(50);
title('peaks');

subplot(3, 3, 2);
plot3(x, y, z);
title('plot3');

subplot(3, 3, 3);
stem3(x, y, z);
title('stem3');

subplot(3, 3, 4);
mesh(x, y, z);
title('mesh')

subplot(3, 3, 5);
meshc(x, y, z);
title('meshc');

subplot(3, 3, 6);
meshz(x, y, z);
title('meshz');

subplot(3, 3, 7);
surf(x, y, z);
title('surf');

subplot(3, 3, 8);
surfc(x, y, z);
title('surfc');

subplot(3, 3, 9);
surfl(x, y, z);
title('surfl');

pause(10);