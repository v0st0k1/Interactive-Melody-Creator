function name = translate_note_name(note)
    switch (note)
        case 0 %do
            name='DO';
        case 1 %do#
            name='DO#';
        case 2 %re
            name='RE';
        case 3 %re#
            name='RE#';
        case 4 %mi
            name='MI';
        case 5 %fa
            name='FA';
        case 6 %fa#
            name='FA#';
        case 7 %sol
            name='SOL';
        case 8 %sol#
            name='SOL#';
        case 9 %la
            name='LA';
        case 10 %la#
            name='LA#';
        case 11 %si
            name='SI';
    end
end