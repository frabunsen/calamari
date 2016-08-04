%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GUI settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TODO
% o noholes!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function varargout = AFMviewGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @AFMviewGUI_OpeningFcn, ...
    'gui_OutputFcn',  @AFMviewGUI_OutputFcn, ...
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
function varargout = AFMviewGUI_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function About_Menu_Callback(hObject, eventdata, handles)
msg=sprintf(['AFMviewerGUI\r\n MatLab(R) software package for AFM images analysis \r\n v.',...
    '1.0.0 \r\n\r\n Developed by F.Sensi \r\n based on P.Bosco',char(39),'s "AFMGrainAnalyzer" ',...
    '\r\n\r\n\r\n\r\n\r\n Maintainer contact: francesco.sensi@ge.infn.it\r\n University of Genova (IT)  \r\n \r\n  August, 2014']);
msgbox(msg,'About Page','custom',imread([cd ,filesep,'spear.png'])); %imread('/home/sensi/fra@09/AFMGrain/AFMviewerGUI/spear.png')); 
function Imfilter_Menu_Callback(hObject, eventdata, handles)
handles.filter='imfilter';
guidata(hObject,handles);
function Pyramidal_Filter_Callback(hObject, eventdata, handles)
handles.filter='pyramid';
guidata(hObject,handles);
function Filter_Type_Menu_Callback(hObject, eventdata, handles)
handles.filter='none';
guidata(hObject,handles);
function Export_Menu_Callback(hObject, eventdata, handles)
function File_Menu_Callback(hObject, eventdata, handles)
function Options_Menu_Callback(hObject, eventdata, handles)
function None_Filter_Callback(hObject, eventdata, handles)
function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)
function radiobutton4_Callback(hObject, eventdata, handles)
function radiobutton12_Callback(hObject, eventdata, handles)
function radiobutton9_Callback(hObject, eventdata, handles)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Callbacks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function AFMviewGUI_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
resetToStarting(hObject,handles)

handles.imageOpened=0;

handles.filter='imfilter';

handles.noiseValue=0;
handles.eccValue=0;
handles.areaValue=0;
handles.geomValue=1;

handles.L=zeros(512,512);
handles.image=zeros(512,512);

handles.defmsg='MessageBox';


guidata(hObject,handles);


function slider1_Callback(hObject, eventdata, handles)
if handles.imageOpened
    handles=changeValue(hObject,handles,'noise');
    
%     try handles.L;                                          % aggiuinto venersì 17: tapullo per denoise dopo esclusione
%         handles.image(handles.L==0)=0;                      %
%     catch                                                   %
%     end                                                     %
    handles=denoiseImage(handles);                          %
    
    
    handles=objectSelection(handles);
    drawBorders(handles);
    if get(handles.pushbutton6,'Value');
        handles=drawHists(handles);
    else
        handles=drawFibers(handles);
    end
    set(handles.pushbutton9,'Enable','on');
    guidata(hObject,handles)
else
    msg='No image loaded';
    dispMessage(handles,msg);
    set(handles.slider1,'Value',0);
    changeValue(hObject,handles,'noise');
end


function slider2_Callback(hObject, eventdata, handles)
if handles.imageOpened
    handles=changeValue(hObject,handles,'ecc');
    handles=objectSelection(handles);
    drawBorders(handles);
    if get(handles.pushbutton6,'Value');
        handles=drawHists(handles);
    else
        handles=drawFibers(handles);
    end
    set(handles.pushbutton9,'Enable','on');
    guidata(hObject,handles)
else
    msg='No image loaded';
    dispMessage(handles,msg);
    set(handles.slider2,'Value',0);
    changeValue(hObject,handles,'ecc');
end


function slider3_Callback(hObject, eventdata, handles)
if handles.imageOpened
    handles=changeValue(hObject,handles,'area');
    handles=objectSelection(handles);
    drawBorders(handles);
    if get(handles.pushbutton6,'Value');
        handles=drawHists(handles);
    else
        handles=drawFibers(handles);
    end
    set(handles.pushbutton9,'Enable','on');
    guidata(hObject,handles)
else
    msg='No image loaded';
    dispMessage(handles,msg);
    set(handles.slider4,'Value',0);
    changeValue(hObject,handles,'area');
end


function slider4_Callback(hObject, eventdata, handles)
if handles.imageOpened
    handles=changeValue(hObject,handles,'geom');
    handles=objectSelection(handles);
    drawBorders(handles);
    if get(handles.pushbutton6,'Value');
        handles=drawHists(handles);
    else
        handles=drawFibers(handles);
    end
    set(handles.pushbutton9,'Enable','on');
    guidata(hObject,handles)
else
    msg='No image loaded';
    dispMessage(handles,msg);
    set(handles.slider4,'Value',0);
    changeValue(hObject,handles,'geom');
end




