function varargout = gui(varargin)

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
global duracion
duracion = 0.5;
%registros: 1,2,4,8
notes=[9 1 1 0;
       9 1 1 1;
       9 1 1 2;
       5 1 0.5 3;
       0 2 0.5 4;
       9 1 1 5;
       5 1 0.5 6;
       0 2 0.5 7;
       9 1 1 8]; %darth vader song for debugging

notes=[];   
   
exit=0;
cam = webcam(1);
img = snapshot(cam);

set(handles.axes2,'visible','on');
axes(handles.axes2);
imshow(zeros(size(img,1),size(img,2)));

global captura
captura=false;

global DTW
DTW=1;

global posiciones
posiciones =[];


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% nothing

% --- Executes on button press in START!.
function pushbutton1_Callback(hObject, eventdata, handles)
set(hObject,'Visible','off');
global cam
global exit
global captura
global notes
global duracion
global DTW
global posiciones
axes(handles.axes2);
img = snapshot(cam);
imshow(flip(img,2));

lin=linspace(1,size(img,1),5);
lin=floor(lin);

while exit==0
    img = snapshot(cam);
    
    if captura
        captura=false;
        [x,y] = position_detection(img,70);
        if (x~=-1)%si no se ha detectado nada
            load('./archivos mat/parametros.mat');
            set(handles.capture_button,'BackgroundColor',[0.5 1 0.1]);
            senal=grabacion(time,Fs,channel,n_bits);
            set(handles.capture_button,'BackgroundColor',[0.6 0.1 0]);
            nota = get_note(senal,DTW,str2num(get(handles.w_value,'String')));

            %y=randi(size(img,1),1,1)
            aux = find(y>lin);
            registro = aux(end);
            if (registro==1) %reverse the position of registers
                registro=4;
            elseif (registro==2)
                registro=3;
            elseif (registro==3)
                registro=2;
            elseif (registro==4)
                registro=1;
            end
            %x=randi(size(img,2),1,1)
            notes = [notes; [nota-1 registro duracion size(img,2)-x]];
            posiciones = [posiciones; [size(img,2)-x y]];
            note_name = translate_note_name(notes(end,1));
            set(handles.last_note,'String',note_name);
        end
    end
        
    img(lin(2:end-1),:,:)=0;
    img=draw_notes(img,posiciones);
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
    set(handles.text2,'Visible','off');
    set(handles.w_value,'Visible','off');
elseif strcmp(opt,'DTW-R')
    DTW=1;
    set(handles.text2,'Visible','on');
    set(handles.w_value,'Visible','on');
end

% --- Executes on button press in CAPTURE.
function capture_button_Callback(hObject, eventdata, handles)
global captura
captura=true;

% --- Executes on button press in PLAY
function pushbutton4_Callback(hObject, eventdata, handles)
global notes
if ~isempty(notes)
    song = calculate_song(sortrows(notes,4));
    sound(song,20500);
end


% --- Executes on button press in CLEAR.
function pushbutton5_Callback(hObject, eventdata, handles)
global notes
global posiciones
notes=[];
posiciones=[];
set(handles.last_note,'String','');


% --- Executes when selected object is changed in NOTE VALUES.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
a = get(hObject, 'String');
global duracion
switch a
    case 'Whole note'
        duracion=4;
    case 'Half note'
        duracion=2;
    case 'Quarter note'
        duracion=1;
    case 'Eighth note'
        duracion=0.5;
end

function w_value_Callback(hObject, eventdata, handles)
%nothing

% --- Executes during object creation, after setting all properties.
function w_value_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ERASE LAST NOTE.
function pushbutton6_Callback(hObject, eventdata, handles)
global notes
global posiciones
notes = notes(1:end-1, :);
posiciones = posiciones(1:end-1,:);
if (~isempty(notes))
    note_name = translate_note_name(notes(end,1));
    set(handles.last_note,'String',note_name);
else
    set(handles.last_note,'String','');
end
