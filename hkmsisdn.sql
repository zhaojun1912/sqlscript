SELECT ca.custcode, ca.customer_id, coa.co_id CONTRACT_ID,dn.dn_num HKG_MSISDN, cs1.cs_sparam1 CHN_MSISDN,ch.ch_status
FROM customer_all ca,  contr_services cs,  contr_services cs1, directory_number dn,contract_all coa, contract_history ch
WHERE (coa.co_id IN (
))
AND ca.customer_id = coa.customer_id
AND cs.co_id = coa.co_id
--AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s','d')
AND cs.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id )
AND cs.sncode = 1
and cs.dn_id = dn.dn_id
and cs1.sncode = 237
--and SubStr(cs1.cs_Stat_chng,-1) IN ('a','s','d')
and cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs1.co_id )

--and ch.ch_status IN( 'a','d')
and ch.co_id = coa.co_id
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
union all
SELECT ca.custcode, ca.customer_id, coa.co_id ,dn.dn_num HKG_MSISDN, 'N/A' , ch.ch_status
FROM customer_all ca,  contr_services cs,directory_number dn, contract_all coa,  contract_history ch
WHERE (coa.co_id IN ()

AND ca.customer_id = coa.customer_id
AND cs.co_id = coa.co_id
--AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s','d')
AND cs.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id     )
AND cs.sncode = 1
and cs.dn_id = dn.dn_id
and not exists( select 1 from contr_services cs2 where cs2.sncode = 237 and cs2.co_id = cs.co_id
AND cs2.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id ))
--and ch.ch_status IN('a','d')
and ch.co_id = coa.co_id
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
order by custcode,customer_id
;


--retrieve 1CMN No. status
SELECT dn.dn_num HKG_MSISDN,cs1.cs_sparam1,SubStr(cs1.cs_stat_chng,-1)
FROM  contr_services cs,  contr_services cs1, directory_number dn
WHERE dn.dn_id = cs.dn_id
AND cs.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id )
AND To_Date( SubStr(cs.cs_stat_chng, -7, 6), 'rrmmdd') = (SELECT   Max(To_Date( SubStr(cs_stat_chng, -7, 6), 'rrmmdd'))     FROM contr_services WHERE dn_id = dn.dn_id AND SNCODE = 1)
AND Length(cs.cs_stat_chng) = (SELECT Min( Length(cs_stat_chng)) FROM   contr_services WHERE dn_id = dn.dn_id     AND SNCODE = 1 AND    To_Date( SubStr(cs_stat_chng, -7, 6), 'rrmmdd') =  (SELECT   Max(To_Date( SubStr(cs_stat_chng, -7, 6), 'rrmmdd'))     FROM contr_services WHERE dn_id = dn.dn_id AND SNCODE = 1))
AND cs.sncode =   1
and cs1.sncode = 237
and cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs1.co_id AND SNCODE=237 )
AND dn.dn_num in ();

SELECT dn.dn_num HKG_MSISDN 
FROM  contr_services cs,   directory_number dn
WHERE dn.dn_id = cs.dn_id
AND cs.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id AND cs.sncode =   1 )
AND cs.co_id = (SELECT   Max(co_id)     FROM contr_services WHERE dn_id = dn.dn_id AND SNCODE = 1)
AND Length(cs.cs_stat_chng) = (SELECT Min( Length(cs_stat_chng)) FROM   contr_services WHERE dn_id = dn.dn_id     AND SNCODE = 1 AND    To_Date( SubStr(cs_stat_chng, -7, 6), 'rrmmdd') =  (SELECT   Max(To_Date( SubStr(cs_stat_chng, -7, 6), 'rrmmdd'))     FROM contr_services WHERE dn_id = dn.dn_id AND SNCODE = 1))
AND cs.sncode =   1
and not exists( select 1 from contr_services cs2 where cs2.sncode = 237 and cs2.co_id = cs.co_id
--AND cs2.cs_seqno =  (SELECT Max(cs_seqno) FROM contr_services WHERE co_id = cs.co_id AND SNCODE = 237 )
)
AND dn.dn_num IN  ();
