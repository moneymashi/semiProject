SELECT * FROM (
		SELECT ROWNUM AS cnt, aiall.* FROM (
		SELECT ai.*, c2.category_name parentName, c1.category_name childName FROM auction_item ai
		LEFT OUTER JOIN category c1 ON ai.category_id = c1.category_id
		INNER JOIN category c2 ON c1.parent_category_id = c2.category_id
		WHERE 1=1
			AND c2.category_name LIKE '%'|| '' ||'%'
			AND c1.category_name LIKE '%'|| '' ||'%'
		--	AND ai.start_date >= to_date( '' , 'yyyy/mm/dd' )
		--	AND ai.end_date <= to_date( '' , 'yyyy/mm/dd' )
		--	AND ai.start_date BETWEEN to_date( '' , 'yyyy/mm/dd' ) and to_date( '' , 'yyyy/mm/dd' )
			AND ( lower(c2.category_name) LIKE lower('%'||'' ||'%')
			or lower(c1.category_name) LIKE lower('%'||'' ||'%')
			or lower(ai.item_name) LIKE lower('%'||'' ||'%')
			or lower(ai.item_content) LIKE lower('%'||'' ||'%') )
			AND sysdate <= end_date
		--	AND sysdate >= end_date
		--	AND ai.current_bid_amount >= to_number('' )
		--	AND ai.current_bid_amount <= to_number( '' )
		--	ORDER BY ai.current_bid_amount '' , ai.end_date ''
		--	ORDER BY ai.end_date ${endDateOrder}
			ORDER BY ai.current_bid_amount desc
		--	ORDER BY ai.auction_id desc
		) aiall )
		WHERE cnt BETWEEN 1 AND 10;
		--