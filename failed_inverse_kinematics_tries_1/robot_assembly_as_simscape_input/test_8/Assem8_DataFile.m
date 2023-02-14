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
smiData.RigidTransform(1).translation = [0 0 2.5000000000000022];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = 'B[base firest wrist-1:-:wright link wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 -45 -43.5];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(2).axis = [-0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(2).ID = 'F[base firest wrist-1:-:wright link wrist-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 0 2.5000000000000022];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = 'B[base firest wrist-1:-:wright link wrist-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [2.1316282072803006e-14 -45 43.500000000000014];  % mm
smiData.RigidTransform(4).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(4).axis = [-0.57735026918962584 0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(4).ID = 'F[base firest wrist-1:-:wright link wrist-2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [22.142110979956414 49.64912183273217 75.941964239185481];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'RootGround[base firest wrist-1]';


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
smiData.Solid(1).mass = 0.03533623904876023;  % kg
smiData.Solid(1).CoM = [0 0.0095640800630399977 0];  % mm
smiData.Solid(1).MoI = [18.918608991023142 25.261441085843593 44.032815747496898];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0.024630086404145327];  % kg*mm^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'base firest wrist*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.11939847818519979;  % kg
smiData.Solid(2).CoM = [0 16.20403736518729 0];  % mm
smiData.Solid(2).MoI = [155.40468453068962 64.289059719083852 219.19625059066848];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.89803921568627454 0.91764705882352937 0.92941176470588238];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'wright link wrist*:*Default';

