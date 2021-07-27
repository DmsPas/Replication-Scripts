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
fontsize=16;



%% Tri Diagonal
%DEMO.performance(c(4,16,64,256,1024,4096),type="trid",lambda=0.4,n=100,tol=1e-4,max_iter=10)
p=[4,16,64,256,1024,4096];
        
time_squic   =[0.0060 0.0063 0.0076 0.0131 0.0369 0.1526];
time_equal   =[0.0047 0.0023 0.0068 0.0243 0.2472 5.3215];        
time_glass   =[0.0017 0.0326 0.01454 0.1454 1.2676 10.1779];
time_bquic   =[0.0087 0.0165 0.0222 0.1302 1.3288 28.8036];


% [10 10 350 200]
figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250);
loglog(p,time_squic   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
loglog(p,time_glass   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
loglog(p,time_bquic   ,style{4},'color',C(4,:),'LineWidth',2); hold on;
loglog(p,time_equal   ,style{2},'color',C(2,:),'LineWidth',2); hold on;

%legend({'\texttt{SQUIC}','\texttt{EQUAL}','\texttt{glasso}'},'interpreter','latex','location','southeast');

ylabel('Runtime (sec)','interpreter','latex','fontsize',18);
xlabel('Dimension ($p$)','interpreter','latex','fontsize',18);

xticks(p)
xlim([min(p),max(p)])
yticks([1e-4,1e-2,1e0,1e2,])
ylim([1e-5,1e2])

%legend boxoff

set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')

%set(gcf,'units','points','position',[10 10 420 200]*1);
tightfig;
saveas(gcf,'Figure1a','pdf')


%% Rand 
%DEMO.performance(c(4,16,64,256,1024,4096),type="rand",lambda=0.4,n=100,tol=1e-4,max_iter=10)
p=[4,16,64,256,1024,4096];

time_squic   =[0.0060 0.0061 0.0080 0.0136 0.0315 0.1489];
time_equal   =[0.0005 0.0007 0.0029 0.0249 0.2592 5.0238];
time_glass   =[0.0006 0.0008 0.0016 0.0339 1.2866 23.8773];
time_bquic   =[0.0073 0.0105 0.0242 0.1030 0.7514 17.7881];

% [10 10 240 200]*1.2);
figure('Renderer', 'painters', 'Position', [0 0 1.4 1.2]*250)
loglog(p,time_squic   ,style{1},'color',C(1,:),'LineWidth',2); hold on;
loglog(p,time_glass   ,style{3},'color',C(3,:),'LineWidth',2); hold on;
loglog(p,time_bquic   ,style{4},'color',C(4,:),'LineWidth',2); hold on;
loglog(p,time_equal   ,style{2},'color',C(2,:),'LineWidth',2); hold on;

xticks(p)
xlim([min(p),max(p)])
yticks([1e-4,1e-2,1e0,1e2,])
ylim([1e-5,1e2])


legend({'SQUIC','glasso','BigQUIC','EQUAL'},'interpreter','latex','location','southeast','fontsize',18)

%ylabel('Runtime (sec)','interpreter','latex')
xlabel('Dimension ($p$)','interpreter','latex','fontsize',18);
xticks(p)

xlim([4,4096])

legend boxoff
set(gca,'fontsize',16);
set(gca,'TickLabelInterpreter','latex');
set(gca,'XMinorTick','on','YMinorTick','on')
tightfig;
saveas(gcf,'Figure1b','pdf')