function varargout = convolution(varargin)
% Convolution GUI helps illustrates the 2D convolution operation using 
% some basic example functions. 
% This GUI was designed for ECE6258 class.  
% Prof. Ghassan Alregib 
% School of electrical and computer Engineering 
% Georgia Institute of Technology
% Copyright 2015
% If you have any question, or found any bugs contact me: motaz@gatech.edu
% By: Motaz Alfarraj - Last Modified v2.5 25-Aug-2015
% NOTE: Make sure you have the file "***.fig" in the same folder as
% this file. Then run the routine just like any MATLAB code by pressing F5
% or the run botton. 



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @convolution_OpeningFcn, ...
                   'gui_OutputFcn',  @convolution_OutputFcn, ...
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

function convolution_OpeningFcn(hObject, eventdata, handles, varargin)
clc;
 

handles.output = hObject;

guidata(hObject, handles);
update_gui(hObject, eventdata, handles) 
resetall_Callback(hObject, eventdata, handles)

function varargout = convolution_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pop1_Callback(hObject, eventdata, handles)

val = get(handles.pop1,'value'); 

switch(val) 
    case {1,2,3,4,5} 
    set(handles.window1,'visible','On'); 
    set(handles.gain1,'visible','On'); 
    set(handles.text14,'visible','on');
    set(handles.text9,'visible','on');
    set(handles.uipanel1,'Visible','off');
    set(handles.pop_disp,'visible','on'); 
    set(handles.text7,'visible','on');
    
    temp = get(handles.window1,'value');
    if temp == 1
        set(handles.slider1,'Visible','off'); 
        set(handles.text22,'Visible','off'); 
    else 
        set(handles.slider1,'Visible','on'); 
        set(handles.text22,'Visible','on'); 
    end 
    
    case 6
    set(handles.window1,'visible','Off'); 
    set(handles.gain1,'visible','Off'); 
    set(handles.text14,'visible','Off');
    set(handles.text9,'visible','Off');
    set(handles.uipanel1,'Visible','On');
    set(handles.slider1,'Visible','off'); 
    set(handles.text22,'Visible','off'); 
    
    set(handles.pop_disp,'value',1); 
    set(handles.pop_disp,'visible','off'); 
    set(handles.text7,'visible','off');
    case {7,8}
    set(handles.window1,'visible','Off'); 
    set(handles.gain1,'visible','Off'); 
    set(handles.text14,'visible','Off');
    set(handles.text9,'visible','Off');
    set(handles.uipanel1,'Visible','Off'); 
    set(handles.slider1,'Visible','off'); 
    set(handles.text22,'Visible','off'); 
    set(handles.pop_disp,'value',1); 
    set(handles.pop_disp,'visible','off'); 
    set(handles.text7,'visible','off');
    
%     [filename filepath] = uigetfile('*.png;*.jpg;.*jpeg;*.bmp','Choose an image'); 
%     handles.filename=filename; 
%     handles.filepath=filepath; 
%     guidata(hObject,handles)
end 

update_gui(hObject, eventdata, handles) 

function pop1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pop2_Callback(hObject, eventdata, handles)
val = get(handles.pop2,'value'); 

switch(val) 
    case {1,2,3,4,5} 
    set(handles.window2,'visible','On'); 
    set(handles.gain2,'visible','On'); 
    set(handles.text15,'visible','on');
    set(handles.text10,'visible','on');
    set(handles.uipanel2,'Visible','off');
    set(handles.pop_disp,'visible','on'); 
    set(handles.text7,'visible','on');
    
    
    temp = get(handles.window2,'value');
        if temp == 1
            set(handles.slider2,'Visible','off'); 
            set(handles.text23,'Visible','off'); 
        else 
            set(handles.slider2,'Visible','on'); 
            set(handles.text23,'Visible','on'); 
        end 
    
    case 6
    set(handles.window2,'visible','Off'); 
    set(handles.gain2,'visible','Off'); 
    set(handles.text15,'visible','Off');
    set(handles.text10,'visible','Off');
    set(handles.uipanel2,'Visible','On');
    set(handles.slider2,'Visible','off'); 
    set(handles.text23,'Visible','off'); 
    
    set(handles.pop_disp,'value',1); 
    set(handles.pop_disp,'visible','off'); 
    set(handles.text7,'visible','off'); 
    
    case {7,8,9}
    set(handles.window2,'visible','Off'); 
    set(handles.gain2,'visible','Off'); 
    set(handles.text15,'visible','Off');
    set(handles.text10,'visible','Off');
    set(handles.uipanel2,'Visible','Off'); 
    set(handles.slider2,'Visible','off'); 
    set(handles.text23,'Visible','off'); 
      
    set(handles.pop_disp,'value',1); 
    set(handles.pop_disp,'visible','off'); 
    set(handles.text7,'visible','off'); 
end 


update_gui(hObject, eventdata, handles) 


function pop2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gain1_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles) 

function gain1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gain2_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles) 

