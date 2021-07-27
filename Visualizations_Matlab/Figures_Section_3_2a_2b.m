clear all; close;



C=[ 0         0    1.0000
         0    0.4980         0
    1.0000    0.6000         0
    0.6353    0.0784    0.1843
     0.1490    0.8588    0.5059
    .0000    0.000         0  
    0.4000    0.2000    1.0000
    ];


style={'-*','--o','-.s',':d'};
color={C(1,:),C(2,:),C(3,:),C(4,:)};
fontsize=12;



%% Tri Diagonal
%DEMO.accuracy(c(.2,.25,.3,.35,.4,.45,.5,.55,.6),type="trid",p=1024,n=100,tol=1e-4,max_iter=10)
lambda=[.2,.25,.3,.35,.4,.45,.5,.55,.6];

f1_squic   =[0.1137 0.3227 0.6772 0.9126 0.9433 0.8942 0.7853 0.6494 0.5498];
f1_equal   =[0.0688 0.2438 0.6920 0.8898 0.8102 0.7394 0.7348 0.6080 0.5313];
f1_glass   =[0.1393 0.3298 0.6800 0.9059 0.9448 0.8996 0.7973 0.6622 0.5566];
f1_bquic   =[0.1393 0.3298 0.6800 0.9059 0.9448 0.8996 0.7973 0.6622 0.5566];


figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250);
plot(lambda,f1_squic   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
plot(lambda,f1_glass   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
plot(lambda,f1_bquic   ,style{4},'color',C(4,:),'LineWidth',2); hold on;
plot(lambda,f1_equal   ,style{2},'color',C(2,:),'LineWidth',2); hold on;

%legend({'\texttt{SQUIC}','\texttt{EQUAL}','\texttt{glasso}'},'interpreter','latex','location','southeast');

ylabel('F1-Score','interpreter','latex','fontsize',18);
xlabel('Scalar Sparsity Parameter ($\lambda$)','interpreter','latex','fontsize',18);
%xticks(lambda)

%legend boxoff
set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')
tightfig;
saveas(gcf,'Figure2a','pdf')

%% Rand 
%DEMO.accuracy(c(.2,.25,.3,.35,.4,.45,.5,.55,.6),type="rand",p=1024,n=100,tol=1e-4,max_iter=10)
lambda=[.2,.25,.3,.35,.4,.45,.5,.55,.6];

f1_squic   =[0.1100 0.2395 0.3719 0.3917 0.3549 0.3239 0.3040 0.2929 0.2886];
f1_equal   =[0.0760 0.2347 0.3728 0.3816 0.3449 0.3183 0.3001 0.2923 0.2878];
f1_glass   =[0.1170 0.2319 0.3668 0.3936 0.3577 0.3262 0.3050 0.2933 0.2889];
f1_bquic   =[0.1170 0.2319 0.3668 0.3936 0.3577 0.3262 0.3050 0.2933 0.2889];


figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250);
plot(lambda,f1_squic   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
plot(lambda,f1_glass   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
plot(lambda,f1_bquic   ,style{4},'color',C(4,:),'LineWidth',2); hold on;
plot(lambda,f1_equal   ,style{2},'color',C(2,:),'LineWidth',2); hold on;

%xticks(lambda)

legend({'SQUIC','glasso','BigQUIC','EQUAL'},'interpreter','latex','location','southeast','fontsize',18);

%ylabel('Runtime (sec)','interpreter','latex')
xlabel('Scalar Sparsity Parameter ($\lambda$)','interpreter','latex','fontsize',18);
%xticks(lambda)

legend boxoff
set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')
tightfig;
saveas(gcf,'Figure2b','pdf')