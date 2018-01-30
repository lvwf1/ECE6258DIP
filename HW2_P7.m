function varargout = HW2_P7(varargin)
% HW2_P7 MATLAB code for HW2_P7.fig
%      HW2_P7, by itself, creates a new HW2_P7 or raises the existing
%      singleton*.
%
%      H = HW2_P7 returns the handle to a new HW2_P7 or the handle to
%      the existing singleton*.
%
%      HW2_P7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW2_P7.M with the given input arguments.
%
%      HW2_P7('Property','Value',...) creates a new HW2_P7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HW2_P7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HW2_P7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HW2_P7

% Last Modified by GUIDE v2.5 08-Sep-2017 14:18:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW2_P7_OpeningFcn, ...
                   'gui_OutputFcn',  @HW2_P7_OutputFcn, ...
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


% --- Executes just before HW2_P7 is made visible.
function HW2_P7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HW2_P7 (see VARARGIN)

% Choose default command line output for HW2_P7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HW2_P7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HW2_P7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x1 = get(handles.x1,'String');
x2 = get(handles.x2,'String');
x3 = get(handles.x3,'String');
x4 = get(handles.x4,'String');
 if isempty(x1)|isempty(x2)|isempty(x3)|isempty(x4)
   fprintf('Error: Please enter a complete matrix\n');
 else
   fprintf('Good Matrix, 2D Frequency response shows on the axis\n');
   m1=str2double(x1);
   m2=str2double(x2);
   m3=str2double(x3);
   m4=str2double(x4);
   matrix=[m1,m2;m3,m4];
   freqz2(matrix,256,256);
 end


function x1_Callback(hObject, eventdata, handles)
edit1 = str2double(get(hObject,'String'));
if isnan(edit1) || ~isreal(edit1)
    % Disable the Plot button and change its string to say why
    set(handles.plot_button,'String','Cannot plot f1');
    set(handles.plot_button,'Enable','off');
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject);
else 
    % Enable the Plot button with its original name
    set(handles.plot_button,'String','Plot');
    set(handles.plot_button,'Enable','on');
end
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
edit2 = str2double(get(hObject,'String'));
if isnan(edit2) || ~isreal(edit2)
    % Disable the Plot button and change its string to say why
    set(handles.plot_button,'String','Cannot plot f1');
    set(handles.plot_button,'Enable','off');
    % Give the edit text box focus so user can correct the error
    uicontrol(hObject);
else 
    % Enable the Plot button with its original name
    set(handles.plot_button,'String','Plot');
    set(handles.plot_button,'Enable','on');
end
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in resetbutton.
function resetbutton_Callback(hObject, eventdata, handles)
set(handles.x1,'string','');
set(handles.x2,'string','');
set(handles.x3,'string','');
set(handles.x4,'string','');
cla(handles.axes2,'reset');
% hObject    handle to resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function x3_Callback(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x3 as text
%        str2double(get(hObject,'String')) returns contents of x3 as a double


% --- Executes during object creation, after setting all properties.
function x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x4_Callback(hObject, eventdata, handles)
% hObject    handle to x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x4 as text
%        str2double(get(hObject,'String')) returns contents of x4 as a double


% --- Executes during object creation, after setting all properties.
function x4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
