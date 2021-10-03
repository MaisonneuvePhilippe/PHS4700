function [pcm MI aa] = Devoir1(pos, theta, wz, Force) 
% donneés de sortie
pcm = [0; 0; 0];
MI = [0 0 0; 0 0 0; 0 0 0];
aa = [0; 0; 0];

% données de la fusée

cylinder_volumic_mass = 4000; % masse volumique du cône et du cylindre
cylinder_height = 10;
cylinder_radius = 1.5; % rayon du cône et du cylindre

cone_height = 3;

%useful ?
%fins_thickness = 0.15; % 15cm = 0.15m
%fins_height = 1.5;
%fins_width = 2.5;

fins_mass = 2000; % 

%Calcul des masses 

%Ailerons
mFins = 4*fins_mass ; %mFins : masse des 4 ailerons

%Cylindre
Vcylinder = cylinder_height*cylinder_radius^2 * ^pi; %Volume du cylindre
mCylinder = cylinder_volumic_mass * Vcylinder ; % Masse du cylindre

%Cône
Vcone = (1/3)*pi*cylinder_radius*cone_height; %Volume du cône
mCone = cylinder_volumic_mass*Vcone ; %Masse du cône

%Fusée (Masse totale)
mRocket = mFins + mCylinder + mCone;

%Calcul de la contribution de chaque élément au centre de masse de la fusée
%Composante z uniquement car référentiel du laboratoire, en y et z il y a une symétrie
z_cmFins = (mFins*(fins_height/2))*(1/mRocket);
z_cmCylinder = (mCylinder*(cylinder_height/2))*(1/mRocket);
z_cmCone = (mCone*(cone_height/4))*(1/mRocket);



%Calcul position centre de masse : pcm 
cm_Rocket = (0; 0; z_cmCone+z_cmCylinder+z_cmFins); %Somme de la contribution de chaque élément qui compose la fusée

pcm=cm_Rocket+pos; % cm_Rocket + pos (donnée en entrée) correct, logique ou bien non ?



end



