function Fx0 = FZero()
syms L A w m g d v0 real
syms t Fyt Fxt1 Fxt2
Paras = [L A w m g d v0];                             %参数设定
Subs = [1,0.04,4*pi,70,9.8,0.75,1.5];
FF1t1 = int(Fxt1,t,[0,t]);
FF2t1 = int(FF1t1,t,[0,t]);
left1 = (L - A - A*cos(w*t))*Fxt1;
right1 = (m*A*w^2*cos(w*t)+m*g)*(d/2-v0*t-FF2t1/m);
Fx0 = subs(subs(solve(left1==right1,Fxt1),t,0),Paras,Subs);
end