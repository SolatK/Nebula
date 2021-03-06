/proc/to_world_ban(var/bantype = null, var/setter = "", var/banned = "", var/reason = "", var/duration = null, var/banned_jobs)
	if(isnull(bantype)) 
		return

	var/reason_public = reason
	reason = sql_sanitize_text(reason)

	SSwebhooks.send("webhook_message_ban", list("bantype" = bantype, "setter" = setter, "banned" = banned, "reason" = reason, "duration" = duration, "banned_jobs" = banned_jobs))
	switch(bantype)
		if(BANTYPE_PERMA)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] [SPAN_DANGER("перманентно")] заблокировал(а) игрока [banned]. Причина: \"[reason_public]\"</b>"))
		if(BANTYPE_TEMP)
			to_world(SPAN_NOTICE("<b>BAN: Администратор [setter] временно заблокировал(а) игрока [banned]. Причина: \"[reason_public]\"; Срок - [duration] минут.</b>"))
		if(BANTYPE_JOB_PERMA)
			to_world(SPAN_NOTICE("<b>JOB-BAN: Администратор [setter] [SPAN_DANGER("перманентно")] заблокировал(а) роли ([banned_jobs]) игроку [banned]. Причина: \"[reason_public]\"</b>"))
		if(BANTYPE_JOB_TEMP)
			to_world(SPAN_NOTICE("<b>JOB-BAN: Администратор [setter] временно заблокировал(а) роли ([banned_jobs]) игроку [banned]. Причина: \"[reason_public]\"; Срок - [duration] минут.</b>"))
