function varargout = Syn(varargin)
% SYN MATLAB code for Syn.fig
%      SYN, by itself, creates a new SYN or raises the existing
%      singleton*.
%
%      H = SYN returns the handle to a new SYN or the handle to
%      the existing singleton*.
%
%      SYN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYN.M with the given input arguments.
%
%      SYN('Property','Value',...) creates a new SYN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Syn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Syn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Syn

% Last Modified by GUIDE v2.5 09-Apr-2021 16:27:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Syn_OpeningFcn, ...
                   'gui_OutputFcn',  @Syn_OutputFcn, ...
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


% --- Executes just before Syn is made visible.
function Syn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Syn (see VARARGIN)

% Choose default command line output for Syn
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Syn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Syn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current_Obj=get(eventdata.NewValue,'Tag');
axes(handles.axes1);
switch current_Obj
    case 'kj1'
        [x,fs]=audioread('new_recording.wav');
        n=length(x);
        t=(0:(n-1))/fs;
        plot(t,x);
        sound(x,fs);
    case 'kj2'
        [x,fs]=audioread('new_recording.wav');
        n=length(x);
        f=0:(fs/(2*n)):fs/2-fs/(2*n);
        X=fft(x);
        magX=abs(X);
        plot(f,magX);
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'BackgroundColor',[0.10392	0.88824	0.20392]);
Fs=16000;                               %抽样频率16000Hz
time=3;                                %录音时间为3s
recording=audiorecorder(Fs,8,1);       %录制语音信号
disp('录音开始，请暂停操作...');
recordblocking(recording, time);
disp('录音结束!');
x= getaudiodata(recording);             %获取录音数据
audiowrite('new_recording.wav',x,Fs);   %存储语音信号


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
current_Obj=get(eventdata.NewValue,'Tag');
switch current_Obj
    case 'kj3'
        wp=0.3*pi; ws=0.4*pi; 
        N=51;fs=16000;
        n=[0:1:N-1];
        wc=(ws+wp)/2;                           % 理想低通的截止频率
        hd=ideal_lp(wc,N);                      % 理想低通的冲激响应
        w_ham=(hamming(N))';
        h=hd.*w_ham;                            % FIR滤波器的冲激响应
        [db,mag,pha,w]=freqz_m(h,1);
        plot(w*fs/(2*pi),db);
        xlabel('f(Hz)'); ylabel('H(db)');
    case 'kj4'
        [x,fs]=audioread('new_recording.wav');
        wp=0.3*pi; ws=0.4*pi; 
        wdel=ws-wp;             %过渡带
        N=ceil(8*pi/wdel);      %Hanming窗
        Wn=(ws+wp)/2;
        window=hamming(N+1);    %设计N+1阶的汉明窗
        b=fir1(N,Wn/pi,window);
        x_af=fftfilt(b,x);
        plot(x_af);             %显示录音
        audiowrite('after_filter.wav',x_af,fs);   %存储滤波后语音信号
        sound(x_af,fs);
    case 'kj5'
        [z1,fs]=audioread('new_recording.wav');
        y1=z1;
        Y1=fft(y1);
        wp=0.3*pi;
        ws=0.4*pi;
        wdel=ws-wp;
        N=ceil(8*pi/wdel);
        Wn=(ws+wp)/2;
        window=hamming(N+1);
        b=fir1(N,Wn/pi,window);
        x=fftfilt(b,z1);
        X=fft(x,length(y1));
        t1=(0:(length(z1)-1))/fs;
        y11=abs(Y1);
        y22=abs(X);
        y1=y11(1:((length(Y1))/2));
        y2=y22(1:((length(X))/2));
        n=length(y1);
        x1=0:(fs/(2*n)):fs/2-fs/(2*n);
        plot(x1,y2);ylabel('value');xlabel('f(Hz)');
end
