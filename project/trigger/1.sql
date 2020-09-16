drop trigger if exists updateLevel;
delimiter //
create trigger updateLevel after update on purchase
for each row
begin
	declare _price int default 0;
	declare _needPrice int default 0;
	declare _level int default 0;
	declare _givePoint int default 0;
	set _price = (select sum(price) from project.purchase where userId = new.userId and isDel = 'N' and isConfirm = 'Y');
	set _needPrice = (select needPrice from project.point as po
											join (select level from project.level where userId = new.userId) as le
											on po.level = le.level);
	set _level = (select level from project.level where userId = new.userId);
	set _givePoint = (select givePoint from project.purchase where num = new.num);
	if new.isConfirm = 'Y' and old.isConfirm = 'N' and _level < 10 and _price > _needPrice then
		update project.level set level.level = level.level + 1 where userId = new.userId;
	end if;
	if new.isConfirm = 'Y' and old.isConfirm = 'N' then
		update project.user set user.point = user.point + _givePoint where id = new.userId;
	end if;
end//
delimiter ;
-- 레벨 자동 증가, 포인트 자동 적립--  