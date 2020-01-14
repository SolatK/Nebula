/obj/item/pen/retractable
	desc = "It's a retractable pen."
	icon_state = "pen" //for map visibility
	var/active = FALSE
	var/base_state = "ret_black"

/obj/item/pen/retractable/blue
	icon_state = "pen_blue"
	colour = "blue"
	color_description = "blue ink"
	base_state = "ret_blue"

/obj/item/pen/retractable/red
	icon_state = "pen_red"
	colour = "red"
	color_description = "red ink"
	base_state = "ret_blue"

/obj/item/pen/retractable/green
	icon_state = "pen_green"
	colour = "green"
	color_description = "green ink"
	base_state = "ret_green"

/obj/item/pen/retractable/Initialize()
	. = ..()
	desc = "It's a retractable [color_description] pen."

/obj/item/pen/retractable/on_update_icon()
	if(active)
		icon_state = "[base_state]-a"
	else
		icon_state = "[base_state]"

/obj/item/pen/retractable/attack(atom/A, mob/user, target_zone)
	if(!active)
		to_chat(user, SPAN_NOTICE("You'll have to activate \the [src] if you wish to use it."))
		return
	..()

/obj/item/pen/retractable/attack_self(mob/user)
	active = !active
	playsound(src, 'sound/items/penclick.ogg', 5, 0, -4)
	update_icon()

/obj/item/pen/retractable/pen_usable(var/mob/living/user)
	if(active)
		return TRUE
	else
		to_chat(user, SPAN_NOTICE("You'll have to activate \the [src] if you wish to write with it."))