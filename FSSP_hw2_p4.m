   %% Time specifications:
   Fm = 1000;                      % samples per second
   dt = 1/Fm;                     % seconds per sample
   StopTime = 0.01;                  % seconds
   t = (0:dt:StopTime-dt)';
   N = size(t,1);
   %% Sine wave:
   Fc = 750;                       % hertz
   m = cos(2*pi*Fm*t);
   x = cos(2*pi*Fc*t);
   %% Fourier Transform:
   X = fftshift(fft(x));
   %% Frequency specifications:
   dF = Fm/N;                      % hertz
   f = -Fm/2:dF:Fm/2-dF;           % hertz
   %% Plot the spectrum:
   figure;
   plot(f,abs(X)/N);
   xlabel('Frequency (in hertz)');
   title('Magnitude Response');
   title('Magnitude Response');