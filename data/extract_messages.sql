.open 3d0d7e5fb2ce288813306e4d4636395e047a3d28
.mode csv
.output txt_messages.csv
select
    datetime(m.date + strftime('%s', '2001-01-01 00:00:00'),
       'unixepoch', 'localtime') || ' PST' as parsed_date,
        datetime(m.date_read + strftime('%s', '2001-01-01 00:00:00'),
       'unixepoch', 'localtime') || ' PST' as read_date,
        datetime(m.date_delivered + strftime('%s', '2001-01-01 00:00:00'),
       'unixepoch', 'localtime') || ' PST' as delivered_date,
    m.text,
	m.handle_id,
	m.service,
	m.account,
	m.is_delivered,
	m.is_finished,
	m.is_emote,
	m.is_from_me,
	m.is_empty,
	m.is_delayed,
	m.is_auto_reply,
	m.is_prepared,
	length(m.text) as msg_size,
	h.id
FROM message AS m
LEFT JOIN handle AS h on m.handle_id=h.ROWID;
