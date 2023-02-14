% Simscape(TM) Multibody(TM) version: 5.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 5.0000000000000044 -99.999999999999972];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 -9.5708881433203169e-17];
smiData.RigidTransform(1).ID = 'B[Base_side-1:-:Copy of Copy of Copy of ground1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [119.99999999999997 -1.1368683772161603e-13 -115];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962573];
smiData.RigidTransform(2).ID = 'F[Base_side-1:-:Copy of Copy of Copy of ground1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 5.0000000000000009 0];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[Base_side-2:-:Copy of Copy of Copy of ground1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-124.99999999999999 -100.00000000000011 -114.99999999999991];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931948;  % rad
smiData.RigidTransform(4).axis = [0.57735026918962584 -0.57735026918962584 -0.57735026918962573];
smiData.RigidTransform(4).ID = 'F[Base_side-2:-:Copy of Copy of Copy of ground1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [111.88046022733678 248.75187942320414 272.32997357915559];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'RootGround[Copy of Copy of Copy of ground1-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(2).mass = 0.0;
smiData.Solid(2).CoM = [0.0 0.0 0.0];
smiData.Solid(2).MoI = [0.0 0.0 0.0];
smiData.Solid(2).PoI = [0.0 0.0 0.0];
smiData.Solid(2).color = [0.0 0.0 0.0];
smiData.Solid(2).opacity = 0.0;
smiData.Solid(2).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.25013988746265697;  % kg
smiData.Solid(1).CoM = [108.84712750622774 2.5000000000000004 -46.871644896555068];  % mm
smiData.Solid(1).MoI = [191.01024615636481 1004.1377488229514 814.16975219768074];  % kg*mm^2
smiData.Solid(1).PoI = [0 61.537568862603052 0];  % kg*mm^2
smiData.Solid(1).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'Base_side*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 1.1501700250020108;  % kg
smiData.Solid(2).CoM = [0 5.0452215442026809 -0.12047979425628881];  % mm
smiData.Solid(2).MoI = [3259.1502908964094 9471.9055770161958 6231.954757344969];  % kg*mm^2
smiData.Solid(2).PoI = [-0.0062664510369122572 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'Copy of Copy of Copy of ground1*:*Default';

