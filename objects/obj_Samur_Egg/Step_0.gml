/// @desc Core Player Logic

//Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_direct(vk_space);
key_sprint = keyboard_check_direct(vk_shift)

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_Invisible_Wall)) && (key_jump)
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
else
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = spr_Samur_Egg_Idle;
	}
	else
	{
		sprite_index = spr_Samur_Egg_Run;
	}
}

if (hsp != 0) image_xscale = sign(hsp);

//Sprinting

if (key_sprint) && (key_left or key_right)
{
	walksp = 7;
}
else
{
	walksp = 4;
}

// Room Travel

if (place_meeting(x+1,y,obj_Room_Right))
{
	room_goto(rm_right);
}

if (place_meeting(x-1,y,obj_Room_Left))
{
	room_goto(rm_left);
}

if (place_meeting(x+1,y,obj_Room_Center)) or (place_meeting(x-1,y,obj_Room_Center))
{
	room_goto(rm_center);
}