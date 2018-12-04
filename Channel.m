function varargout = Channel(varargin)
% CHANNEL MATLAB code for Channel.fig
%      CHANNEL, by itself, creates a new CHANNEL or raises the existing
%      singleton*.
%
%      H = CHANNEL returns the handle to a new CHANNEL or the handle to
%      the existing singleton*.
%
%      CHANNEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHANNEL.M with the given input arguments.
%
%      CHANNEL('Property','Value',...) creates a new CHANNEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Channel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Channel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Channel

% Last Modified by GUIDE v2.5 17-Nov-2018 20:12:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Channel_OpeningFcn, ...
                   'gui_OutputFcn',  @Channel_OutputFcn, ...
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


% --- Executes just before Channel is made visible.
function Channel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Channel (see VARARGIN)

% Choose default command line output for Channel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global SampleRate_t Acqtime_t
set(handles.SampleRate,'string',SampleRate_t);
set(handles.acqtime,'string',Acqtime_t);
% UIWAIT makes Channel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Channel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.text4,'String','Please select a channel !'); 
set(handles.text4,'fontsize',14);
set(handles.text4,'foregroundcolor','r');


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
%handles.listbox2=get(hObject,'Value');
set(handles.text4,'visible','off');
global str t v1 v2 v3
str = get(handles.listbox2,'value');
switch str
    case 1
        errordlg('Please select a channel!','Hint');
    case 2
        axes(handles.axes1);
        plot(t,v1);
        xlabel('Time (s)');
        ylabel('Voltage (V)');
    case 3
        axes(handles.axes1);
        plot(t,v2);
        xlabel('Time (s)');
        ylabel('Voltage (V)');
    case 4
        axes(handles.axes1);
        plot(t,v3);
        xlabel('Time (s)');
        ylabel('Voltage (V)');
    case 5
        str1 = questdlg('Do you like change to a new figure?',...
            'New figure',...
            'Yes','No','Yes');
        switch str1
            case 'Yes'
                multiple_fig;
            case 'No'
                errordlg('please choose another choice or allow to popup a nwe figure!','Hint');
        end
end



% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sampleHz = str2double(get(handles.SampleRate,'string'));
acqSec = str2double(get(handles.acqtime,'string'));
s = daq.createSession('ni');
addAnalogInputChannel(s,'Dev1',0,'Voltage');
addAnalogInputChannel(s,'Dev1',1,'Voltage');
addAnalogInputChannel(s,'Dev1',2,'Voltage');
s.Rate = sampleHz;
s.DurationInSeconds = acqSec;
 global v t v1 v2 v3 
[v,t] = s.startForeground;
v1 = v(:,1);
v2 = v(:,2);
v3 = v(:,3);
%h = guihandles(BMElab);




function SampleRate_Callback(hObject, eventdata, handles)
% hObject    handle to SampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleRate as text
%        str2double(get(hObject,'String')) returns contents of SampleRate as a double


% --- Executes during object creation, after setting all properties.
function SampleRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function acqtime_Callback(hObject, eventdata, handles)
% hObject    handle to acqtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of acqtime as text
%        str2double(get(hObject,'String')) returns contents of acqtime as a double


% --- Executes during object creation, after setting all properties.
function acqtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acqtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
