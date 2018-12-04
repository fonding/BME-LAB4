function varargout = multiple_fig(varargin)
% MULTIPLE_FIG MATLAB code for multiple_fig.fig
%      MULTIPLE_FIG, by itself, creates a new MULTIPLE_FIG or raises the existing
%      singleton*.
%
%      H = MULTIPLE_FIG returns the handle to a new MULTIPLE_FIG or the handle to
%      the existing singleton*.
%
%      MULTIPLE_FIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTIPLE_FIG.M with the given input arguments.
%
%      MULTIPLE_FIG('Property','Value',...) creates a new MULTIPLE_FIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before multiple_fig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to multiple_fig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help multiple_fig

% Last Modified by GUIDE v2.5 17-Nov-2018 17:27:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @multiple_fig_OpeningFcn, ...
                   'gui_OutputFcn',  @multiple_fig_OutputFcn, ...
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


% --- Executes just before multiple_fig is made visible.
function multiple_fig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to multiple_fig (see VARARGIN)

% Choose default command line output for multiple_fig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global t v1 v2 v3 v result X1 Y1
        h = guihandles;
        axes(h.axes1);
        plot(X1,Y1);
        set(h.axes1,'ylabel',ylabel('Channel 1: Voltage')); 
        grid on;
        hold off;
        axes(h.axes2);
        v1 = v2;
        muscle_f;
        plot(X1,Y1);
        muscle_f;
        set(h.axes2,'ylabel',ylabel('Channel 2: Voltage')); 
        grid on;
        hold off;
        axes(h.axes3);
        v1 = v3;
        muscle_f;
        plot(X1,Y1);
        set(h.axes3,'ylabel',ylabel('Channel 3: Voltage'));
        grid on;
        hold off;

% UIWAIT makes multiple_fig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = multiple_fig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
