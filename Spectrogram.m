function varargout = Spectrogram(varargin)
% SPECTROGRAM MATLAB code for Spectrogram.fig
%      SPECTROGRAM, by itself, creates a new SPECTROGRAM or raises the existing
%      singleton*.
%
%      H = SPECTROGRAM returns the handle to a new SPECTROGRAM or the handle to
%      the existing singleton*.
%
%      SPECTROGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECTROGRAM.M with the given input arguments.
%
%      SPECTROGRAM('Property','Value',...) creates a new SPECTROGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Spectrogram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Spectrogram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Spectrogram

% Last Modified by GUIDE v2.5 26-Nov-2018 11:48:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Spectrogram_OpeningFcn, ...
                   'gui_OutputFcn',  @Spectrogram_OutputFcn, ...
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


% --- Executes just before Spectrogram is made visible.
function Spectrogram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Spectrogram (see VARARGIN)

% Choose default command line output for Spectrogram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global result v1 SampleRate_t
N=512;
Fs = SampleRate_t;
n=0:N-1;  
mf=fft(v1,N);
mag=abs(mf);
f=(0:length(mf)-1)*Fs/length(mf);
h = guihandles;
axes(h.axes1);
plot(f,mag);
set(h.axes1,'ylabel',ylabel('Amplitude'));
set(h.axes1,'xlabel',xlabel('Frequency(HZ)'));
set(h.axes1,'title',title('Original Spectrum'));


% UIWAIT makes Spectrogram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Spectrogram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global result v1 SampleRate_t
Fs = SampleRate_t;
N=512;
str = get(handles.listbox1,'value');
V = v1;
%V = xlsread('byh_ECG_data.xlsx','sheet1','b1:b2500');
switch str
    case 1
        errordlg('Please select a certain spectrum','Hint');
    case 2
        %mf=fft(v1,N);
        mf = fft(V,N);
        mag=abs(mf);
        f=(0:length(mf)-1)*Fs/length(mf);
        axes(handles.axes1);
        plot(f,mag);
        set(handles.axes1,'ylabel',ylabel('Amplitude'));
        set(handles.axes1,'xlabel',xlabel('Frequency(HZ)'));
        set(handles.axes1,'title',title('Original Spectrum'));
    case 3
        mfa = fft(result,N);
        maga = abs(mfa);
        fa=(0:length(mfa)-1)*Fs/length(mfa);
        axes(handles.axes1);
        plot(fa,maga);
        set(handles.axes1,'ylabel',ylabel('Amplitude'));
        set(handles.axes1,'xlabel',xlabel('Frequency(HZ)'));
        set(handles.axes1,'title',title('Filtered Spectrum'));
    case 4
        wn = result;
        P=10*log10(abs(fft(wn).^2)/N);
        f=(0:length(P)-1)/length(P);
        axes(handles.axes1);
        plot(f,P);
        set(handles.axes1,'ylabel',ylabel('Power(dB)'));
        set(handles.axes1,'xlabel',xlabel('Standardized Frequency'));
        set(handles.axes1,'title',title('Power Spectrum(filtered)'));
end


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