function pushbutton2_Callback(hObject, eventdata, handles) % exclude
handles=objectSelection(handles);
axes(handles.axes2);
[x,y]=ginput(1);
Lvalue=handles.L(floor(y),floor(x));

if (Lvalue==0)
    dispMessage(handles,'No object to remove!')
    return
else
    u=nonzeros(unique(handles.L));
    handles.L(handles.L==Lvalue)=0;
    handles.s(u==Lvalue)=[];
    if isempty(handles.s)
        dispMessage(handles,'Operation not permitted: no object would remain!');
        waitforbuttonpress;
        dispMessage(handles,handles.defmsg);
        return
    end
end

handles.bwimage=double(logical(handles.L));axes(handles.axes2);imshow(handles.bwimage); % func drawBW
drawBorders(handles);

if get(handles.pushbutton6,'Value');
    handles=drawHists(handles);
else
    handles=drawFibers(handles);
end

set(handles.pushbutton9,'Enable','on');
guidata(hObject,handles);


function pushbutton4_Callback(hObject, eventdata, handles) % roi
if handles.imageOpened
    axes(handles.axes1);
    BW=roipoly(handles.normimage);
    
    roimage=bwshow(handles.normimage,BW);
    imshow(roimage);
    
    axes(handles.axes2);
    handles.bwimage=bwshow(handles.bwimage,BW);
    imshow(handles.bwimage);
    
    handles=objectSelection(handles);
    drawBorders(handles);
    
    if get(handles.pushbutton6,'Value');
        handles=drawHists(handles); % aggiunto handles venerdì 17
    else
        handles=drawFibers(handles); % aggiunto handles venerdì 17
    end
    set(handles.pushbutton9,'Enable','on');
    guidata(hObject,handles); % aggiunto guidata venerdì 17
else
    dispMessage(handels,'No image loaded!')  % aggiunto if/opened/message venerdì 17
end


function pushbutton3_Callback(hObject, eventdata, handles) % reset
resetToDefault(hObject,handles);
msg='Reset values';
dispMessage(handles,msg);
%waitforbuttonpress
dispMessage(handles,handles.defmsg);


function pushbutton6_Callback(hObject, eventdata, handles)
set(handles.pushbutton6,'Value',1); handles.modsurf=1; % aggiunto 22.10.2014 per selez modality MinorAxis o EquivDiam
set(handles.pushbutton7,'Value',0); handles.modrig=0; % aggiunto 22.10.2014 per selez modality MinorAxis o EquivDiam
handles=objectSelection(handles);
drawHists(handles);
guidata(hObject,handles);           % aggiunto 22.10.2014 per selez modality MinorAxis o EquivDiam

function pushbutton7_Callback(hObject, eventdata, handles)
set(handles.pushbutton6,'Value',0); handles.modsurf=0; % aggiunto 22.10.2014 per selez modality MinorAxis o EquivDiam
set(handles.pushbutton7,'Value',1); handles.modrig=1; % aggiunto 22.10.2014 per selez modality MinorAxis o EquivDiam
handles=objectSelection(handles);
handles=drawFibers(handles);
guidata(hObject,handles);


function pushbutton9_Callback(hObject, eventdata, handles)  % analise(single) object 
handles=objectSelection(handles);
axes(handles.axes2);
[x,y]=ginput(1);
Lvalue=handles.L(floor(y),floor(x));

L=handles.L;
s=handles.s;

if (Lvalue==0)
    dispMessage(handles,'No object to analyse!')
    return
else
    u=nonzeros(unique(handles.L));
    Ltemp=handles.L;
    Ltemp(handles.L~=Lvalue)=0;
    s(u~=Lvalue)=[];
end

drawProfile(s,Ltemp,handles);
waitforbuttonpress;
axes(handles.axes3); cla(handles.axes3,'reset'); if handles.modsurf; hist(handles.h); else hist(handles.perim); end
axes(handles.axes4); cla(handles.axes4,'reset'); if handles.modsurf; hist(handles.w); else hist(handles.end2end); end 
% % grafico axes3 -> profile x e gaussfit(x) fwhm
% % grafico axes4 -> profile x e gaussfit(x) fwhm



% function radiobutton9_Callback(hObject, eventdata, handles)
% if get(handles.radiobutton9,'Value')
%         
%     handles=drawImage(handles,handles.dir,handles.name);
%     handles=denoiseImage(handles);
%     handles=objectSelection(handles);
%     drawBorders(handles);
%     
%     if get(handles.pushbutton6,'Value');
%         handles=drawHists(handles);
%     else
%         handles=drawFibers(handles);
%     end
%     
%     set(handles.pushbutton4,'Enable','on');
%     set(handles.pushbutton2,'Enable','on');
%     set(handles.pushbutton6,'Enable','on');
%     set(handles.pushbutton7,'Enable','on');
%     set(handles.pushbutton3,'Enable','on');
%     
%     set(handles.text25,'string','Height');
%     set(handles.text26,'string','Width');
%        
%     guidata(hObject,handles);
% end


