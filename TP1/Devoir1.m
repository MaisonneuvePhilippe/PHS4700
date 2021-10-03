function [pcm MI aa] = Devoir1(pos, theta, wz, Force) 
% donne�s de sortie
pcm = [0; 0; 0];
MI = [0 0 0; 0 0 0; 0 0 0];
aa = [0; 0; 0];

% donn�es de la fus�e

cylinder_volumic_mass = 4000; % masse volumique du c�ne et du cylindre
cylinder_height = 10;
cylinder_radius = 1.5; % rayon du c�ne et du cylindre

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

%C�ne
Vcone = (1/3)*pi*cylinder_radius*cone_height; %Volume du c�ne
mCone = cylinder_volumic_mass*Vcone ; %Masse du c�ne

%Fus�e (Masse totale)
mRocket = mFins + mCylinder + mCone;

%Calcul de la contribution de chaque �l�ment au centre de masse de la fus�e
%Composante z uniquement car r�f�rentiel du laboratoire, en y et z il y a une sym�trie
z_cmFins = (mFins*(fins_height/2))*(1/mRocket);
z_cmCylinder = (mCylinder*(cylinder_height/2))*(1/mRocket);
z_cmCone = (mCone*(cone_height/4))*(1/mRocket);



%Calcul position centre de masse : pcm 
cm_Rocket = (0; 0; z_cmCone+z_cmCylinder+z_cmFins); %Somme de la contribution de chaque �l�ment qui compose la fus�e

pcm=cm_Rocket+pos; % cm_Rocket + pos (donn�e en entr�e) correct, logique ou bien non ?



end



