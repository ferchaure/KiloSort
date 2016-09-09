function shiftM = shift_matrix(dy, ycoords, xcoords, iCovChans, sig, Wrot)


yminusy = bsxfun(@minus, ycoords - dy, ycoords').^2 + ...
    bsxfun(@minus, xcoords , xcoords').^2;

newSamp = exp(- yminusy/(2*sig^2));

shiftM = newSamp * iCovChans;
if nargin>5
    shiftM = Wrot * (shiftM/Wrot);
end


