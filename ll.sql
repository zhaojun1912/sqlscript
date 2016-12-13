SELECT * FROM directory_number   WHERE dn_num = '56407060';
SELECT ca.customer_id,ca.custcode,ca.billcycle,  coa.co_id, cs.tmcode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca
WHERE dn.dn_num = '92047383'
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's');

SELECT tmcode, Count(*) cnt FROM ptcbill_co_usage_summary
WHERE custcode LIKE '2.11%'
GROUP BY tmcode
ORDER BY cnt desc;
SELECT * FROM ptcbill_rateplan_group_lnk WHERE tm_group_id = 1 AND market_type  = 'M';

SELECT * FROM ptcbill_main_sub_lnk WHERE sub_customer_id = 6229688;
SELECT * FROM customer_all WHERE customer_id = 3969801;
SELECT
--Sum(LOCAL_FREE_MINS_INTER),Sum(LOCAL_FREE_MINS_INTRA),Sum(CHINA_FREE_MINS),Sum(INTER_VOICE_USAGE),Sum(INTRA_VOICE_USAGE),Sum(CHINA_USAGE)
a.*
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm
--, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.6195420')
AND a.invoice_date = To_Date('20160806','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
--AND tm.tmcode = lnk.tmcode
--AND lnk.TM_GROUP_ID=1
ORDER BY 2
;
SELECT  *
 FROM ptcbill_co_usage_summary a WHERE custcode = '1.4815717' AND invoice_date =To_Date('20161116','yyyymmdd');

SELECT
tm.tmcode,
tm.des,
lnk.TM_GROUP_ID,
Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') pool_fu,
a.custcode, a.co_id, a.msisdn, a.invoice_date, a.FREE_GPRS, a.GPRS_USAGE,  a.EXTRA_GPRS_VOL,  a.FREE_CHINA_GPRS,  a.CHINA_GPRS_USAGE,  a.EXTRA_CHINA_GPRS_VOL, a.CHINA_LOCAL_GPRS_USAGE, a.EXTRA_CHINA_LOCAL_GPRS_VOL
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.4054269')
AND a.invoice_date = To_Date('20161101','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY 2
;


SELECT * FROM customer_all WHERE custcode LIKE '2.11%';
SELECT * FROM customer_all WHERE custcode = '1.4815717';
SELECT * FROM mpusntab WHERE sncode IN (1, 441, 399);
SELECT * FROM mpusptab WHERE spcode IN(361);
SELECT * FROM MPUTMTAB WHERE tmcode IN(509,653);
SELECT * FROM mputmview WHERE tmcode IN    (618);
SELECT * FROM tapin_Rtx WHERE
--tapin_output_file = 'CDJPNDOHK0PP02534'
 imsi = '454120410751713'
 AND tapin_filename = 'CDJPNDOHKGPP02534'
AND msisdn = '85259335232'
;
--1907421
SELECT * FROM TAPIN_FILE WHERE f_filename = 'CDJPNDOHKGPP02534';
SELECT Max(f_id)  FROM "TAPIN_RTX_DMP" WHERE ROWNUM<=1;
SELECT * FROM tapin_cdr WHERE ROWNUM <= 1;
SELECT * FROM s2t_roaming_output_file  WHERE filename = 'GGSN_S2T_2016090508' ;
SELECT *FROM user_tab_columns WHERE column_name   = 'F_ID';
SELECT *FROM mpdpltab WHERE cc = 81;
SELECT * FROM user_tables WHERE table_name LIKE 'TAPIN%';
ca.customer_id,ca.custcode,ca.billcycle,  coa.co_id, cs.tmcode, cs.spcode,
cs.sncode,cs.dn_id,dn.dn_num
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca
WHERE
-- dn.dn_num = '92047383'
 dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
AND ca.billcycle = '07';

SELECT * FROM s2t_cdr;
SELECT * FROM contract_all WHERE customer_id = 6227103;
--57420
SELECT * FROM GPRS_CDR_DETAIL_ROAMING_MVNO WHERE  file_name = 'GGSN_S2T_2016090508' ;


SELECT * FROM ptcapp_sub_usage WHERE customer_id = 6227103 AND co_id = 6422401;
SELECT Ceil(unb_p_gprs_usg/60),Ceil(unb_p_roamgprs_usg/60),Ceil(unb_p_chn_roamgprs_usg/60)
FROM ptcapp_sub_usage WHERE customer_id = 6227103 AND co_id = 6422401;
SELECT fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu
WHERE tmcode = 509
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
AND   fu.pkg_id = 1;
SELECT * FROM ptcbill_pkg_group WHERE pkg_id = 421;
SELECT * FROM mpusntab WHERE sncode IN (421,1) ;
SELECT * FROM mpusptab WHERE spcode IN (208);
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907002;
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907006;
SELECT * FROM contr_volume_history WHERE co_id = 6422401 ORDER BY seq_no;
SELECT * FROM contr_volume_history WHERE ent_user NOT LIKE 'md%';
SELECT * FROM ptcbill_rtx_type_Group WHERE rtx_type_group = 7;
SELECT * FROM ptcbill_roam_group WHERE roam_group = 7 ;