% function radiobutton10_Callback(hObject, eventdata, handles)
% if ~get(hObject,'Value');
% else
%     handles=objectSelection(handles);
%     axes(handles.axes2);
%     [x,y]=ginput(1);
%     Lvalue=handles.L(floor(y),floor(x));
%     
%     if (Lvalue==0)
%         dispMessage(handles,'string','No objectselected!')
%         return
%     else
%         u=nonzeros(unique(handles.L));
%         handles.L(handles.L~=Lvalue)=0;
%     end
%     
%     handles=slashProfile(handles);
%     handles=drawHist(handles);
% end


function Open_File_Menu_Callback(hObject, eventdata, handles)
handles.imageOpened=0;
handles=resetToDefault(hObject,handles);
%handles=resetToStarting(Object,handles);handles=resetToDefault(hObject,handles);

[name,dir]=uigetfile('*','Open File');
updateHistory(dir,name);
dispMessage(handles,['Loading ',name]);
handles.imageOpened=1;

handles=drawImage(handles,dir,name);
handles=denoiseImage(handles);
handles=objectSelection(handles);
drawBorders(handles);

if get(handles.pushbutton6,'Value');
    handles=drawHists(handles);
else
    handles=drawFibers(handles);
end

set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton6,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton3,'Enable','on');
set(handles.pushbutton9,'Enable','on');

set(handles.Export_CSV_Menu,'Enable','on');
set(handles.Export_TXT_Menu,'Enable','on');

handles.dir=dir;
handles.name=name;

guidata(hObject,handles)


function Open_Last_Menu_Callback(hObject, eventdata, handles)
handles.imageOpened=0;
handles=resetToDefault(hObject,handles);

%lastfilebackup=load('/home/sensi/Desktop/afmvieweropenedfileshistory/lastfilesopened.mat');
lastfilebackup=load([cd, filesep,'afmvieweropenedfileshistory',filesep,'lastfilesopened.mat']);
lastfilebackup=lastfilebackup.lastfile;
[name,dir]=uigetfile(lastfilebackup,'Open Last');
dispMessage(handles,['Loading ',name]);
handles.imageOpened=1;

handles=drawImage(handles,dir,name);
handles=denoiseImage(handles);
handles=objectSelection(handles);
drawBorders(handles);

if get(handles.pushbutton6,'Value');
    handles=drawHists(handles);
else
    handles=drawFibers(handles);
end

set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton6,'Enable','on');
set(handles.pushbutton3,'Enable','on');
set(handles.pushbutton9,'Enable','on');

set(handles.Export_CSV_Menu,'Enable','on');
set(handles.Export_TXT_Menu,'Enable','on');

handles.dir=dir;
handles.name=name;

guidata(hObject,handles);


function Close_Menu_Callback(hObject, eventdata, handles)
close all;
quit force;
%closereq;
%close(gcf);
%exit


function Export_CSV_Menu_Callback(hObject, eventdata, handles)
[csvname,csvpath,~]=uiputfile({'*.csv'},'Save statistic in file',strcat('AG--',handles.name,'.csv'));

wh=1; ww=1;
wfwhm=get(handles.radiobutton3,'Value');
wpp=get(handles.radiobutton4,'Value');
wpe=get(handles.radiobutton12,'Value');
sel=logical([wh ww wfwhm wpp wpe]);

if wfwhm==1; 
    fwhm=halfintensityimage(hObject,handles); 
    
    [~,i]=min([handles.w fwhm],[],2);
    a_temp=(i==1);
    fwhm(a_temp)=handles.w(a_temp);   
else
    fwhm=0;
end

labels={'Height','Width','FWHM','Perimeter','EndToEndDistance'};
myheader=labels(sel);
dati={handles.h handles.w fwhm handles.perim handles.end2end};
mydati=dati(sel);
nrows=nnz(sel);


nul=handles.h==0;       % aggiunto venerdì 17: tapullo in attesa di capir xk ci sono ancora degli h<0!!
for ii=1:nnz(sel)
    mydati{ii}(nul)=[];
end


tablecont=' ';
for ii=1:nrows
    eval([myheader{ii} '=mydati{ii};' ]);
    tablecont=[tablecont labels{ii} ','];
end
tablecont(end)=[];
eval(['T=table(',tablecont,')']);

filename=fullfile(csvpath,csvname);
writetable(T,filename);

dispMessage(handles,'File successfully written');
waitforbuttonpress;
dispMessage(handles,handles.defmsg);



function Export_TXT_Menu_Callback(hObject, eventdata, handles)
[txtname,txtpath,~]=uiputfile({'*.txt'},'Save statistic in file',strcat('AG--',handles.name,'.txt'));

wh=1; ww=1; 
wfwhm=get(handles.radiobutton3,'Value');
wpp=get(handles.radiobutton4,'Value');
wpe=get(handles.radiobutton12,'Value');
sel=logical([wh ww wfwhm wpp wpe]);

