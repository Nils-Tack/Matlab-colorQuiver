% Author: Nils Tack
% Function replacing 'quiver' to plot colored vector fields.
% Variables:    X,Y,U,V -> see quiver documentation
%               maxScale -> value for maximum colorbar value (assuming
%               lower colorbar value is 0
%               vecScale -> scale used to change the length of the vector
%               arrows to increase visibility.

function quiverColor(X,Y,U,V,maxScale,vecScale)
    % compute velocity magnitude
    veloMag = sqrt(U.^2 + V.^2);
    
    % set colorbar and colormap
    colorQuiv = colormap('jet');
    hcb = colorbar;
    hcb.Label.String = 'velocity (m s^{-1})';
    caxis([0 maxScale])
    a=0;
    incr=maxScale/length(colorQuiv);
    
    % Overlay quiver corresponding to each color defined in the colormap
    for i = 1:length(colorQuiv)
        quiver(X(veloMag>=a & veloMag<a+incr),Y(veloMag>=a & veloMag<a+incr),vecScale*U(veloMag>=a & veloMag<a+incr),vecScale*V(veloMag>=a & veloMag<a+incr),0,'Color',colorQuiv(i,:));
        a=a+incr;
    end
    
    % plot remaining vectors with magnitude > than maxScale with max color
    % defined in the colormap
    quiver(X(veloMag>maxScale),Y(veloMag>maxScale),vecScale*U(veloMag>maxScale),vecScale*V(veloMag>maxScale),0,'Color',colorQuiv(end,:));
end