function filtre(tip,p,r,c,Fig) 
f = logspace(1, 6, 100);
w = 2 * pi * f;
switch (tip)
case 1
    title='Filtru trece bandă';
    num= j * r * c * w; 
   den = 1 - w.^ 2 * r ^ 2 * c ^ 2 + 3 * j* w * r * c;
   f0 = 1 / (2 * pi * r *c);
case 2
     title='Filtru oprește bandă';
      num = 1 - 1 * (r * c) ^ 2 * w .^ 2; 
     den = 3 - 3 * (r * c) ^ 2 * w .^ 2 + j * 9 * r * c * w ;
     f0 = 1 / (2 * pi * r * c);
end
w=2*pi*f0;
fig=figure( ...
           'Name','CIRCUITE RC:FTB ȘI FOB', ...
           'NumberTitle','off', ...
           'color',[0.2 0.5 0.8],...
           'Units', 'normalized',...
           'Position', [0.2 0.2 0.5 0.5],...
           'Visible','off');
 h = abs(num ./ den);
gain = 20 * log10(h);
phase =  180 / pi * (angle(num ./ den));

set (gcf, 'UserData', [f(:) gain(:) phase(:)]);
y = get ( gcf, 'UserData');

 if ~isempty(y)
     fr=y(1:p,1);
     g=y(1:p,2);
     ph=y(1:p,3); 
 end
%--------------------------------------------
subplot('Position', [0.4 0.55 0.55 0.35]);
semilogx(fr,g,':g',f0,3,'ob','LineWidth',2);
grid on;
xlabel('Frecventa [Hz]');
ylabel('Modulul funcției de transfer[dB]');
subplot('Position', [0.4 0.1 0.55 0.35]);
semilogx(fr,ph,'--y',f0,-45,'ok','LineWidth',2);
grid on;
xlabel('Frecvența[Hz]');
ylabel('Faza');
Br_t=uicontrol( ...
               'Style','text', ...
               'Units','normalized', ...
               'Position',[0.35 0.95 0.2 0.04], ...
               'FontSize',15,...
               'String','CIRCUITE RC:FTB ȘI FOB', ...
               'backgroundcolor',[0.3 0.4 0.8],...
               'FontAngle','italic',...
               'Callback','close; ');
B_ftb=uicontrol( ...
                'Style','pushbutton', ...
                'Units','normalized', ...
                'Position',[0.05 0.75 0.15 0.06], ...
                'String','Filru trece bandă', ...
                'Callback','close; tip=1;filtre(tip,p,r,c,Fig)');
  %----------------------------------------
B_fob=uicontrol( ...
                'Style','pushbutton', ...
                'Units','normalized', ...
                'Position',[0.2 0.75 0.15 0.06], ...
                'String','Filtru oprește bandă', ...
                'Callback','close; tip=2;filtre(tip,p,r,c,Fig)');
 Br_t=uicontrol( ...
               'Style','text', ...
               'Units','normalized', ...
               'Position',[0.05 0.9 0.2 0.04], ...
               'String','RC:Schemă electrică', ...
               'FontSize',14,...
               'backgroundcolor',[0.2,0.5,0.8],...
               'Callback','close; ');
 select_operatie=1;
 bpopup=uicontrol('Style','popup',...
 'Units','normalized',...
 'Position',[0.05 0.75 0.3 0.15],...
 'String','FTB|FOB',...
 'Value',select_operatie,...
 'Callback','select_operatie=get(gco,''Value''),popup(select_operatie)');
 B_iesire=uicontrol( ...
                   'Style','pushbutton', ...
                   'Units','normalized', ...
                   'Position',[0.85 0.92 0.10 0.06], ...
                   'String','Ieșire', ...
                   'Callback','close;');
 RadioGroup=uibuttongroup('Visible','on',...
'ForegroundColor','black',...
'backgroundcolor',[0.1,0.4,0.8],...
 'Title','Date de intrare',...
 'FontSize',10,...
'TitlePosition','centertop',...
 'Tag','radiobutton',...
 'FontWeight','bold',...
 'Position',[0.05 0.45 0.25 0.2]);    
