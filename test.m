syms yi1
x = 0:0.1:pi/2;
interval = 0.1;
sinx0 = 1;
Sinx = [sinx0,zeros(1,length(x)-1)];
left = yi1;
for i = 1:length(x)
% FF2t1 = ConvDoubInt2Itera(t(i),Fx(i),interval);
% Fxt1 = Conv();
right = - ConvDoubInt2Itera(x(i),Sinx(i),interval);
% subs(right,FF2t ,ConvDoubInt2Itera(t(i),Fx(i),interval));
% subs(left,Fxt , Conv());

% right = subs(right,t,T(i));
Sinx(i+1)=solve(left == right,yi1);
end