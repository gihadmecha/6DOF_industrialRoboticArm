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
smiData.RigidTransform(1).translation = [0 -65 2.5000000000000022];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = 'B[link part-1:-:base second link-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [34.499999999999979 -22.155305379090876 2.4999999999999858];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [1 2.7755575615628914e-17 0];
smiData.RigidTransform(2).ID = 'F[link part-1:-:base second link-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 -65 2.5000000000000022];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[link part-2:-:base second link-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-29.5 -22.155305379090883 2.4999999999999787];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 2.7755575615628914e-17 0];
smiData.RigidTransform(4).ID = 'F[link part-2:-:base second link-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [55.809290781408741 80.542713888755955 157.18860729897733];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'RootGround[link part-1]';


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
smiData.Solid(1).mass = 0.080619851138500079;  % kg
smiData.Solid(1).CoM = [0 1.9250679531145718 0];  % mm
smiData.Solid(1).MoI = [80.085879662607425 37.771781283945991 117.52174490014301];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 -0.066501233291188219];  % kg*mm^2
smiData.Solid(1).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'base second link*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.1586590021426981;  % kg
smiData.Solid(2).CoM = [0 30.594019845670598 0];  % mm
smiData.Solid(2).MoI = [489.33039078634033 51.985771389929759 540.65508300067552];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'link part*:*Default';

