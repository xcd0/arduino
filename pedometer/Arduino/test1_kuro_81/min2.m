clear;

xx = load("data1.txt");

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
print -depsc 81po.eps
