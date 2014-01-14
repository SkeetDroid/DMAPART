//Good luck decipering this.....

//Items
if (keyboard_check_pressed(ord("Q")) or gamepad_button_check_pressed(0,gp_shoulderl)) { //Change Helditem
    if helditem<7 {
        helditem+=1
        }
    else {
        helditem=1
        }
    }
    
if (keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(0,gp_shoulderlb)) { //Use Item
    if helditem=1 { //Leadboots
        if leadboots=false
        leadboots=true
        else
        leadboots=false
        }
    if helditem=3 { //Voodoo Wand
        if voodoo=false
        voodoo=true
        else
        voodoo=false
        }
    }
    
if leadboots=true and helditem!=1 { //Disable Items if not held
    leadboots=false
    }
if voodoo=true and helditem!=3 { //Disable Items if not held
    voodoo=false
    }
if voodoo=true { //Shrink if voodoo wand is enabled
    image_xscale=1/2
    image_yscale=1/2
    }
else {
    image_xscale=1
    image_yscale=1
    }
    
if gamepad_button_check_released(0,gp_shoulderlb) and aiming=true {//Throw item
    if helditem=4 {//Throw Bomb
        bomb=instance_create(x,y-32,obj_bomb)
        bomb.direction=angle
        bomb.speed=10
        }
    aiming=false
    if helditem=6 {//Ice Brush
        ice=instance_create(x,y-32,obj_ice_shard)
        ice.direction=angle
        ice.speed=16
        }
    aiming=false
    }
    
if gamepad_button_check(0,gp_shoulderlb) and aiming=true { //Fire
    if helditem=5 {//Fire Brush
        fire=instance_create(x,y-32,obj_fire_ball)
        fire.direction=angle
        fire.speed=16
        }
    }
    
if gamepad_button_check(0,gp_shoulderlb) { //Enable aiming
    if helditem=4 or helditem=5 or helditem=6 {
        if gamepad_axis_value(0,gp_axisrh)<0.4 or gamepad_axis_value(0,gp_axisrh)>-0.4 {
            if gamepad_axis_value(0,gp_axisrv)<0.4 or gamepad_axis_value(0,gp_axisrv)>-0.4 {
            aiming=true
            }
        }
    }
}
else aiming=false

if aiming=true {
    if gamepad_axis_value(0,gp_axisrh)>0.4 or gamepad_axis_value(0,gp_axisrh)<-0.4 or gamepad_axis_value(0,gp_axisrv)>0.4 or gamepad_axis_value(0,gp_axisrv)<-0.4 { //Get Shot angle
        angle=point_direction(x,y-32,x+gamepad_axis_value(0,gp_axisrh)*256,y+gamepad_axis_value(0,gp_axisrv)*256)
        }
    }
    
if aiming=true { //Don't allow drawing until right stick is reset to center (Prevents accidentally using paint)
    candraw=false
    }
else if gamepad_axis_value(0,gp_axisrh)<0.4 and gamepad_axis_value(0,gp_axisrh)>-0.4 and gamepad_axis_value(0,gp_axisrv)<0.4 and gamepad_axis_value(0,gp_axisrv)>-0.4 { 
    candraw=true
    }

//Water and Lava Floating
if leadboots=false and place_meeting(x,y,obj_water) {
    if vsp>-2
    vsp-=2
    }
if leadboots=false and place_meeting(x,y,obj_lava) {
    if vsp>-2
    vsp-=2
    }









