CREATE DEFINER=`root`@`localhost` FUNCTION `select_formapagto`(IdOrdem VARCHAR(38)) RETURNS longtext CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    DECLARE condpagtos, formaPagto LONGTEXT;
    DECLARE done TINYINT DEFAULT FALSE;
    
    DECLARE crs_formapagto CURSOR FOR
		SELECT tbformas_pagto.descricao FROM tbordens_pagto 
			INNER JOIN tbformas_pagto ON tbordens_pagto.idtbformas_pagto = tbformas_pagto.idtbformas_pagto
            WHERE CONVERT(tbordens_pagto.idtbordens_cab USING utf8mb3) = IdOrdem;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;    
    
    SET formaPagto = '';
    
    OPEN crs_formapagto;
    myloop: LOOP
		FETCH crs_formapagto INTO condpagtos;
		IF done THEN
			LEAVE myloop;
		END IF;             
        SET formaPagto = CONCAT(condpagtos, ' | ' , formaPagto);       
    END LOOP;
    CLOSE crs_formapagto;
--	DEALLOCATE crs_formapagto; 
SET formaPagto = SUBSTRING(formaPagto, 1, CHAR_LENGTH(RTRIM(formaPagto))-1);
RETURN formaPagto;
END