if wfwhm==1; 
    fwhm=halfintensityimage(hObject,handles); 
    
    [~,i]=min([handles.w fwhm],[],2);
    a_temp=(i==1);
    fwhm(a_temp)=handles.w(a_temp);   
else
    fwhm=0;
end

labels={'Height','Width','FWHM','Perimeter','EndToEndDistance'};
myheader=labels(sel);
dati={handles.h handles.w fwhm handles.perim handles.end2end};
mydati=dati(sel);
nrows=nnz(sel);

nul=handles.h==0;       % aggiunto venerdì 17: tapullo in attesa di capir xk ci sono ancora degli h<0!!
for ii=1:nnz(sel)
    mydati{ii}(nul)=[];
end

fid=fopen(fullfile(txtpath,txtname),'w');
formatheader='';
for ii=1:nrows
    formatheader=[formatheader '%s '];
end
formatheader=[formatheader '\r\n'];

fprintf(fid,formatheader,myheader{1,:});
fclose(fid);

dlmwrite(fullfile(txtpath,txtname),cell2mat(mydati),'delimiter', '\t','-append');

dispMessage(handles,'File successfully written');
waitforbuttonpress;
dispMessage(handles,handles.defmsg);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% My Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dispMessage(handles,msg)
set(handles.text19,'string',msg);

function resetToStarting(hObject,handles)
set(handles.slider1,'Min',0);
set(handles.slider2,'Min',0);
set(handles.slider3,'Min',0);
set(handles.slider4,'Min',0);
set(handles.slider1,'Max',5);
set(handles.slider2,'Max',1);
set(handles.slider3,'Max',1000);
set(handles.slider4,'Max',1);
set(handles.pushbutton7,'Value',1);
set(handles.pushbutton2,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton9,'Enable','off');
set(handles.radiobutton12,'Enable','off');
set(handles.Export_CSV_Menu,'Enable','off');
set(handles.Export_TXT_Menu,'Enable','off');
handles.end2end=0;  % aggiunto veners' 17: tapullo

axes(handles.axes1);
imshow(zeros(512,512));
axes(handles.axes2);
imshow(zeros(512,512));
axes(handles.axes3);
imshow(zeros(512,512));
axes(handles.axes4);
imshow(zeros(512,512));


guidata(hObject,handles);


function handles=resetToDefault(hObject,handles)
set(handles.slider1,'Value',0.4);changeValue(handles.slider1,handles,'noise');
set(handles.slider2,'Value',0);changeValue(handles.slider2,handles,'ecc');
set(handles.slider3,'Value',5);changeValue(handles.slider3,handles,'area');
set(handles.slider4,'Value',1);changeValue(handles.slider4,handles,'geom');
set(handles.pushbutton6,'Value',1); handles.modsurf=1; handles.modrig=0; 
%set(handles.pushbutton6,'Enable','off');
%set(handles.pushbutton7,'Enable','off');




handles.end2end=0;

handles.noiseValue=0.4;
handles.eccValue=0;
handles.areaValue=5;
handles.geomValue=1;

%try handles.imageOpened;
if handles.imageOpened
    handles=drawImage(handles,handles.dir,handles.name);        % aggiuinto venersì 17: tapullo per denoise dopo esclusione
    handles=denoiseImage(handles);
    handles=objectSelection(handles);
    drawBorders(handles);
%catch U
end
%try handles.normimage;
%    drawBorders(handles);
%catch U
%end

dispMessage(handles,handles.defmsg);
guidata(hObject,handles);


function handles=changeValue(hObject,handles,slider)
switch slider
    case 'noise'
        format=['%1.',num2str((true & get(hObject,'Value'))*2),'f'];
        text='text22';
        slider='noiseValue';
        handles.noiseValue=get(hObject,'Value');
    case 'ecc'
        format=['%1.',num2str((true & get(hObject,'Value'))*2),'f'];
        text='text23';
        slider='eccValue';
    case 'area'
        format='%1.0f';
        text='text24';
        slider='areaValue';
    case 'geom'
        format=['%1.',num2str((true & get(hObject,'Value'))*2),'f'];
        text='text35';
        slider='geomValue';
    otherwise
end
set(handles.(text),'string',sprintf(format,get(hObject,'Value')));
handles.(slider)=get(hObject,'Value');

if handles.geomValue <= handles.eccValue;
    handles.geomValue = handles.eccValue + 0.1;
    set(handles.slider4,'Value',handles.geomValue);
    set(handles.text35,'string',sprintf(format,handles.geomValue));
    dispMessage(handles,'Eccentricity Threshold (max) reset!')
    waitforbuttonpress;
end


guidata(hObject,handles)


function handles=drawImage(handles,dir,name)
try
    [image,chinfo]=openNano5(fullfile(dir,name));
