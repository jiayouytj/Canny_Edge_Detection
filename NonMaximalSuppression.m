
function newMagnitudeImage = NonMaximalSuppression(magnitude,orientation)
[YY, XX] = size(magnitude);
newMagnitudeImage = zeros(YY, XX);
tmp = newMagnitudeImage;
% Write your function here
horMag = ( (orientation>(-pi/8)) & (orientation<=(pi/8)) ) | ...
         ( (orientation>(7*pi/8)) | (orientation<=(-7*pi/8)) );
tmp(:,2:XX) = magnitude(:,1:XX-1); %shifted in x direction
comp1 = horMag & ( (magnitude - tmp)>0 ); % Comparison to one side
tmp(:,1:XX-1) = magnitude(:,2:XX);  %shifted in x direcrtion
comp2 = horMag & ( (magnitude - tmp)>0 );
newMagnitudeImage = newMagnitudeImage + magnitude .* ( comp1 & comp2 );


tilt45 = ( (orientation>(pi/8)) & (orientation<=(3*pi/8)) ) | ...
         ( (orientation>(-7*pi/8)) | (orientation<=(-5*pi/8)) );
tmp(2:YY,2:XX) = magnitude(1:YY-1,1:XX-1); %shifted in 45 direction
comp1 = tilt45 & ( (magnitude - tmp)>0 ); % Comparison to one side
tmp(1:YY-1,1:XX-1) = magnitude(2:YY,2:XX);  %shifted in 45-180 direcrtion
comp2 = tilt45 & ( (magnitude - tmp)>0 );
newMagnitudeImage = newMagnitudeImage + magnitude .* ( comp1 & comp2 );



tilt135 = ( (orientation>(5*pi/8)) & (orientation<=(7*pi/8)) ) | ...
         ( (orientation>(-3*pi/8)) | (orientation<=(-pi/8)) );
tmp(2:YY,1:XX-1) = magnitude(1:YY-1,2:XX); %shifted in y direction
comp1 = tilt135 & ( (magnitude - tmp)>0 ); % Comparison to one side
tmp(1:YY-1,2:XX) = magnitude(2:YY,1:XX-1);  %shifted in y direcrtion
comp2 = tilt135 & ( (magnitude - tmp)>0 );
newMagnitudeImage = newMagnitudeImage + magnitude .* ( comp1 & comp2 );



vertical = ( (orientation>(3*pi/8)) & (orientation<=(5*pi/8)) ) | ...
         ( (orientation>(-5*pi/8)) | (orientation<=(-3*pi/8)) );
tmp(2:YY,:) = magnitude(1:YY-1,:); %shifted in 135 direction
comp1 = vertical & ( (magnitude - tmp)>0 ); % Comparison to one side
tmp(1:YY-1,:) = magnitude(2:YY,:);  %shifted in 135-180 direcrtion
comp2 = vertical & ( (magnitude - tmp)>0 );
newMagnitudeImage = newMagnitudeImage + magnitude .* ( comp1 & comp2 );
end