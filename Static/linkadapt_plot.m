% function linkadaptall

% close all;

%% define the strings used for plot lines.
symbol_plot='sd^vph><+xo*sd^vph><+xo*sd^vph><+xo*'; %% one character represent one plot symbol;
len_symbol=length(symbol_plot);
style_plot='- --: -.'; %% two character represent one line style;
color_plot='k b g c m y r';
font_size=16; line_width=1.6;

% for idx_spd=1:sSpd
for idx_node=1:sNode
for idx_snr=1:sSnr 
for idx_period=1:sPeriodset
for idx_start=1:sStart
    
  Sim.n=Sim.node_set(idx_node);                       % number of nodes in the BSS
  Rate.start=Rate.set(ceil(rand(1,Sim.n)*sRset));  

  Phy.snr=Phy.snr_set(idx_snr);
  Phy.snr_per= snr_per(Phy.snr, Phy.rate_mode);
  
  Arf.sc_min=10; Arf.sc_max=50; Arf.sc_multi=2; 
  Onoe.ratedec_retthr=0.5; %1 default           % variable for onoe, threshold to decrease rate based on retries per pk in a observation window.
  Onoe.rateinc_creditthr=10;     % variable for onoe, thresh on the credits to increase rate.
  Onoe.creditinc_retthr=0.1;     % variable for onoe, thresh on percentage of pks requiring retry to increase or decrease a credit.
  Onoe.period=0.2;                                         % observation time: 1 sec in defaul.
%   v=[50 60 70 80];

  for idx_node=1:sNode
%     for idx_sSpd=1:sSpd
% THR(i)=mean(thr_aarf(idx_spd,idx_node, idx_snr, idx_start));
      if Sim.cal_aarf
      plot_thr_aarf(idx_node)=mean(thr_aarf(idx_node, idx_snr, idx_period, idx_start));
      plot_col_aarf(idx_node)=col_aarf(idx_node, idx_snr, idx_period, idx_start);
      plot_suc_aarf(idx_node)=suc_aarf(idx_node, idx_snr, idx_period, idx_start);
      end
      
%       if Sim.cal_onoe
%       plot_thr_onoe(idx_node)=thr_onoe(idx_node, idx_snr, idx_period, idx_start);
%       plot_col_onoe(idx_node)=col_onoe(idx_node, idx_snr, idx_period, idx_start);
%       plot_suc_onoe(idx_node)=suc_onoe(idx_node, idx_snr, idx_period, idx_start);
%       end
% 
%       if Sim.cal_onoe
%       plot_thr_onoe(idx_node)=thr_onoe(idx_node, idx_snr, idx_period, idx_start);
%       plot_col_onoe(idx_node)=col_onoe(idx_node, idx_snr, idx_period, idx_start);
%       plot_suc_onoe(idx_node)=suc_onoe(idx_node, idx_snr, idx_period, idx_start);
%       end
% 
      if Sim.cal_sample
%        THR(i)=mean(thr_sample(idx_spd,idx_node, idx_snr, idx_start));
      plot_thr_sample(idx_node)=mean(thr_sample(idx_node,idx_snr, idx_period, idx_start));
      plot_col_sample(idx_node)=col_sample(idx_node, idx_snr, idx_period, idx_start);
      plot_suc_sample(idx_node)=suc_sample(idx_node, idx_snr, idx_period, idx_start);
      end
      
  end
% 
%   if Sim.cal_onoe
%       fig_org=1;
%       figure(fig_org+1+idx_start);
%       plot(Sim.node_set, plot_thr_onoe, ['k' symbol_plot( rem(idx_snr, len_symbol) ) style_plot(1+(1-1)*2) style_plot(2+(1-1)*2)], 'LineWidth', line_width); 
%       hold on;      grid on;
%       xlabel('Number of nodes');   ylabel('Throughput');
%       % pause;
%       legend(['SNR: ' num2str(Phy.snr_set(1))] , ['SNR: ' num2str(Phy.snr_set(2))], ['SNR: ' num2str(Phy.snr_set(3))]);
%   end
%   if Sim.cal_sample
%       fig_org=100;
%       figure(fig_org+1+idx_start);
      plot(Sim.node_set, thr_aarf, ['b' symbol_plot( rem(idx_snr, len_symbol) ) style_plot(1+(1-1)*2) style_plot(2+(1-1)*2)], 'LineWidth', line_width); 
       hold on; 
       plot(Sim.node_set,thr_sample, ['g' symbol_plot( rem(idx_snr, len_symbol) ) style_plot(1+(1-1)*2) style_plot(2+(1-1)*2)], 'LineWidth', line_width); 
      hold on;      grid on;
      title('Throughput vs Average speed ');
      xlabel('Number of nodes');   ylabel('System throughput (bits/second)');
      % pause;
      %legend(['SNR: ' num2str(Phy.snr_set(1))] , ['SNR: ' num2str(Phy.snr_set(2))], ['SNR: ' num2str(Phy.snr_set(3))]);
%   end

%   if Sim.cal_aarf
%       fig_org=3;
%       figure(fig_org+1);
%       plot(Sim.node_set, plot_thr_aarf, ['k' symbol_plot( rem(idx_snr, len_symbol) ) style_plot(1+(1-1)*2) style_plot(2+(1-1)*2)], 'LineWidth', line_width); 
%       hold on;
%       grid on;
      xlabel('Number of nodes');
%       ylabel('Throughput');
 

%  xlabel('Average speed of vehicles (Km /h)');   
 ylabel('System throughput (bits/second)');
     legend('aarf','SampleRate');
          hold on; grid on;
end % for idx_start
end % for idx_period
end % for idx_snr  
end % for idx_node
% end % for idx_spd;