catch ME
    try
        [image,chinfo]=openNano51(fullfile(dir,name));
    catch MEE
        try
            [image,chinfo]=openNano52(fullfile(dir,name));
        catch MEEE
            [image,chinfo]=openNano53(fullfile(dir,name));
        end
    end
end

if get(handles.radiobutton9,'Value');
        image=imresize(image,0.5,'cubic');
        dim=size(image);
        cla(handles.axes1,'reset'); imshow(zeros(dim),'InitialMagnification','fit');
else
    cla(handles.axes1,'reset');
end

dim=size(image);
dd=chinfo.Width*chinfo.unit/dim(1);    % aggiunto venerdì 17: era .Width*1000/dim(1)
%kk=chinfo.scaling*1000;
%cc=floor(dim(1)/2);
%image=image(:,:,1);
image=image;
low=min(image(:));
image=image-low;
newlow=min(image(:));
newhigh=max(image(:));
normimage=(image-newlow)/(newhigh+newlow);

axes(handles.axes1);
% imshow(image,[newlow newhigh]);
imshow(normimage);

%axis(handles.axes2);
realsize=sprintf('%.1f%s',chinfo.Width,chinfo.Unit);
set(handles.text31,'string',realsize);

handles.dd=dd;
%handles.kk=kk;
%handles.cc=cc;
handles.name=name;
handles.normimage=normimage;
handles.image=image;
handles.chinfo=chinfo;
handles.newlow=newlow;
handles.newhigh=newhigh;
%guidata(hObject,handles);


function handles=denoiseImage(handles)
dispMessage(handles,'Denoising image...');
switch handles.filter
    case 'imfilter'
        avgimage=imfilter(handles.image,fspecial('disk',30));
        %avgimage=filter2(fspecial('average',30),handles.image);
        stdev=std2(handles.image);
        bwimage=(handles.image>avgimage+handles.noiseValue*stdev);
%     case 'pyramid'
%         avgimage=fourier_Pyramid(handles.image,4,12,handles.noiseValue,1);
%         stdev=std2(handles.image);
%         bwimage=(handles.image>avgimage+handles.noiseValue*stdev);
    case 'none'
        avgimage=zeros(size(handles.image));
        bwimage=(handles.image>quantile(handles.image(:),(handles.noiseValue*19.99)/100));
end
handles.avgimage=avgimage;
handles.bwimage=bwimage;


function handles=objectSelection(handles)
dispMessage(handles,'Selecting objects...')
% axes(handles.axes2)
% imshow(handles.bwimage);

[L,~]=bwlabel(handles.bwimage,8);
S=regionprops(L,handles.image,'Centroid','ConvexArea','Perimeter','Eccentricity','EquivDiameter','MaxIntensity','Orientation','MinorAxisLength');
eccValue=get(handles.slider2,'Value');
areaValue=get(handles.slider3,'Value');
geomValue=get(handles.slider4,'Value');
jj=0;
holes=0; % holes? aggiunto 24.10.2014
s=S(1);
for ii=1:numel(S)
    if (S(ii).ConvexArea>areaValue && S(ii).Eccentricity>eccValue && S(ii).Eccentricity<=geomValue);
        jj=jj+1;
        s(jj)=S(ii);
        %Ltemp=L; Ltemp(Ltemp~=ii)=0;                       % holes? aggiunto 24.10.2014
        %filled = imfill(Ltemp, 'holes');                   % ...
        %holes = filled & ~Ltemp;                           % ...
        %bigholes(jj) = nnz(bwareaopen(holes, 200));        % holes? aggiunto 24.10.2014
        %if bigholes(jj)>0
        %    disp('')
        %end
    else
        L(L==ii)=0;
    end
end

%handles.bwimage=double(logical(L)); axes(handles.axes2); imshow(handles.bwimage);
bwimage=double(logical(L)); axes(handles.axes2); imshow(bwimage);% func drawBw


%handles.bigholes=bigholes;
handles.L=L;
handles.s=s;



function objectModify(hObject,handles)
% forse questo lo deve far separatamen ognuno dei 3 pushbotton



function doAnalysis(hObject,handles)




function bounds=drawBorders(handles)
bounds=bwboundaries(handles.L,8,'noholes');
set(handles.text16,'string',num2str(numel(bounds)));

axes(handles.axes1);
imshow(handles.normimage);hold on;
if numel(bounds)
    for k=1:numel(bounds)
        b = bounds{k};
        plot(b(:,2),b(:,1),'r','LineWidth',0.3);hold on;
    end
    dispMessage(handles,'MessageBox');
else
msg='No object found for selected values';
    dispMessage(handles,msg);
end

set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton6,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton9,'Enable','off');


function handles=drawHists(handles)
dispMessage(handles,'Drawing...')

set(handles.text25,'string','Height [nm]');
set(handles.text26,'string','Width [nm]');

axes(handles.axes2);
% imshow(handles.bwimage);

