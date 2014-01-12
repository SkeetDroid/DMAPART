if(!onGround){ // if player is not (!) on the ground then apply gravity
    vsp += G;
}

//vertical collision
if(place_meeting(x, y + vsp, obj_blockPar)){ // if there WILL BE a collision next frame...
    if(vsp > 0){ // if player is falling down 
        move_contact_all(270,0); // contact down then....
    } // or if
    if(vsp < 0){ // if player hits his head
        move_contact_all(90,0); // contact block and then....
    }
    vsp = 0; //fall/stop vertical movement
}
//vertical collision (platform)
if(place_meeting(x, y + vsp, obj_platform)){ // if there WILL BE a collision next frame...
    move_contact_all(270,0); // contact down then....
    hsp += obj_platform.returnSpeed; // match players h speed with platoform's
    onPlatform = true; //the player is most certianly standing on a platform, NOT to be confused with a block.
    vsp = 0; //fall/stop vertical movement
}
else{
    onPlatform = false;
}


//check if the player is on the ground or not...we dont want gravity to effect the player standing on the ground
if(place_meeting(x, y + 2, obj_blockPar)){ 
    onGround = true;
}
else if(!place_meeting(x, y + 2, obj_blockPar)){ // we have to set if the player is not on teh ground as well
    onGround = false;
}

//horizontal collision
//same idea as the verticle collision, only using hsp instead of vsp
if(place_meeting(x + hsp, y, obj_blockPar)){
/* OLD HORIZONTAL COLLISION
    if(hsp < 0){
        move_contact_all(180,0);
        
        old walljump code
        if(onGround = false)
            wallSlide = true;
        
    }
    if(hsp > 0){
        move_contact_all(0,0);
        
        old walljump code
        if(onGround = false)
            wallSlide = true;
        
    }
    hsp = 0;
*/
        yplus = 0;
        //this iterates through the yplus var and looks a maximum of 5 pixels above the player
        //in order to see if there is a free spot.
        while (place_meeting(x + hsp, y - yplus, obj_blockPar) && yplus <= abs(8)) yplus += 1;
        //if there is no free position found above then just do regular collision...
        if (place_meeting(x + hsp, y - yplus, obj_blockPar)){
            while(!place_meeting(x + sign(hsp), y, obj_blockPar)) x +=sign(hsp);
            hsp = 0;
        }
        else{
            //but if we did find a free position then set the y to yplus
            y -= yplus;
        }

}
/*
old walljump code
else{// if NOT meeting a wall next frame...
    wallSlide = false;
}
*/
