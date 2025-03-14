function afisare_figura(Fig, fig_vizibil)
[figura]=imread('factor.jpg');
figure(Fig);
image(figura);
axis off;
title('Factor de calitate');

if fig_vizibil == 1
    set(Fig,'Visible','on');
else
    set(Fig,'Visible','off');
    

end