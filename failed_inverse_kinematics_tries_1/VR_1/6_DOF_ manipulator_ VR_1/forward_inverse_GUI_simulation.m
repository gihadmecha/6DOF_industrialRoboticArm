
function varargout = forward_inverse_GUI_simulation(varargin)
% FORWARD_INVERSE_GUI_SIMULATION MATLAB code for forward_inverse_GUI_simulation.fig
%      FORWARD_INVERSE_GUI_SIMULATION, by itself, creates a new FORWARD_INVERSE_GUI_SIMULATION or raises the existing
%      singleton*.
%
%      H = FORWARD_INVERSE_GUI_SIMULATION returns the handle to a new FORWARD_INVERSE_GUI_SIMULATION or the handle to
%      the existing singleton*.
%
%      FORWARD_INVERSE_GUI_SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORWARD_INVERSE_GUI_SIMULATION.M with the given input arguments.
%
%      FORWARD_INVERSE_GUI_SIMULATION('Property','Value',...) creates a new FORWARD_INVERSE_GUI_SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before forward_inverse_GUI_simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to forward_inverse_GUI_simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help forward_inverse_GUI_simulation

% Last Modified by GUIDE v2.5 08-Oct-2018 22:42:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @forward_inverse_GUI_simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @forward_inverse_GUI_simulation_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before forward_inverse_GUI_simulation is made visible.
function forward_inverse_GUI_simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to forward_inverse_GUI_simulation (see VARARGIN)

% Choose default command line output for forward_inverse_GUI_simulation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes forward_inverse_GUI_simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = forward_inverse_GUI_simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_1 as text
%        str2double(get(hObject,'String')) returns contents of theta_1 as a double


% --- Executes during object creation, after setting all properties.
function theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_2 as text
%        str2double(get(hObject,'String')) returns contents of theta_2 as a double


% --- Executes during object creation, after setting all properties.
function theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_3 as text
%        str2double(get(hObject,'String')) returns contents of theta_3 as a double


% --- Executes during object creation, after setting all properties.
function theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_4_Callback(hObject, eventdata, handles)
% hObject    handle to theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_4 as text
%        str2double(get(hObject,'String')) returns contents of theta_4 as a double


% --- Executes during object creation, after setting all properties.
function theta_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_5_Callback(hObject, eventdata, handles)
% hObject    handle to theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_5 as text
%        str2double(get(hObject,'String')) returns contents of theta_5 as a double


% --- Executes during object creation, after setting all properties.
function theta_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_6_Callback(hObject, eventdata, handles)
% hObject    handle to theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_6 as text
%        str2double(get(hObject,'String')) returns contents of theta_6 as a double


% --- Executes during object creation, after setting all properties.
function theta_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_x_x_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_x_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_x_x as text
%        str2double(get(hObject,'String')) returns contents of Rot_x_x as a double


% --- Executes during object creation, after setting all properties.
function Rot_x_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_x_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_x_y_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_x_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_x_y as text
%        str2double(get(hObject,'String')) returns contents of Rot_x_y as a double


% --- Executes during object creation, after setting all properties.
function Rot_x_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_x_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_x_z_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_x_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_x_z as text
%        str2double(get(hObject,'String')) returns contents of Rot_x_z as a double


% --- Executes during object creation, after setting all properties.
function Rot_x_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_x_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_y_x_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_y_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_y_x as text
%        str2double(get(hObject,'String')) returns contents of Rot_y_x as a double


% --- Executes during object creation, after setting all properties.
function Rot_y_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_y_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_y_y_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_y_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_y_y as text
%        str2double(get(hObject,'String')) returns contents of Rot_y_y as a double


% --- Executes during object creation, after setting all properties.
function Rot_y_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_y_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_y_z_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_y_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_y_z as text
%        str2double(get(hObject,'String')) returns contents of Rot_y_z as a double


% --- Executes during object creation, after setting all properties.
function Rot_y_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_y_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_z_x_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_z_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_z_x as text
%        str2double(get(hObject,'String')) returns contents of Rot_z_x as a double


% --- Executes during object creation, after setting all properties.
function Rot_z_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_z_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_z_y_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_z_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_z_y as text
%        str2double(get(hObject,'String')) returns contents of Rot_z_y as a double


% --- Executes during object creation, after setting all properties.
function Rot_z_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_z_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Rot_z_z_Callback(hObject, eventdata, handles)
% hObject    handle to Rot_z_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rot_z_z as text
%        str2double(get(hObject,'String')) returns contents of Rot_z_z as a double


% --- Executes during object creation, after setting all properties.
function Rot_z_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rot_z_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_x_Callback(hObject, eventdata, handles)
% hObject    handle to pos_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_x as text
%        str2double(get(hObject,'String')) returns contents of pos_x as a double


% --- Executes during object creation, after setting all properties.
function pos_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_y_Callback(hObject, eventdata, handles)
% hObject    handle to pos_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_y as text
%        str2double(get(hObject,'String')) returns contents of pos_y as a double


