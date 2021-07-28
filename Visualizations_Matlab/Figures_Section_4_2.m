% Plotting Figure 4.2 of "Large-Scale Precision Matrix Estimation with SQUIC"

% The raw data
% [1] "==================================="
% [1] "Sec 4.2: LDA with SQUIC"
% [1] "==================================="
%              datasets lambdas time_No_Bias time_Bias ACC_No_Bias ACC_Bias
% burczynski burczynski     0.7     132.7629  189.2455       0.811    0.946
% yeoh             yeoh     0.8       1.2403   12.1725       0.849    0.904
% shipp           shipp     0.8      83.8155   73.6427       0.826    0.957
% alon             alon     0.8      15.7861   21.8589       0.722    0.833
% sorlie         sorlie     0.5       0.0591    0.0296       0.917    0.958


s=(1:5);

% Timings
time_scalar_squic = [132.7629  1.2403 83.8155 15.7861 0.0591];
time_matrix_squic = [189.2455 12.1725 73.6427 21.8589 0.0296];

% Accuracies
acc_scalar_squic  = [0.811 0.849 0.826 0.722 0.917];
acc_matrix_squic  = [0.946 0.904 0.957 0.833 0.958];


% Build the Y-axis
Y_times = [...
   time_scalar_squic(s);
   time_matrix_squic(s);
    ];

Y_acc = [...
   acc_scalar_squic(s);
   acc_matrix_squic(s);
   ];


%X = categorical({'Approx. Inv.','Coord. Desc.','Other'});
X=s;
X_lab={'burczynski','yeoh','shipp','alon','sorlie'};


X_lab(s);


dim=[0 0 1.4 1.2]*250;


%%% TIMES
figure('Renderer', 'painters', 'Position', [0 0 1.6 1.2]*250);
bar(X,Y_times); 
% ylim([0,1e4]);
% title('Block SQUIC','interpreter','latex','fontsize',14);
ylabel('SQUIC Runtime (sec.)','interpreter','latex','fontsize',18)
xticklabels(X_lab);
set(gca,'TickLabelInterpreter', 'latex');
set(gca,'YMinorTick','on');
xlabel('Dataset','interpreter','latex','fontsize',18);
set(gca,'YMinorTick','on', 'FontSize', 16);
%xlim([1.5,6.5]);
% set(gca,'yscale','log')
tightfig;
% breakyaxis([90,120]); 
legend({'Scalar Tuning Parameter','Matrix Tuning Parameter'},'interpreter','latex','location','northeast','fontsize',18)
legend('boxoff') 
% set(gcf,'position',dim);
saveas(gcf,'Figure_4a','pdf');


%%% ACC
figure('Renderer', 'painters', 'Position', [0 0 1.6 1.2]*250);
bar(X,Y_acc); 
ylim([0.5,1]);
ylabel('ACC','interpreter','latex','fontsize',18)
xticklabels(X_lab);
set(gca,'TickLabelInterpreter', 'latex');
set(gca,'YMinorTick','on');
xlabel('Dataset','interpreter','latex','fontsize',18);
set(gca,'YMinorTick','on', 'FontSize', 16);
tightfig;
% legend({'Scalar Tuning Parameter','Matrix Tuning Parameter'},'interpreter','latex','location','northeast','fontsize',11)
% legend('boxoff') 
% set(gcf,'position',dim);
saveas(gcf,'Figure_4b','pdf');
