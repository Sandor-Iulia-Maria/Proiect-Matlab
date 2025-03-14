function popup(select_operatie)
Fig=figure('Name','',...
        'Numbertitle','off');
 
switch select_operatie
    case 1
        x=imread('ftb.jpg');
        image(x);
        axis off;
    case 2
     y=imread('fob.jpg');
     image(y);
     axis off;
end
end

