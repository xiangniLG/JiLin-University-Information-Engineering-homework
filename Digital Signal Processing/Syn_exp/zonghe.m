function varargout = zonghe(varargin)
% ZONGHE MATLAB code for zonghe.fig
%      ZONGHE, by itself, creates a new ZONGHE or raises the existing
%      singleton*.
%
%      H = ZONGHE returns the handle to a new ZONGHE or the handle to
%      the existing singleton*.
%
%      ZONGHE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZONGHE.M with the given input arguments.
%
%      ZONGHE('Property','Value',...) creates a new ZONGHE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zonghe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zonghe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES
% Edit the above text to modify the response to help zonghe
% Last Modified by GUIDE v2.5 05-Apr-2018 20:29:39
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zonghe_OpeningFcn, ...
                   'gui_OutputFcn',  @zonghe_OutputFcn, ...
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


% --- Executes just before zonghe is made visible.
function zonghe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zonghe (see VARARGIN)

% Choose default command line output for zonghe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zonghe wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zonghe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
set(hObject, 'BackgroundColor',[0.10392	0.88824	0.20392]);
Fs=16000;                               %����Ƶ��16000Hz
time=3;                                %¼��ʱ��Ϊ3s
recording=audiorecorder(Fs,8,1);       %¼�������ź� 8000����Ƶ�� 8bit���� 1����
disp('¼����ʼ������ͣ����...');
recordblocking(recording, time);
disp('¼������!');
x= getaudiodata(recording);             %��ȡ¼������
audiowrite('dsp1_material.wav',x,Fs);   %�洢�����ź�

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(hObject, 'BackgroundColor',[0.60392	0.28824	0.80392]);
[y,fs]=audioread('dsp1_material.wav');
axes(handles.axes1);
Y = fft(y);
figure;
plot(y);        title("¼�Ƶ������ź�");    %��ʾ¼��
sound(y,fs);                                                    %����¼��

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
set(hObject, 'BackgroundColor',[0.80392	0.58824	0.80392]);
[z1,fs]=audioread('dsp1_material.wav');
y1=z1(1:18000);         %ѡȡ18000������������
Y1=fft(y1);

wp=0.2*pi;              %ͨ��
ws=0.25*pi;             %���
wdel=ws-wp;             %���ɴ�
N=ceil(8*pi/wdel);      %Hanming��
Wn=(ws+wp)/2;
window=hamming(N+1);    %���N+1�׵ĺ�����
b=fir1(N,Wn/pi,window);
x=fftfilt(b,z1);
figure; plot(x);        title("�˲��������ź�");    %��ʾ¼��
sound(x,fs);
audiowrite('dsp1_material_filtered.wav',x,fs);   %�洢�˲��������ź�

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
set(hObject, 'BackgroundColor',[0.80392	0.58824	0.80392]);
wp=0.2*pi; ws=0.25*pi; 
N=51;fs=8000;
n=[0:1:N-1];
wc=(ws+wp)/2;                           % �����ͨ�Ľ�ֹƵ��
hd=ideal_lp(wc,N);                      % �����ͨ�ĳ弤��Ӧ
w_ham=(hamming(N))';
h=hd.*w_ham;                            % FIR�˲����ĳ弤��Ӧ
[db,mag,pha,w]=freqz_m(h,1);
delta_w=2*pi/1000;
Rp=-(min(db(1:1:wp/delta_w+1)));        % ʵ�ʵ�ͨ��˥��
As=-round(max(db(ws/delta_w+1:1:501))); % ʵ�ʵ����˥��
axes(handles.axes1); 
plot(w*fs/(2*pi),db);
title('������Ӧ��db��');grid;
xlabel('f(Hz)'); ylabel('H(db)');



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
set(hObject, 'BackgroundColor',[0.80392	0.58824	0.80392]);
[z1,fs]=audioread('dsp1_material.wav');
y1=z1(1:18000);
Y1=fft(y1);
    wp=0.2*pi;
ws=0.25*pi;
wdel=ws-wp;
N=ceil(8*pi/wdel);
Wn=(ws+wp)/2;
window=hamming(N+1);
b=fir1(N,Wn/pi,window);
x=fftfilt(b,z1);
X=fft(x,18000);
t1=(0:(length(z1)-1))/fs;
y11=abs(Y1);
y22=abs(X);
y1=y11(1:((length(Y1))/2));
y2=y22(1:((length(X))/2));
n=length(y1);
x1=0:(fs/(2*n)):fs/2-fs/(2*n);
    axes(handles.axes4);
plot(x1,y1);ylabel('value');xlabel('f(Hz)');xlim([0 4000]);
title('�˲�ǰ�ź�Ƶ��');
    axes(handles.axes2);
plot(t1,z1);ylabel('value');xlabel('t(s)');
title('�˲�ǰ�źŲ���');
    axes(handles.axes5);
plot(x1,y2);ylabel('value');xlabel('f(Hz)');xlim([0 4000]);
title('�˲����ź�Ƶ��')
    axes(handles.axes3);
plot(t1,x);ylabel('value');xlabel('t(s)');
title('�˲����źŲ���');




% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
