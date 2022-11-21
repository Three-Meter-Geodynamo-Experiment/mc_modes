folders ={};
folders{1} = '100312_b0';
folders{2} = '100212_b10';
folders{3} = '100312_b20';
folders{4} = '100312_b40';
folders{5} = '100412_b100';
folders{6} = '100412_b120';
folders{7} = '100212_b160';

Bval = [0,5,10,20,50,60,80];

filename_B = 'B_spectra.gif';
filename_lm = 'B_lm.gif';

for i=1:7
    
    h= openfig(['../' folders{i} '/B_color.fig']);
%     text(0,1.1,[' $E=' num2str(Ek,'%1.1e') '$'],'FontSize',22,'interpreter','latex');
    ylim([0 1.03])
    text(-3.95,1.07,[' $B_{ext}=' num2str(Bval(i)) '~gauss$'],'FontSize',22,'interpreter','latex');
    
    h_lm = openfig(['../' folders{i} '/lm_all.fig']);
    
%     text(-3.95,1.07,[' $B_{ext}=' num2str(Bval(i)) '~gauss$'],'FontSize',22,'interpreter','latex');
        
%     subplot(4,5,3);
%     scatter(NaN,NaN);
%     legend([' $B_{ext}=' num2str(Bval(i)) '~gauss$'],'FontSize',22,'interpreter','latex','location','south');
%     text(0,0,'')
%     text(0.1,0.6,[' $B_{ext}=' num2str(Bval(i)) '~gauss$'],'FontSize',22,'interpreter','latex');

    
    drawnow
    % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,512); 
      
      frame2=getframe(h_lm);
      im2 = frame2im(frame2);
      [imind_lm,cm_lm] = rgb2ind(im2,512); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,filename_B,'gif', 'Loopcount',inf,"DelayTime",1); 
          imwrite(imind_lm,cm_lm,filename_lm,'gif', 'Loopcount',inf,"DelayTime",1); 

      else 
          imwrite(imind,cm,filename_B,'gif','WriteMode','append',"DelayTime",1); 
          imwrite(imind_lm,cm_lm,filename_lm,'gif','WriteMode','append',"DelayTime",1); 

      end 
    
end
