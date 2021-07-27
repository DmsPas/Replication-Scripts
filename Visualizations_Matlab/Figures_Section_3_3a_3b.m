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
%DEMO.accuracy_M(type="trid",corrupt_nnz_fac=0,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
%DEMO.accuracy_M(type="trid",corrupt_nnz_fac=2,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
%DEMO.accuracy_M(type="trid",corrupt_nnz_fac=10,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
alpha=[.0001,.1,.2,.3,.4,.5,.6,.7,.8,.9,1];

f1_1=[1.0000 1.0000 0.9999 0.9973 0.9596 0.7862 0.5498 0.5010 0.5002 0.5002 0.5002];
f1_2=[0.5010 0.7600 0.9570 0.9949 0.9595 0.7862 0.5498 0.5010 0.5002 0.5002 0.5002];
f1_3=[0.1673 0.3915 0.8172 0.9858 0.9588 0.7861 0.5498 0.5010 0.5002 0.5002 0.5002];




figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250);
plot(alpha,f1_1   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
plot(alpha,f1_2   ,style{2},'color',C(2,:),'LineWidth',2); hold on;
plot(alpha,f1_3   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
yline(0.9501992,'r-','LineWidth',2)


xticks([.0001,.2,.4,.6,.8,1])
xticklabels({'$10^{-4}$','$0.2$','$0.4$','$0.6$','$0.8$','$1$'})


%legend({'$\alpha=0.05$','$\alpha=0.1$','$\alpha=0.2$'},'interpreter','latex','location','southeast');

ylabel('F1--Score','interpreter','latex','fontsize',18);
xlabel('Bias Parameter ($\eta$)','interpreter','latex','fontsize',18);
%xticks(lambda)

%legend boxoff
set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')
tightfig;
saveas(gcf,'Figure3a','pdf')


%% Rand 
%DEMO.accuracy_M(type="rand",corrupt_nnz_fac=0,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
%DEMO.accuracy_M(type="rand",corrupt_nnz_fac=1,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
%DEMO.accuracy_M(type="rand",corrupt_nnz_fac=10,lambda=.6,alpha_set=seq(from=0.0, to=1, length=10),p=1024,n=100,tol=1e-4,max_iter=10)
alpha=[.0001,.1,.2,.3,.4,.5,.6,.7,.8,.9,1];
 
f1_1=[1.0000 0.8504 0.6653 0.4801 0.3564 0.3040 0.2886 0.2860 0.2860 0.2860 0.2860];
f1_2=[0.5017 0.6230 0.6268 0.4782 0.3564 0.3040 0.2886 0.2860 0.2860 0.2860 0.2860];
f1_3=[0.1677 0.3045 0.5143 0.4721 0.3563 0.3040 0.2886 0.2860 0.2860 0.2860 0.2860];

figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250);
plot(alpha,f1_1   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
plot(alpha,f1_2   ,style{2},'color',C(2,:),'LineWidth',2); hold on;
plot(alpha,f1_3   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
yline(0.3899652,'r-','LineWidth',2)

xticks([.0001,.2,.4,.6,.8,1])
xticklabels({'$10^{-4}$','$0.2$','$0.4$','$0.6$','$0.8$','$1$'})

legend({'$c=0$','$c=2$','$c=10$'},'interpreter','latex','location','northeast','fontsize',18);

%ylabel('Runtime (sec)','interpreter','latex')
xlabel('Bias Parameter ($\eta$)','interpreter','latex','fontsize',18);
%xticks(lambda)

legend boxoff
set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')
tightfig;
saveas(gcf,'Figure3b','pdf')