function gain2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pop_disp_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles) 

function pop_disp_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function window1_Callback(hObject, eventdata, handles)
val = get(handles.window1,'value'); 
if val == 1
    set(handles.slider1,'visible','off');
    set(handles.text22,'visible','off'); 
    
else 
    set(handles.slider1,'visible','on'); 
    set(handles.text22,'visible','on'); 
end 
update_gui(hObject, eventdata, handles) 

function window1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function window2_Callback(hObject, eventdata, handles)
val = get(handles.window2,'value'); 
if val == 1
    set(handles.slider2,'visible','off');
    set(handles.text23,'visible','off'); 
    
else 
    set(handles.slider2,'visible','on'); 
    set(handles.text23,'visible','on'); 
end 
update_gui(hObject, eventdata, handles) 

function window2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_11_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles) 

function box2_11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_12_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_12_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_13_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function box2_13_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_21_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_21_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_22_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_22_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_23_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_23_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_31_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_31_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_32_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_32_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box2_33_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box2_33_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_11_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box1_11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_12_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box1_12_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_13_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function box1_13_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_21_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box1_21_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_22_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box1_22_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_23_Callback(hObject, eventdata, handles)

update_gui(hObject, eventdata, handles)

function box1_23_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_31_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function box1_31_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_32_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function box1_32_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function box1_33_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function box1_33_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function update_gui(hObject, eventdata, handles) 

choise1 = get(handles.pop1, 'value');
win1 = get(handles.window1,'value'); 
var1 = get(handles.slider1,'value'); 

choise2 = get(handles.pop2,'value'); 
win2 = get(handles.window2,'value'); 
var2 = get(handles.slider2,'value'); 

[x1 y1] = meshgrid([-5:0.25:5],[-5:0.25:5]);
x2 = x1; 
y2 = y1; 

switch win1;
    case 1
        window1 = ones(size(x1)-10);
        window1 = padarray(window1,[5,5]); 
    case 2
        window1 =fspecial('gaussian',size(x1),var1);
        window1 = window1/max(window1(:)); 
      
end

switch win2;
    case 1
        window2 = ones(size(x2)-10);
        window2 = padarray(window2,[5,5]); 
      
    case 2
        window2 =fspecial('gaussian',size(x2),var2);
        window2 = window2/max(window2(:)); 
   
end


IMPULSE = zeros(size(x1)); 
IMPULSE(and(x1==0,y1==0))=1; 

STEP = zeros(size(x1)); 
STEP(and(x1>0,y1>0)) = 1; 

COSINE = zeros(size(x1)); 
COSINE = cos(0.5*pi*x1).*cos(0.5*pi*y1); 

SINE = zeros(size(x1)); 
SINE = sin(0.5*pi*x1).*sin(0.5*pi*y1); 

SINC = zeros(size(x1)); 
SINC = sinc(0.5*x1).*sinc(0.5*y1); 

g1 = str2num(get(handles.gain1,'string')); 
g2 = str2num(get(handles.gain2,'string')); 




[x_out y_out] = meshgrid([-10:0.25:10],[-10:0.25:10]);
% Set current data to the selected data set.
switch choise1;
    case 1
        fun1 = g1*window1.*IMPULSE;
    case 2
        fun1 = g1*window1.*STEP;
    case 3
        fun1 = g1*window1.*COSINE; 
    case 4
        fun1 = g1*window1.*SINE; 
    case 5
        fun1 = g1*window1.*SINC; 
    case 6 
        a11 = str2num(get(handles.box1_11,'string')); 
        a12 = str2num(get(handles.box1_12,'string')); 
        a13 = str2num(get(handles.box1_13,'string')); 
        
        a21 = str2num(get(handles.box1_21,'string')); 
        a22 = str2num(get(handles.box1_22,'string')); 
        a23 = str2num(get(handles.box1_23,'string')); 
        
        a31 = str2num(get(handles.box1_31,'string')); 
        a32 = str2num(get(handles.box1_32,'string')); 
        a33 = str2num(get(handles.box1_33,'string')); 
        
        fun1 = g1*[a11 a12 a13; a21, a22,a23; a31,a32,a33]; 
        
        fun1 = flipud((fun1)); 
        [x1 y1] = meshgrid([-1,0,1],[-1,0,1]); 
        
        
    case 7
        fun1 = double(imread('coins.png')); 
%         filename = handles.filename; 
%         filepath = handles.filepath; 
%         
%         fun1 = imread([filepath,filename]);  
        
%         if size(fun1,3)==3
%             fun1 = rgb2gray(fun1); 
%         end
% fun1 = double(fun1); 
         case 8
        fun1 = double(imread('cell.tif')); 
