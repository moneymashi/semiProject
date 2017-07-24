-- 미완성 -- 사용금지


Create table calendar(

	calendar_id number(10),
	title varchar(255),
	start_date Date, 
	end_date Date,
	url varchar(255)
);

insert into calendar values( 1, '옥션1번에 참가!', sysdate -8, sysdate -1 ,'1번' );
insert into calendar values( 2, '옥션2번에 참가!', sysdate -1, sysdate +10 ,'2번' );
-- CREATE SEQUENCE  "AUCTION"."seq_calendar"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
commit;

CREATE OR REPLACE TRIGGER TR_CALENDAR
   BEFORE INSERT
   ON "AUCTION"."CALENDAR"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."id" IS NULL
      THEN
         SELECT seq_calendar.NEXTVAL INTO :NEW."id" FROM DUAL;
      END IF;
   END IF;
END;



select * from calendar;
