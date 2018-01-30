function varargout = HW3_P11(varargin)
% HW3_P11 MATLAB code for HW3_P11.fig
%      HW3_P11, by itself, creates a new HW3_P11 or raises the existing
%      singleton*.
%
%      H = HW3_P11 returns the handle to a new HW3_P11 or the handle to
%      the existing singleton*.
%
%      HW3_P11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW3_P11.M with the given input arguments.
%
%      HW3_P11('Property','Value',...) creates a new HW3_P11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HW3_P11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HW3_P11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HW3_P11

% Last Modified by GUIDE v2.5 23-Sep-2017 15:12:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW3_P11_OpeningFcn, ...
                   'gui_OutputFcn',  @HW3_P11_OutputFcn, ...
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


% --- Executes just before HW3_P11 is made visible.
function HW3_P11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HW3_P11 (see VARARGIN)

% Choose default command line output for HW3_P11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HW3_P11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HW3_P11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
% hObject    handle to Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile({'*.*','All Files'});
  img=imread([filepath,filename]);
  imshow(img,'Parent',handles.axes1);
  handles.img=img;
  guidata(hObject,handles)

% --- Executes on button press in Refresh.
function Refresh_Callback(hObject, eventdata, handles)
% hObject    handle to Refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 img = handles.img;
 imshow(img,'Parent',handles.axes1);

% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
% hObject    handle to resize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);
imgre = imresize(img,0.5);
imshow(imgre,'Parent',handles.axes1);

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 cla(handles.axes1,'reset');
