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
smiData.RigidTransform(1).translation = [0 5.0000000000000044 0];  % mm
smiData.RigidTransform(1).angle = 1.2325666802993103e-16;  % rad
smiData.RigidTransform(1).axis = [0 1 0];
smiData.RigidTransform(1).ID = 'B[link1-1:-:link1_base-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [189.99999999999989 5.0000000000000426 -85.000000000000028];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [-1.5300654305429866e-17 -0.70710678118654735 -0.70710678118654768];
smiData.RigidTransform(2).ID = 'F[link1-1:-:link1_base-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 5.0000000000000044 0];  % mm
smiData.RigidTransform(3).angle = 1.2325666802993103e-16;  % rad
smiData.RigidTransform(3).axis = [0 1 0];
smiData.RigidTransform(3).ID = 'B[link1-2:-:link1_base-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [189.99999999999989 5.0000000000000258 4.9999999999999707];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [-1.5300654305429866e-17 -0.70710678118654735 -0.70710678118654768];
smiData.RigidTransform(4).ID = 'F[link1-2:-:link1_base-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [283.6818258262964 198.74266678828587 182.14461690011015];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [5.887846720064156e-17 0.70710678118654735 0.70710678118654768];
smiData.RigidTransform(5).ID = 'RootGround[link1_base-4]';


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
smiData.Solid(1).mass = 0.29421896277060933;  % kg
smiData.Solid(1).CoM = [113.67807725411694 2.5000000000000004 -58.261686462449603];  % mm
smiData.Solid(1).MoI = [442.32872286450839 1464.2218581814548 1023.119047661824];  % kg*mm^2
smiData.Solid(1).PoI = [0 93.371997257746202 0];  % kg*mm^2
smiData.Solid(1).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'link1*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.2329235344151549;  % kg
smiData.Solid(2).CoM = [83.410567896005773 2.4999999999999987 -42.530837443008807];  % mm
smiData.Solid(2).MoI = [149.23228723758564 1126.5410786672273 978.27930615637138];  % kg*mm^2
smiData.Solid(2).PoI = [0 -1.2781840314527926 0];  % kg*mm^2
smiData.Solid(2).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'link1_base*:*Default';

