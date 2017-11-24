clear;

xx = load("data2.txt");

x = xx(:,1);
y = xx(:,2);
z = xx(:,3);

plot(x,'r');
hold on;
plot(y,'b');
plot(z,'g');



grid on;

xlabel("Time");
ylabel("atai");
legend('X', 'Y', 'Z');
print -depsc walk_stop_walk.eps
