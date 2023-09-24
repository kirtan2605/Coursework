%----------- Chao Huang --------------------

function dfdt = eq_propulse(t,initial_condition)

    u=3.986005*10^5;
    Re=6378.14;         % Earth Radius

    thrust=4900;                  % [N] engine thrust
    
    dfdt = zeros(size(initial_condition));
    
    %x=x
    %x1=dx/dt
    %dx1/dt = d^2(x)/dt
    
    x  = initial_condition(1); % x
    y  = initial_condition(2); % y
    z  = initial_condition(3); % z
    x1 = initial_condition(4); % x1 = dx/dt
    y1 = initial_condition(5); % y1 = dy/dt
    z1 = initial_condition(6); % z1 = dz/dt

    m  = initial_condition(7); % mass
    
    r=sqrt(x^2+y^2+z^2);

    % calculate orbit perpendicular
    position_vec = [x y z];
    velocity_vec = [x1 y1 z1];
    orb_normal = cross(position_vec,velocity_vec);
    unit_orb_normal = orb_normal/norm(orb_normal);
    %disp(unit_orb_normal);
    
    %calculating force as per location of satellite
    force = thrust*unit_orb_normal*sign(z);
    %disp(force);
        
        dfdt(1) = x1;
        dfdt(2) = y1;
        dfdt(3) = z1;
        dfdt(4) = -u*x/r^3 + force(1)/m/1000;
        dfdt(5) = -u*y/r^3 + force(2)/m/1000;
        dfdt(6) = -u*z/r^3 + force(3)/m/1000; 
        dfdt(7) = 0;
end