s=handles.s;
w=[s.EquivDiameter]*handles.dd;w=w';
p=[s.Perimeter]*handles.dd;p=p';
axes(handles.axes4);
cla(handles.axes4,'reset')
if any(w);hist(w,12);else imshow(zeros(512,512));end
set(handles.text14,'string',num2str(mean(w)));
set(handles.text15,'string',num2str(std(w)));
set(handles.text30,'string',num2str(stderr(w)));

cntr=zeros(numel(s),2);
val=zeros(numel(s),1);
int=zeros(numel(s),1);
if numel(s)
    for ii=1:numel(s)
        cntr(ii,:)=s(ii).Centroid;
        val(ii)=handles.avgimage(floor(cntr(ii,1)),floor(cntr(ii,2)));
        int(ii)=s(ii).MaxIntensity;
    end
end
h=(int-val); h(h<0)=0;

axes(handles.axes3);
cla(handles.axes3,'reset')
if any(h);hist(h,12);else imshow(zeros(512,512));end
set(handles.text12,'string',num2str(mean(h)));
set(handles.text13,'string',num2str(std(h)));
set(handles.text29,'string',num2str(stderr(h)));


handles.h=h;
handles.w=w;
handles.perim=p;


set(handles.pushbutton6,'Value',1); handles.modsurf=1;
set(handles.pushbutton7,'Value',0); handles.modrig=0;
set(handles.radiobutton12,'Value',0);
set(handles.radiobutton12,'Enable','off');
dispMessage(handles,handles.defmsg)




function handles=drawFibers(handles)
dispMessage(handles,'Drawing...')

set(handles.text25,'string','Perimeter [nm]');
set(handles.text26,'string','End to End [nm]');

bounds=drawBorders(handles);
C=floor(size(handles.image)/2);

axes(handles.axes2);
imshow(zeros(size(handles.image)));
hold on;

B=[];
p=zeros(1,numel(handles.s));
e=zeros(1,numel(handles.s));
I=zeros(size(handles.image));
for ii=1:size(bounds,1)
    b=bounds{ii};
    u=nonzeros(unique(handles.L));
    [f1,f2]=find(handles.L==u(ii));
    f=[f1,f2];
        
    angle=-handles.s(ii).Orientation;
    first = [1 0 -C(1);0 1 -C(2);0 0 1];
    third = [1 0 C(1);0 1 C(2);0 0 1];
    second = [cosd(angle) -sind(angle) 0;sind(angle) cosd(angle) 0;0 0 1];
    mp_hom = [f ones(length(f),1)];
    rotated_hom = third*second*first*mp_hom'; 
    x_temp=(rotated_hom(2,:)-(rotated_hom(2,1)-C(2)));
    y_temp=(rotated_hom(1,:)-(rotated_hom(1,1)-C(1)));
    plot(x_temp,y_temp,'w','LineWidth',0.3);
   
    x_temp=round(rotated_hom(2,:)-(rotated_hom(2,1)-C(2)));
    y_temp=round(rotated_hom(1,:)-(rotated_hom(1,1)-C(1))); 

    if find(x_temp==0); x_temp(x_temp==0)=1; end
    if find(y_temp==0); y_temp(y_temp==0)=1; end
    if find(x_temp>size(image,2)); x_temp(x_temp>size(image,2))=size(image,2); end
    if find(y_temp>size(image,1)); y_temp(y_temp>size(image,1))=size(image,1); end
    I(x_temp,y_temp)=1+I(x_temp,y_temp);
    B=cat(1,B,[(rotated_hom(2,:)-(rotated_hom(2,1)-C(2)))',(rotated_hom(1,:)-(rotated_hom(1,1)-C(1)))']);
    
       
    p(ii)=handles.s(ii).Perimeter;p=p'; 
    %e(ii)=max(pdist(b,'euclidean'));e=e';
    e(ii)=(pdist([b(1,:);b(ceil(size(b,1)/2),:)],'euclidean'));
    %%d=@(P1,P2) sqrt(   (P1(1)-P2(1))^2  +  (P1(2)-P2(2))^2 );
end

II=bwdist(~I);[L,~]=bwlabel(II,8); s=regionprops(L,II,'MinorAxisLength','MajorAxisLength'); 
r=s.MinorAxisLength/s.MajorAxisLength;
r=sprintf('%.2f',r);
dispMessage(handles,['Rigidity measure = ',r]);

p=p*handles.dd;
e=e*handles.dd;

axes(handles.axes3);
cla(handles.axes3,'reset')
if any(p);hist(p,12);else imshow(zeros(512,512));end
set(handles.text12,'string',num2str(mean(p)));
set(handles.text13,'string',num2str(std(p)));
set(handles.text29,'string',num2str(stderr(p)));
axes(handles.axes4);
cla(handles.axes4,'reset')
if any(e);hist(e,12);else imshow(zeros(512,512));end
set(handles.text14,'string',num2str(mean(e)));
set(handles.text15,'string',num2str(std(e)));
set(handles.text30,'string',num2str(stderr(e)));

