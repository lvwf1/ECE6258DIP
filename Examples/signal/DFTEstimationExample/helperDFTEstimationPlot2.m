function helperDFTEstimationPlot2(ydft, symbol, f, estim_f)
% Plot helper function for the DFTEstimationExample

% Copyright 2014 The MathWorks, Inc.

figure;

for toneChoice=1:12,
    % Plot magnitude of the DFT
    subplot(4,3,toneChoice),stem(estim_f,abs(ydft(:,toneChoice)));
    title(['Symbol "', symbol{toneChoice},'": [',num2str(f(1,toneChoice)),',',num2str(f(2,toneChoice)),']'])
    hgca = gca;
    hgca.XTick = estim_f;
    hgca.XTickLabel = estim_f;
    xlim([650 1550]);
    ylabel('DFT Magnitude');
    if toneChoice>9
        xlabel('Frequency (Hz)');
    end
end
hgcf = gcf;
hgcf.Color = [1 1 1];
hgcf.Position =  [1 1 1280 1024];
annotation(gcf,'textbox', 'Position',[0.28 0.96 0.45 0.026],...
    'EdgeColor',[1 1 1],...
    'String', '\bf Estimation of the frequencies contained in each tone of the telephone pad using Goertzel', ...
    'FitBoxToText','on');


