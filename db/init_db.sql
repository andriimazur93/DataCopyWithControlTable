create table watermarktable
(
	watermark_value timestamp
);

INSERT INTO watermarktable
VALUES ('1/1/2010 12:00:00 AM');

create table src_person (
	person_id integer primary key,
	name text,
	last_modified_time timestamp
);

insert into src_person (person_id, name, last_modified_time) values
(1, 'aaaa', '2017-09-01 00:56:00.000'),
(2, 'bbbb', '2017-09-02 05:23:00.000'),
(3, 'cccc', '2017-09-03 02:36:00.000'),
(4, 'dddd', '2017-09-04 03:21:00.000'),
(5, 'eeee', '2017-09-05 08:06:00.000'),
(6, 'fffffff', '2017-09-06 02:23:00.000'),
(7, 'gggg', '2017-09-07 09:01:00.000'),
(8, 'hhhh', '2017-09-08 09:01:00.000'),
(9, 'iiiiiiiii', '2017-09-09 09:01:00.000');


CREATE OR REPLACE PROCEDURE public.update_watermark_table(last_updated_date text)
 LANGUAGE plpgsql
AS $procedure$
begin
	update watermarktable
	set watermark_value = last_updated_date::timestamp without time zone;

    commit;
end;$procedure$
;


create table dest_person (
	person_id integer primary key,
	name text,
	last_modified_time timestamp
);