%handles.perim=(p*handles.dd)';
handles.end2end=e';
%%handles.end2end(~([handles.bigholes]==0))=0;          % holes? aggiunto 24.10.2014
handles.w=([handles.s.MinorAxisLength]*handles.dd)';

set(handles.pushbutton4,'Enable','on');
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton6,'Enable','on');
set(handles.pushbutton7,'Enable','on');
set(handles.pushbutton9,'Enable','on');
set(handles.radiobutton12,'Enable','on');
set(handles.pushbutton6,'Value',0); handles.modsurf=0;
set(handles.pushbutton7,'Value',1); handles.modrig=1;
%dispMessage(handles,handles.defmsg)


function fwhm=drawProfile(s,Ltemp,handles)
dispMessage(handles,'Drawing...');
u=nonzeros(unique(Ltemp));
if numel(s)
    fwhm=zeros(numel(s),2);
    for ii=1:numel(s)
        Ltemp(Ltemp~=u(ii))=0;
        imagetemp=handles.image;
        imagetemp(~Ltemp)=0;
        mi=find(imagetemp==max(max(imagetemp)));
        [cntr(2) cntr(1)]=ind2sub(size(handles.image),mi(1)); % passa per il max
        
        %%%%% X-line
        X=repmat(floor(mean(ceil(cntr(2)-s(ii).EquivDiameter):floor(cntr(2)+s(ii).EquivDiameter))),...
            size(ceil(cntr(1)-s(ii).EquivDiameter):floor(cntr(1)+s(ii).EquivDiameter))); X(X<=0)=1; X(X>size(handles.image,2))=size(handles.image,2);
        Y=ceil(cntr(1)-s(ii).EquivDiameter):floor(cntr(1)+s(ii).EquivDiameter); Y(Y<=0)=1; Y(Y>size(handles.image,1))=size(handles.image,1);
        
        ind=sub2ind(size(handles.image),X,Y);
        profile=handles.image(ind);
        fwhm(ii)=gaussfit(profile,handles,1);
                
        %%%%% Y-line
        X=ceil(cntr(2)-s(ii).EquivDiameter):floor(cntr(2)+s(ii).EquivDiameter); X(X<=0)=1; X(X>size(handles.image,2))=size(handles.image,2);
        Y=repmat(floor(mean(ceil(cntr(1)-s(ii).EquivDiameter):floor(cntr(1)+s(ii).EquivDiameter))),...
            size(ceil(cntr(2)-s(ii).EquivDiameter):floor(cntr(2)+s(ii).EquivDiameter))); Y(Y<=0)=1; Y(Y>size(handles.image,1))=size(handles.image,1);
        
        ind=sub2ind(size(handles.image),X,Y);
        profile=handles.image(ind);
        fwhm(ii,2)=gaussfit(profile,handles,2);
    end
end
fwhm=fwhm*handles.dd;

dispMessage(handles,handles.defmsg)


function updateHistory(dir,name)
lastfile=fullfile(dir,name);
%residence='/home/sensi/Desktop';
residence=cd ;
hystfolder='afmvieweropenedfileshistory';
hystfile='lastfilesopened.mat';
lastfilebackup=fullfile([residence,filesep,hystfolder,filesep,hystfile]);

if exist(fullfile(residence,hystfolder),'dir')~=7
    msg=mkdir(residence,hystfolder);
    if msg==0
        dispMessage(handles,'Could not create last-openend-file folder');
    end
end
% try
%     fileattrib(fullfile(residence,hystfolder),'+h','','s');
% catch warning
%      disp([warning,': could not hide files-history folder']);
% end
if exist(lastfilebackup,'file')~=0
    %l=load('-mat',lastfilebackup);
    %lastfile=l.lastfile;
    save(lastfilebackup,'lastfile');
else
    save(lastfilebackup,'lastfile');
end


function [msg,seed]=bwregionGrowing(x,y,A)
x=floor(x); y=floor(y);
disp(['Seed coords: (', num2str(x),',',num2str(y),')']);
xx=y;
yy=x;
msg=0;
if A(xx,yy)==0;
    [msg,newx,newy]=search4non0object(x,y,A);
    disp(['...new seed coords: (', num2str(newx),',',num2str(newy),')']);
    xx=newy;
    yy=newx;
end

if msg
   seed=0;
   return 
end
seed=zeros(size(A)); seed(xx,yy)=1;
add2seed=1;
se=strel('disk',1);
while find(add2seed)
    oldseed=seed;
    B=imdilate(seed,se); %imagesc(B);
    addinA=(B & A);  %imagesc(addinA);
    seed=(B & addinA);
    add2seed=(seed ~= oldseed);
end

function stderrx=stderr(x)
stderrx=std(x(:))/sqrt(numel(x(:)));