Br_t=uicontrol( ...
               'Style','text', ...
               'Units','normalized', ...
               'Position',[0.05 0.6 0.4 0.3], ...
               'String','R (ohmi) ', ...
               'FontWeight','bold',...
               'FontSize',10,...
               'backgroundcolor',[0.1,0.4,0.8],...
               'Parent',RadioGroup,...
               'Callback','close; ');
Br_e=uicontrol( ...
                    'Style','edit', ...
                    'Units','normalized', ...
                    'Position',[0.4 0.7 0.3 0.2], ...
                    'String',r, ...
                    'Parent',RadioGroup,...
           'Callback','r=str2num(get(gco,''string'')); close;filtre(tip,p,r,c,Fig)');
  br_t=uicontrol( ...
               'Style','text', ...
               'Units','normalized', ...
               'Position',[0.05 0.3 0.4 0.3], ...
               'String','C (F) ', ...
               'FontWeight','bold',...
                'FontSize',10,...
               'backgroundcolor',[0.1,0.4,0.8],...
               'Parent',RadioGroup,...
               'Callback','close; ');
Bc_e= uicontrol( ...
                'Style','edit', ...
                'Units','normalized', ...
                'Position',[0.4 0.45 0.3 0.2], ...
                'String',c, ...
                'Parent',RadioGroup,...
                'Callback','c=str2num(get(gco,''string'')); close;filtre(tip,p,r,c,Fig)'); 
  Bp_t=uicontrol( ...
          'Style','text', ...
          'Units','normalized', ...
          'Position',[0.15 0.02 0.2 0.3], ...
          'String','Val (1-100)', ...
          'backgroundcolor',[0.1,0.4,0.8],...
          'FontWeight','bold',...
           'FontSize',10,...
          'Parent',RadioGroup,...
          'Callback','close; ');
 Bp_e1= uicontrol( ...
          'Style','edit', ...
          'Units','normalized', ...
          'Position',[0.4 0.15 0.3 0.2], ...
          'Parent',RadioGroup,...
          'String',p, ...
          'Callback','p=str2num(get(gco,''string'')); close; filtre(tip,p,r,c,Fig)');  
RadioGroup1=uibuttongroup('Visible','on',...
'ForegroundColor','black',...
 'Title','Date de ieșire',...
 'FontWeight','bold',...
 'backgroundcolor',[0.1,0.4,0.8],...
 'FontSize',10,...
'TitlePosition','centertop',...
 'Tag','radiobutton',...
 'Position',[0.05 0.18 0.25 0.2]); 
Bp_t=uicontrol( ...
          'Style','text', ...
          'Units','normalized', ...
          'Position',[0.01 0.4 0.6 0.4], ...
          'String','Frecvența de tăiere', ...
          'FontWeight','bold',...
           'FontSize',10,...
          'backgroundcolor',[0.1,0.4,0.8],...
          'Parent',RadioGroup1,...
          'Callback','close'); 
 Bp_ec= uicontrol( ...
          'Style','edit', ...
          'Units','normalized', ...
          'Position',[0.55 0.65 0.3 0.2], ...
          'String',f0, ...
          'Parent',RadioGroup1,...
   'Callback','f0=str2num(get(gco,''string''));close;filtre(tip,p,r,c,Fig)');

 Bp_t=uicontrol( ...
          'Style','text', ...
          'Units','normalized', ...
          'Position',[0.01 0.1 0.4 0.4], ...
          'String','Pulsația', ...
          'FontWeight','bold',...
           'FontSize',10,...
          'backgroundcolor',[0.1,0.4,0.8],...
          'Parent',RadioGroup1,...
          'Callback', 'close');
 Bp_e= uicontrol( ...
          'Style','edit', ...
          'Units','normalized', ...
          'Position',[0.35 0.35 0.3 0.2], ...
          'String',w, ...
          'Parent',RadioGroup1,...
   'Callback','w=str2num(get(gco,''string'')); close;filtre(tip,p,r,c,Fig)'); ...    
Bc=uicontrol('Style','Checkbox',...
 'Units','normalized',...
 'String','Formulă:Factor de calitate',...
 'Position', [0.03 .02 .2 .1],...
  'backgroundcolor',[0.2,0.5,0.8],...
  'FontSize',14,...
 'Callback','afisare_figura(Fig, get(gco,''Value''))');
  
set(fig,'Visible','on');
end






      