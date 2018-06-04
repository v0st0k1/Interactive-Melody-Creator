function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 04-Jun-2018 21:35:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.axes2,'visible','off');
global cam 
global exit
global notes % cada fila: nota, registro, duracion, posicion
%registros: 1,2,4,8
notes=[9 1 1 0;
       9 1 1 1;
       9 1 1 2;
       5 1 0.5 3;
       0 2 0.5 4;
       9 1 1 5;
       5 1 0.5 6;
       0 2 0.5 7;
       9 1 1 8]; %do en 4 registros
exit=0;
cam = webcam(1);
img = snapshot(cam);

set(handles.axes2,'visible','on');
axes(handles.axes2);
imshow(zeros(size(img,1),size(img,2)));




% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in START!.
function pushbutton1_Callback(hObject, eventdata, handles)
set(hObject,'Visible','off');
global cam
global exit
axes(handles.axes2);
img = snapshot(cam);
imshow(flip(img,2));

lin=linspace(1,size(img,1),5);
lin=floor(lin);

while exit==0
    img = snapshot(cam);
    
    %here take img for computation before printing
    
    img(lin,:,:)=0;
    imshow(flip(img,2));
    
end
close all;
clear all;


% --- Executes when user attempts to close EXIT_WINDOW.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
global exit
exit=1;
delete(hObject);


% --- Executes when selected object is changed in DTW.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
global DTW
opt = get(hObject,'String');
if strcmp(opt,'DTW')
    DTW=0;
elseif strcmp(opt,'DTW-R')
    DTW=1;
end

% --- Executes on button press in CAPTURE.
function pushbutton3_Callback(hObject, eventdata, handles)


% --- Executes on button press in PLAY
function pushbutton4_Callback(hObject, eventdata, handles)
global notes
if ~isempty(notes)
    notes = sortrows(notes,4);
    song = calculate_song(notes);
    sound(song,20500);
end


% --- Executes on button press in CLEAR.
function pushbutton5_Callback(hObject, eventdata, handles)
global notes
notes=[];