function [msg,newx,newy]=search4non0object(x,y,A)
% Moves the x,y-coordinates of +/-2 in order to find a non 0 point of A next to the one provided
newx=-999;
newy=-999;
display('No object selected: searching for closest non-zero pixel...');
for ii=-2:1:2
  for jj=-2:1:2
    if( y+ii<0 || x+jj<0 )
      continue;
    end
    g=A(floor(y+ii),floor(x+jj));
    if (g~=0)
      newx=x+jj;
      newy=y+ii;
      break;
    end
  end
end
if (newx==-999 && newy==-999)
    msg='No object found';
    disp(['ALERT!!', msg]);
    return
else
    msg=0;
end


function fwhm=halfintensityimage(hObject,handles)
halfmaximage=zeros(size(handles.image));
Lu=unique(handles.L);Lu(Lu==0)=[];
for ii=1:numel(Lu)
    Ltemp=handles.L;
    baseimagetemp=handles.image;
    Ltemp(handles.L~=Lu(ii))=0;
    baseimagetemp(~Ltemp)=0;
    %baseimagetemp=baseimagetemp-handles.h(ii)/2;
    baseimagetemp=baseimagetemp-handles.s(ii).MaxIntensity/2;
    baseimagetemp(baseimagetemp <= 0)=0;
    halfmaximage=(halfmaximage+baseimagetemp);
end
halfbwimage=logical(halfmaximage);
halfs=regionprops(halfbwimage,halfmaximage,'EquivDiameter','MinorAxisLength','Centroid');
[halfl,~]=bwlabel(halfbwimage,8);

idxl=zeros(2,numel(halfs));
for ii=1:numel(halfs)
    cii=halfs(ii).Centroid;
    a_temp=[ handles.s.Centroid];
    dii=pdist([ [cii'] [ a_temp(1:2:end); a_temp(2:2:end)] ]','euclidean');
    dii=dii(1:numel(Lu));
    [v,y]=min(dii);
    idxl(1,ii)=y;
    idxl(2,ii)=v;
end
idxli=zeros(1,numel(halfs));
for ii=1:numel(Lu)
   b_temp=idxl(2,:);
   if ii==190
       disp('');
   end
   b_temp(~(idxl(1,:)==ii))=100;
   [~,yy]=min(b_temp);
   idxli(yy)=1;
end
halfs(~idxli)=[];

%if get(handles.pushbutton6,'Value') 
if handles.modsurf
    fwhm=[halfs.EquivDiameter]*handles.dd;
%elseif get(handles.pushbutton7,'Value')
elseif handles.modrig
    fwhm=[halfs.MinorAxisLength]*handles.dd;
else                                         % non dovrebbe essercene bisogno!
    fwhm=[halfs.EquivDiameter]*handles.dd;   %
end
fwhm=fwhm';

guidata(hObject,handles);



function fwhm=gaussfit(y,handles,n)
%figure;
y=[ 0 0 mean([0 min(y)]) y mean([0 min(y)]) 0 0 ];
y=smooth(y)';
x=1:numel(y);
%plot(x,y,'o');
%hold on;

d = @(v) sum(( ( v(4) + ( v(3)*exp( -0.5*( (x - v(1)) / (v(2)) ).^2 ) / v(2)*sqrt(2*pi))) - y).^2); % differenza quadratica tra una curva sigmoide e i valori di y

v0 = [mean(x) std(x) 1 0];
par0 = fminsearch(d,v0);
d0=d(par0);

v0 = [mean(x) numel(x)/2 min(y(y>0)) min(y)];
par1 = fminsearch(d,v0);
d1=d(par1);

v0 = [mean(x) std(x) min(y(y>0)) min(y)];
par2 = fminsearch(d,v0);
d2=d(par2);

v0 = [mean(x) std(x) min(y(y>0)) 0];
par3 = fminsearch(d,v0);
d3=d(par3);

v0 = [mean(x) numel(x)/2 min(y(y>0)) min(y)];
par4 = fminsearch(d,v0);
d4=d(par4);

v0 = [mean(x) numel(x)/4 1 min(y)];
y=smooth(y)';
par5 = fminsearch(d,v0);
d5=d(par5);


d=[d0 d1 d2 d3 d4 d5];
par={par0 par1 par2 par3 par4 par5};
[v,i]=sort(d,'ascend');
disp(v)
par=par{i};


if mod(n,2)
    axes(handles.axes3);
else
    axes(handles.axes4);
end
plot(y,'b.');
hold on; plot(x, par(4) + ( par(3)*exp( -0.5*(  (x - par(1)) / (par(2)) ).^2 ) / par(2)*sqrt(2*pi) ),'r');

fwhm=par(2)*2*sqrt(2*log(2))*handles.dd;

text(mean(x)*0.65,mean(y)+0.05,sprintf('%s %1.2f %s','FWHM=',fwhm,' [nm]'),'FontSize',8);