end

    
switch choise2;
    case 1 
       fun2 = g2*window2.*IMPULSE;
    case 2
       fun2 =  g2*window2.*STEP;
    case 3
       fun2 =  g2*window2.*COSINE; 
    case 4
       fun2 =  g2*window2.*SINE; 
    case 5
       fun2 = g2*window2.*SINC; 
       
    case 6
        
        a11 = str2double(get(handles.box2_11,'string')); 
        a12 = str2double(get(handles.box2_12,'string')); 
        a13 = str2double(get(handles.box2_13,'string')); 
        
        a21 = str2double(get(handles.box2_21,'string')); 
        a22 = str2double(get(handles.box2_22,'string')); 
        a23 = str2double(get(handles.box2_23,'string')); 
        
        a31 = str2double(get(handles.box2_31,'string')); 
        a32 = str2double(get(handles.box2_32,'string')); 
        a33 = str2double(get(handles.box2_33,'string')); 
        
        fun2 = g2*[a11 a12 a13; a21, a22,a23; a31,a32,a33]; 
        fun2 = flipud((fun2)); 
        [x2 y2] = meshgrid([-1,0,1],[-1,0,1]); 
        
        
    case 7
      %  fun2 = double(rgb2grey(imread([filepath,filename])));  
     
        fun2 = double(imread('coins.png')); 
    case 8 
        fun2 = double(imread('cell.tif')); 
  
end



output = conv2(fun1,fun2); 
disp_opt = get(handles.pop_disp,'value'); 

temp1 = length(x1)+length(x2)-1; 
temp2 = length(y1)+length(y2)-1; 

temp1 = floor(temp1/2).*0.25;
temp2 = floor(temp2/2).*0.25; 

[x_out y_out] = meshgrid([-temp1:0.25:temp1],[-temp2:0.25:temp2]);


switch disp_opt 
    case 1
    fun1 = uint8(255*(fun1-min(fun1(:)))/(max(fun1(:))-min(fun1(:)))); 
    axes(handles.fig1)
    imagesc(fun1)
    colorbar
    colormap gray
    title('Function 1'); 
    xlabel('m')
    ylabel('n')
    axis square
    axis xy

    axes(handles.fig2)
    imagesc(fun2)
    colorbar
    colormap gray
    title('Function 2'); 
    xlabel('m')
    ylabel('n')
    axis square
    axis xy
    axes(handles.fig_out); 
    
    imagesc(output);
    colorbar
    colormap gray
    title('Output function'); 
    xlabel('m')
    ylabel('n')
    axis square
    axis xy  
    

    case 2 
    axes(handles.fig1)
    surf(x1,y1,fun1)
    title('Function 1') 
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter
    
    axes(handles.fig2)
    surf(x2,y2,fun2)
    title('Function 2')
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter
    
    axes(handles.fig_out); 
	surf(x_out,y_out,output); 
    title('Output function') 
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter
    
    case 3
        
    axes(handles.fig1)
    mesh(x1,y1,fun1)
    title('Function 2') 
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter

    axes(handles.fig2)
    mesh(x2,y2,fun2)
    title('Function 2') 
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter
    
    axes(handles.fig_out); 
    mesh(output);
    title('Output function') 
    xlabel('x-axis')
    ylabel('y-axis');
    zlabel('z-axis'); 
    axis tight
    colormap winter
end 


% Save the handles structure.
guidata(hObject,handles)

function resetall_Callback(hObject, eventdata, handles)


set(handles.pop1,'value',1); 
set(handles.pop2,'value',1); 
set(handles.pop_disp,'value',1); 
set(handles.window1,'value',1); 
set(handles.window2,'value',1);
set(handles.gain1,'string','1'); 
set(handles.gain2,'string','1'); 

set(handles.box1_11,'string','0'); 
set(handles.box1_12,'string','0'); 
set(handles.box1_13,'string','0'); 
set(handles.box1_21,'string','0'); 
set(handles.box1_22,'string','0'); 
set(handles.box1_23,'string','0'); 
set(handles.box1_31,'string','0'); 
set(handles.box1_32,'string','0'); 
set(handles.box1_33,'string','0'); 

set(handles.box2_11,'string','0'); 
set(handles.box2_12,'string','0'); 
set(handles.box2_13,'string','0'); 
set(handles.box2_21,'string','0'); 
set(handles.box2_22,'string','0'); 
set(handles.box2_23,'string','0'); 
set(handles.box2_31,'string','0'); 
set(handles.box2_32,'string','0'); 
set(handles.box2_33,'string','0'); 

set(handles.slider1,'value',10);
set(handles.slider2,'value',10); 
set(handles.slider1,'visible','Off'); 
set(handles.slider2,'visible','Off'); 
set(handles.text22,'visible','off'); 
set(handles.text23,'visible','off'); 

set(handles.uipanel1,'visible','off'); 
set(handles.uipanel2,'visible','off'); 

set(handles.gain1,'enable','On'); 
set(handles.gain2,'enable','On'); 
set(handles.window1,'enable','On'); 
set(handles.window2,'enable','On'); 

update_gui(hObject, eventdata, handles)

function updateall_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function slider1_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider2_Callback(hObject, eventdata, handles)
update_gui(hObject, eventdata, handles)

function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
