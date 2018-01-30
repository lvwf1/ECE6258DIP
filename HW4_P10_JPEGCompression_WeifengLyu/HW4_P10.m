function varargout = HW4_P10(varargin)
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

% Last Modified by GUIDE v2.5 13-Oct-2017 14:10:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HW4_P10_OpeningFcn, ...
                   'gui_OutputFcn',  @HW4_P10_OutputFcn, ...
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
function HW4_P10_OpeningFcn(hObject, eventdata, handles, varargin)
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
function varargout = HW4_P10_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in Compress.
function Compress_Callback(hObject, eventdata, handles)
% hObject    handle to Compress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img = getimage(handles.axes1);

fun = @(block_struct) dct2(block_struct.data);
img_DCT = blockproc(double(img),[handles.bs handles.bs],fun);

qfun = @(block_struct) round(block_struct.data/handles.q);
XQ = blockproc(img_DCT,[handles.bs handles.bs],qfun);

[XQBitStream, ~] = ImageEncode(XQ);
XQBitRate = length(XQBitStream)/prod(size(XQ));

dqfun = @(block_struct) round(block_struct.data*handles.q);
XQ = blockproc(XQ,[handles.bs handles.bs],dqfun);

ifun = @(block_struct) idct2(block_struct.data);
img_IDCT = blockproc(XQ,[handles.bs handles.bs],ifun);

imshow(uint8(img_IDCT),'Parent',handles.axes1);
fprintf('Bit rate of the compressed image = %0.2f bits/pixel\n',XQBitRate);
MSE = immse(img_IDCT,double(img));
PSNR = psnr(img_IDCT,double(img),255);
fprintf('MSE = %0.2f\n',MSE); 
fprintf('PSNR = %0.2f dB\n',PSNR); 
% --- Executes on button press in radio4.
function radio4_Callback(hObject, eventdata, handles)
% hObject    handle to radio4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio4
handles.bs = 4;
guidata( hObject, handles);


% --- Executes on button press in radio8.
function radio8_Callback(hObject, eventdata, handles)
% hObject    handle to radio8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio8
handles.bs = 8;
guidata( hObject, handles);

% --- Executes on button press in radio16.
function radio16_Callback(hObject, eventdata, handles)
% hObject    handle to radio16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio16
handles.bs = 16;
guidata( hObject, handles);

% --- Executes on button press in radio2.
function radio2_Callback(hObject, eventdata, handles)
% hObject    handle to radio2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio2
handles.bs = 2;
guidata( hObject, handles);

% --- Executes on button press in radio32.
function radio32_Callback(hObject, eventdata, handles)
% hObject    handle to radio32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio32
handles.bs = 32;
guidata( hObject, handles);


function quality_Callback(hObject, eventdata, handles)
% hObject    handle to quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of quality as text
%        str2double(get(hObject,'String')) returns contents of quality as a double
handles.q= str2double(get(hObject,'string'));
guidata( hObject, handles);

% --- Executes during object creation, after setting all properties.
function quality_CreateFcn(hObject, eventdata, handles)
% hObject    handle to quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
