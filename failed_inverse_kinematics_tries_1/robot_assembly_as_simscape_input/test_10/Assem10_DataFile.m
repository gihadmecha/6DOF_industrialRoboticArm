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
smiData.RigidTransform(1).translation = [0 -24.999999999999993 2.5000000000000022];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = 'B[second wrist-1:-:base second wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-39.999999999999986 -22.5 2.5];  % mm
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [-5.5511151231257827e-17 -1 5.5511151231257827e-17];
smiData.RigidTransform(2).ID = 'F[second wrist-1:-:base second wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 -24.999999999999993 2.4999999999999987];  % mm
smiData.RigidTransform(3).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(3).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(3).ID = 'B[second wrist-2:-:base second wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [35.000000000000014 -22.5 2.5000000000000142];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [0 -1 0];
smiData.RigidTransform(4).ID = 'F[second wrist-2:-:base second wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-64.469270643315582 43.866902343400476 73.107190664196523];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'RootGround[base second wrist-1]';


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
smiData.Solid(1).mass = 0.021273871141885357;  % kg
smiData.Solid(1).CoM = [0 12.24564195848173 0];  % mm
smiData.Solid(1).MoI = [10.109094529885928 5.9726245513454987 15.993077951473575];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'second wrist*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.095027935151675527;  % kg
smiData.Solid(2).CoM = [0 1.3932246967225668 0];  % mm
smiData.Solid(2).MoI = [90.834478687713982 58.487755190968436 148.92628414888378];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'base second wrist*:*Default';

