/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_Invisible_Wall))  && (key_jump)
{
	vsp = -jumpsp	
}

//Horizontal collision
if (place_meeting(x+hsp,y,obj_Invisible_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Invisible_Wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if (place_meeting(x,y+vsp,obj_Invisible_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Invisible_Wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,obj_Invisible_Wall))
{
	sprite_index = spr_Samur_Egg_Jump;
	image_speed = 0;
	if (vsp > 0) image_index = 6; else image_index = 3;
	
	
}

