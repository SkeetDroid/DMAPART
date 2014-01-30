if(sign(hsp) == 1)
    {if voodoo=false image_xscale = 1 else image_xscale=1/2}
else if(sign(hsp) == -1)
    {if voodoo=false image_xscale = -1 else image_xscale=-1/2}
else{
    image_xscale = previousSign;
}
    
if(sign(hsp) != 0){
    previousSign = sign(hsp);
}
