SELECT COUNT(*) AS #MALE, 
		
		(SELECT COUNT(*) AS #FEMALE
		 FROM Player
		 where gender = 'F') 

FROM Player
where gender = 'M';


