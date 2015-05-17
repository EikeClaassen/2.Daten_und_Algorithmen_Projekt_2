function addpoint(handle, event)
    data = guidata(handle);
    hplot = data.plot;
    xdata = get(hplot, 'xdata');
    ydata = get(hplot, 'ydata');
    xdata = [xdata event.IntersectionPoint(1)];
    ydata = [ydata event.IntersectionPoint(2)];
    set(hplot, 'xdata', xdata);
    set(hplot, 'ydata', ydata);
end

