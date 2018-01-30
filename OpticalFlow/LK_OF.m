% Set the neighborhood size for LK calulcations
%% ww = 5;
w = round(ww/2);

% within window ww * ww
for i = w+1:size(dIx,1)-w
   for j = w+1:size(dIx,2)-w
      % (c)
      dIx_ww = dIx(i-w:i+w, j-w:j+w);
      dIy_ww = dIy(i-w:i+w, j-w:j+w);
      dIt_ww = dIt(i-w:i+w, j-w:j+w);
      
      dIxy=[dIx_ww(:) dIy_ww(:)];
      
      uv=-dIt_ww(:)\dIxy;
      % Compute flow vectors
      u(i,j) = uv(1);
      v(i,j) = uv(2);
   end;
end;
fprintf('Estimated Flow nan ratio: u = %f, v = %f\n',sum(isnan(u(:)))/numel(u),sum(isnan(v(:)))/numel(v));
fprintf('Estimated Flow inf ratio: u = %f, v = %f\n',sum(isinf(u(:)))/numel(u),sum(isinf(v(:)))/numel(v));