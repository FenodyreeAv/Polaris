/obj/machinery/computer/shutoff_monitor
	name = "automated shutoff valve monitor"
	desc = "Console used to remotely monitor shutoff valves on the station."
	icon_keyboard = "power_key"
	icon_screen = "power:0"
	light_color = "#a97faa"
	circuit = /obj/item/weapon/circuitboard/shutoff_monitor
	var/datum/nano_module/shutoff_monitor/monitor

/obj/machinery/computer/shutoff_monitor/New()
	..()
	monitor = new(src)

/obj/machinery/computer/shutoff_monitor/Destroy()
	qdel(monitor)
	monitor = null
	..()

/obj/machinery/computer/shutoff_monitor/attack_hand(var/mob/user as mob)
	..()
	ui_interact(user)

/obj/machinery/computer/shutoff_monitor/ui_interact(mob/user, ui_key = "shutoff_monitor", var/datum/nanoui/ui = null, var/force_open = 1)
	monitor.ui_interact(user, ui_key, ui, force_open)

/obj/machinery/computer/shutoff_monitor/update_icon()
	..()
	if(!(stat & (NOPOWER|BROKEN)))
		add_overlay("ai-fixer-empty")
	else
		cut_overlay("ai-fixer-empty")