% --- Executes during object creation, after setting all properties.
function pos_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_z_Callback(hObject, eventdata, handles)
% hObject    handle to pos_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_z as text
%        str2double(get(hObject,'String')) returns contents of pos_z as a double


% --- Executes during object creation, after setting all properties.
function pos_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in forward.
function forward_Callback(hObject, eventdata, handles)
% hObject    handle to forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%need to improve these inverse file simulations

%get thetas
%convert to radian
th1 = str2double(handles.theta_1.String)*pi/180; 
th2 = str2double(handles.theta_2.String)*pi/180;
th3 = str2double(handles.theta_3.String)*pi/180;
th4 = str2double(handles.theta_4.String)*pi/180;
th5 = str2double(handles.theta_5.String)*pi/180;
th6 = str2double(handles.theta_6.String)*pi/180;

 %lengths of links in cm
l1 = 10; 
l2 = 30 ;
l3 = 40;
l4 = 0;
l5 = 0;
l6 = 0;

 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2);
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2);
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2);
L4 = Link('d', l3+l4, 'a', 0, 'alpha', -pi/2);
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2);
L6 = Link('d', l5+l6, 'a', 0, 'alpha', 0);
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot');

 %forward kinematics simulations
T = bot.fkine([th1 th2 th3 th4 th5 th6]);            %forward kinematics function from the Robotics toolbox get the desired positon
bot.plot([th1 th2 th3 th4 th5 th6]);                  %plot function

%show position & orientations
%I can't show result positon & orientation
handles.Rot_x_x.String = num2str(floor(T(1,1)));
handles.Rot_x_y.String = num2str(floor(T(2,1)));
handles.Rot_x_z.String = num2str(floor(T(3,1)));
handles.Rot_y_x.String = num2str(floor(T(1,2)));
handles.Rot_y_y.String = num2str(floor(T(2,2)));
handles.Rot_y_z.String = num2str(floor(T(3,2)));
handles.Rot_z_x.String = num2str(floor(T(1,3)));
handles.Rot_z_y.String = num2str(floor(T(2,3)));
handles.Rot_z_z.String = num2str(floor(T(3,3)));
handles.pos_x.String = num2str(floor(T(1,4)));
handles.pos_y.String = num2str(floor(T(2,4)));
handles.pos_z.String = num2str(floor(T(3,4)));

% --- Executes on button press in inverse_button.
function inverse_button_Callback(hObject, eventdata, handles)
% hObject    handle to inverse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%need to improve these inverse simulations

%get position & orientation
x_x = str2double(handles.Rot_x_x.String);
x_y = str2double(handles.Rot_x_y.String);
x_z = str2double(handles.Rot_x_z.String);
y_x = str2double(handles.Rot_y_x.String);
y_y = str2double(handles.Rot_y_y.String);
y_z = str2double(handles.Rot_y_z.String);
z_x = str2double(handles.Rot_z_x.String);
z_y = str2double(handles.Rot_z_y.String);
z_z = str2double(handles.Rot_z_z.String);
px = str2double(handles.pos_x.String);
py = str2double(handles.pos_y.String);
pz = str2double(handles.pos_z.String);

 %the desired position & orientation 
T(1,1) = x_x;   T(1,2) = y_x;   T(1,3) = z_x;   T(1,4) = px;   
T(2,1) = x_y;   T(2,2) = y_y;   T(2,3) = z_y;   T(2,4) = py ;   
T(3,1) = x_z;   T(3,2) = y_z;   T(3,3) = z_z;   T(3,4) = pz;
T(4,1) = 0;   T(4,2) = 0;   T(4,3) = 0;   T(4,4) =  1;

T ;        %print the desired hemogenious transformation matrix

 %lengths of links in cm
l1 = 10 ;
l2 = 30 ;
l3 = 40;
l4 = 0;
l5 = 0;
l6 = 0;

 %build 3_DOF manipulatior using DH_parameter table and object oriented
L1 = Link('d', l1, 'a', 0, 'alpha', pi/2);
L2 = Link('d', 0 , 'a', l2, 'alpha', 0, 'offset', pi/2);
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2);
L4 = Link('d', l3+l4, 'a', 0, 'alpha', -pi/2);
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2, 'offset', -pi/2);
L6 = Link('d', l5+l6, 'a', 0, 'alpha', 0);
bot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'my robot');

 %inverse kinematics simulations 
qi = bot.ikine(T)*180/pi;                  %inverse kinematics function from the Robotics toolbox get the desired joint angles
                                           %convert to degree
%qi = bot.ikine(T, [0 0 0 0 0 0],'mask', [1 1 1 1 1 1])*180/pi; 
bot.plot(qi*pi/180) ;                    %convert to radians 
                                         %plot function 
                                           

 %show thetas
handles.theta_1.String = num2str(floor(qi(1)));
handles.theta_2.String = num2str(floor(qi(2)));
handles.theta_3.String = num2str(floor(qi(3)));
handles.theta_4.String = num2str(floor(qi(4)))
handles.theta_5.String = num2str(floor(qi(5)));
handles.theta_6.String = num2str(floor(qi(6)));
