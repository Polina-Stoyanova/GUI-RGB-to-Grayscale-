function varargout = My_First_GUI(varargin)
% MY_FIRST_GUI MATLAB code for My_First_GUI.fig
%      MY_FIRST_GUI, by itself, creates a new MY_FIRST_GUI or raises the existing
%      singleton*.
%
%      H = MY_FIRST_GUI returns the handle to a new MY_FIRST_GUI or the handle to
%      the existing singleton*.
%
%      MY_FIRST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_FIRST_GUI.M with the given input arguments.
%
%      MY_FIRST_GUI('Property','Value',...) creates a new MY_FIRST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before My_First_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to My_First_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help My_First_GUI

% Last Modified by GUIDE v2.5 08-Nov-2021 15:24:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @My_First_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @My_First_GUI_OutputFcn, ...
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


% --- Executes just before My_First_GUI is made visible.
function My_First_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to My_First_GUI (see VARARGIN)

% Choose default command line output for My_First_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes My_First_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = My_First_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%getting image from file
[filename,pathname]=uigetfile('*','Please select image');
%whether you opened an image
if isequal(filename,0)
disp('User selected cancel');
else
disp(['User selected:',fullfile(pathname,filename)]);
end

full_file=fullfile(pathname,filename);
im=imread(full_file);

setappdata(handles.pushbutton1, 'im', im);
axes(handles.axes1);
imshow(im);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img=getappdata(handles.pushbutton1, 'im');
img_gr=rgb2gray(img);
axes(handles.axes2);
imshow(img_gr);



