% Averaging kernel
kk=[1/12 1/6 1/12;1/6 0 1/6;1/12 1/6 1/12];
alpha = 1;% a parameter that reflects the influence of the smoothness term

% Iterations
for i=1:iterations
    % (b)(i)
    % Local averaging kernels of flow vectors
    uAvgK=conv2(u,kk,'same');
    vAvgK=conv2(v,kk,'same');
    
    % Compute flow vectors 
    u= uAvgK-(dIx.*(dIx.*uAvgK+dIy.*vAvgK+dIt))./(dIx.^2+dIy.^2+alpha^2); 
    v= vAvgK-(dIy.*(dIx.*uAvgK+dIy.*vAvgK+dIt))./(dIx.^2+dIy.^2+alpha^2);
end
fprintf('Estimated Flow nan ratio: u = %f, v = %f\n',sum(isnan(u(:)))/numel(u),sum(isnan(v(:)))/numel(v));
fprintf('Estimated Flow inf ratio: u = %f, v = %f\n',sum(isinf(u(:)))/numel(u),sum(isinf(v(:)))/numel(v));
u(isnan(u))=0;
v(isnan(v))=0;