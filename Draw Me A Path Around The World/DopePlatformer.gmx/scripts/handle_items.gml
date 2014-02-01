//Good luck decipering this.....

//Items
if (keyboard_check_pressed(item_switch_key) or gamepad_button_check_pressed(controllerIndex,gp_shoulderr)) { //Change Helditem
    if helditem<7 {
        helditem+=1
        }
    else {
        helditem=1
        }
    }
    
if (gamepad_button_check_pressed(controllerIndex,gp_shoulderl)) { //Change Helditem
    if helditem>1 {
        helditem-=1
        }
    else {
        helditem=7
        }
    }
    
if (keyboard_check_pressed(item_use_key) or gamepad_button_check_pressed(controllerIndex,gp_shoulderlb)) { //Use Item
    if helditem=1 { //Leadboots
        if leadboots=false
        leadboots=true
        else
        leadboots=false
        }
    if helditem=2 { //Hourglass
        if hourglass=false
        hourglass=true
        else
        hourglass=false
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
    
if gamepad_button_check_released(controllerIndex,gp_shoulderlb) or keyboard_check_released(item_use_key) {//Throw item
    if aiming=true {
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
}
    
if gamepad_button_check(controllerIndex,gp_shoulderlb) or keyboard_check(item_use_key) if aiming=true { //Fire
    if gamepad_axis_value(controllerIndex,gp_axisrh)>0.4 or gamepad_axis_value(controllerIndex,gp_axisrh)<-0.4 
        or gamepad_axis_value(controllerIndex,gp_axisrv)>0.4 or gamepad_axis_value(controllerIndex,gp_axisrv)<-0.4 
        or global.gamepad = false{
            if helditem=5 {//Fire Brush
                spread=floor(random(10))-5
                fire=instance_create(x,y-32,obj_fire_ball)
                fire.direction=angle+spread
                fire.speed=10
                }
            }
        }
    
if gamepad_button_check(controllerIndex,gp_shoulderlb) or keyboard_check(item_use_key) { //Enable aiming
    if helditem=4 or helditem=5 or helditem=6 {
        if gamepad_axis_value(controllerIndex,gp_axisrh)<0.4 or gamepad_axis_value(controllerIndex,gp_axisrh)>-0.4 or global.gamepad=false {
            if gamepad_axis_value(controllerIndex,gp_axisrv)<0.4 or gamepad_axis_value(controllerIndex,gp_axisrv)>-0.4 or global.gamepad=false {
            aiming=true
            }
        }
    }
}
else aiming=false

if aiming=true { 
    if gamepad_axis_value(controllerIndex,gp_axisrh)>0.4 or gamepad_axis_value(controllerIndex,gp_axisrh)<-0.4 or gamepad_axis_value(controllerIndex,gp_axisrv)>0.4 or gamepad_axis_value(controllerIndex,gp_axisrv)<-0.4 and global.gamepad=true { //Get Shot angle
        angle=point_direction(x,y-32,x+gamepad_axis_value(controllerIndex,gp_axisrh)*256,y+gamepad_axis_value(controllerIndex,gp_axisrv)*256)}
        else if global.gamepad=false {angle=point_direction(x,y-32,mouse_x,mouse_y)}
        }
    
if aiming=true { //Don't allow drawing until right stick is reset to center (Prevents accidentally using paint)
    candraw=false
    }
else if gamepad_axis_value(controllerIndex,gp_axisrh)<0.4 and gamepad_axis_value(controllerIndex,gp_axisrh)>-0.4 and gamepad_axis_value(controllerIndex,gp_axisrv)<0.4 and gamepad_axis_value(controllerIndex,gp_axisrv)>-0.4 { 
    candraw=true
    }
if global.gamepad=false and aiming=false {
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









