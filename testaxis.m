hfig = figure();
ac = axes('units','pixels',...
          'Position',[20 20 420 380],...
          'XLim',[0 20],'YLim',[0 20],...
          'buttondownfcn',@record_event)