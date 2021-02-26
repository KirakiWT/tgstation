
/* EMOTE DATUMS */
/datum/emote/living
	mob_type_allowed_typecache = /mob/living
	mob_type_blacklist_typecache = list(/mob/living/simple_animal/slime, /mob/living/brain)

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "краснеет."

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "кланяется."
	message_param = "кланяется %t."
	hands_use_check = TRUE

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "громко рыгает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "в ахуе!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "скрещивает руки."
	hands_use_check = TRUE

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "посмеивается."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "падает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "кашляет!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "весело танцует."
	hands_use_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "падает на пол и перестаёт подавать признаки жизни..."
	message_robot = "вздрагивает и замирает, его глаза медленно темнеют."
	message_AI = "издаёт несвязные звуки, его системы ."
	message_alien = "визжит и падает на пол, не подавая признаков жизни..."
	message_larva = "противно шипит и падает, не подавая признаков жизни......"
	message_monkey = "вскрикивает и падает, не подавая признаков жизни..."
	message_simple =  "прекращает двигаться..."
	cooldown = (15 SECONDS)
	stat_allowed = HARD_CRIT

/datum/emote/living/deathgasp/run_emote(mob/user, params, type_override, intentional)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)

	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 200, TRUE, TRUE)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "пускает слюни."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "теряет сознание."

/datum/emote/living/faint/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/living/flap
	key = "flap"
	key_third_person = "flaps"
	message = "машет крыльями."
	hands_use_check = TRUE
	var/wing_time = 20

/datum/emote/living/flap/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/open = FALSE
		if(H.dna.features["wings"] != "None")
			if(H.dna.species.mutant_bodyparts["wingsopen"])
				open = TRUE
				H.CloseWings()
			else
				H.OpenWings()
			addtimer(CALLBACK(H, open ? /mob/living/carbon/human.proc/OpenWings : /mob/living/carbon/human.proc/CloseWings), wing_time)

/datum/emote/living/flap/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "агрессивно машет крыльями!"
	hands_use_check = TRUE
	wing_time = 10

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "хмурится."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "замолкает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "задыхается!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = HARD_CRIT

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "хихикает."
	message_mime = "тихо хихикает!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "поглядывает на что-то."
	message_param = "поглядывает на %t."

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "оскаливается."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "гпромко стонет!"
	message_mime = "appears to groan!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "кривляется."

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "прыгает!"
	hands_use_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "целует"
	cooldown = 3 SECONDS

/datum/emote/living/kiss/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/kiss_type = /obj/item/kisser

	if(HAS_TRAIT(user, TRAIT_KISS_OF_DEATH))
		kiss_type = /obj/item/kisser/death

	var/obj/item/kiss_blower = new kiss_type(user)
	if(user.put_in_hands(kiss_blower))
		to_chat(user, "<span class='notice'>Вы включили режим поцелуев. Для его отключения выбросите предмет из руки.</span>")
	else
		qdel(kiss_blower)
		to_chat(user, "<span class='warning'>Освободите активную руку для использования.</span>")

/datum/emote/living/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "смеётся."
	message_mime = "тихо смеётся!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE

/datum/emote/living/laugh/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent

/datum/emote/living/laugh/get_sound(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.dna.species.id == "human" && (!H.mind || !H.mind.miming))
			if(user.gender == FEMALE)
				return 'sound/voice/human/womanlaugh.ogg'
			else
				return pick('sound/voice/human/manlaugh1.ogg', 'sound/voice/human/manlaugh2.ogg')

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "смотрит."
	message_param = "смотрит на %t."

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "кивает."
	message_param = "кивает %t."

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "указывает."
	message_param = "указывает на %t."
	hands_use_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params, type_override, intentional)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.usable_hands == 0)
			if(H.usable_legs != 0)
				message_param = "пытается показать на %t своей ногой, <span class='userdanger'>падая на пол</span> в процессе!"
				H.Paralyze(20)
			else
				message_param = "<span class='userdanger'>бьётся головой об пол</span>, пытаясь показать на %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	return ..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "дуется."

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "кричит!"
	message_mime = "изображает крики!"
	emote_type = EMOTE_AUDIBLE
	mob_type_blacklist_typecache = list(/mob/living/carbon/human) //Humans get specialized scream.

/datum/emote/living/scream/select_message_type(mob/user, intentional)
	. = ..()
	if(!intentional && isanimal(user))
		return "издает громкое и болезненное хныканье."

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "хмурится."

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "качает головой."

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "дрожжит."

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "вздыхает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "садится."

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "улыбается."

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "чихает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "самодовольно усмехается."

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "сопит носом."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "snores."
	message_mime = "громко храпит."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "пялится."
	message_param = "пялится на %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "потягивается руками."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "недовольно дуется."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "кладет руки на голову и падает на землю!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/surrender/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Paralyze(200)
		L.remove_status_effect(STATUS_EFFECT_SURRENDER)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "теряет равновесие."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "дрожжит от страха!"

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "сильно дёргается."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "дёргается."

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "мешут рукой."

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "хнычет."
	message_mime = "изображает страдания."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "слабо улыбается."

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "зевает."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gurgle
	key = "gurgle"
	key_third_person = "gurgles"
	message = "издает неприятное бульканье."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/can_run_emote(mob/user, status_check, intentional)
	. = ..() && intentional

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	var/static/regex/stop_bad_mime = regex(@"says|exclaims|yells|asks")
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null, intentional = FALSE)
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	if(is_banned_from(user.ckey, "Emote"))
		to_chat(user, "<span class='boldwarning'>Вы не можете отправлять эмоции (заблокирвоано).</span>")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "<span class='boldwarning'>Вы не можете отправлять какие-либо IC сообщения (в муте).</span>")
		return FALSE
	else if(!params)
		var/custom_emote = copytext(sanitize(input("Напишите, какое действие вы хотите совершить.") as text|null), 1, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Какими способами игроки могут распознать вашу эмоцию?") as null|anything in list("Увидеть", "Услышать")
			switch(type)
				if("Увидеть")
					emote_type = EMOTE_VISIBLE
				if("Услышать")
					emote_type = EMOTE_AUDIBLE
				else
					alert("Нельзя использовать эмоцию, не являющуюся слышимой и видимой.")
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/living/beep
	key = "beep"
	key_third_person = "beeps"
	message = "beeps."
	message_param = "гудит на %t."
	sound = 'sound/machines/twobeep.ogg'
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon)
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/inhale
	key = "inhale"
	key_third_person = "inhales"
	message = "делает глубокий вдох."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/exhale
	key = "exhale"
	key_third_person = "exhales"
	message = "громко выдыхает."
	emote_type = EMOTE_AUDIBLE
