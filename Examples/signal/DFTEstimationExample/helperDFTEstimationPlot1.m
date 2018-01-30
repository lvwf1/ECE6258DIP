function helperDFTEstimationPlot1(tones, symbol, Fs, f)
% Plot helper function for the DFTEstimationExample

% Copyright 2014 The MathWorks, Inc.

N = 800;          % Tones of 100 ms
t   = (0:N-1)/Fs; % 800 samples at Fs

for toneChoice=1:12,
    subplot(4,3,toneChoice),plot(t*1e3,tones(:,toneChoice));
    title(['Symbol "', symbol{toneChoice},'": [',num2str(f(1,toneChoice)),',',num2str(f(2,toneChoice)),']'])
    xlim([0 25]);
    ylabel('Amplitude');
    if toneChoice>9
        xlabel('Time (ms)');
    end
end
hgcf = gcf;
hgcf.Color = [1 1 1];
hgcf.Position =  [1 1 1280 1024];
annotation(gcf,'textbox', 'Position',[0.38 0.96 0.45 0.026],...
    'EdgeColor',[1 1 1],...
    'String', '\bf Time response of each tone of the telephone pad', ...
    'FitBoxToText','on');

