SELECT * FROM directory_number   WHERE dn_num = '56407060';
SELECT ca.customer_id,ca.custcode,ca.billcycle,  coa.co_id, cs.tmcode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1,csactivated, csdeactivated,cs.cs_stat_chng
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca
WHERE
--dn.dn_num = '54983766'
--ca.custcode = '407060'
ca.customer_id = 5759330
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id     ORDER BY csactivated
--AND substr(cs.cs_stat_chng, -1) IN ('a', 's');
;
SELECT * FROM contract_history WHERE co_id = 5048296;
SELECT * FROM mputmview WHERE tmcode IN (674, 726, 728);
SELECT tmcode, Count(*) cnt FROM ptcbill_co_usage_summary
WHERE custcode LIKE '2.11%'
GROUP BY tmcode
ORDER BY cnt desc;
SELECT * FROM ptcbill_rateplan_group_lnk WHERE tm_group_id = 1 AND market_type  = 'M';
SELECT tmcode FROM customer_all ca WHERE customer_id IN (
SELECT sub_customer_id  FROM ptcbill_main_sub_lnk WHERE main_customer_id = 6042274);

SELECT *  FROM contract_all  WHERE co_id IN (
SELECT sub_co_id FROM ptcbill_main_sub_lnk WHERE main_customer_id = 3790808);

SELECT *  FROM contr_services cs WHERE co_id IN (
SELECT sub_co_id FROM ptcbill_main_sub_lnk WHERE main_customer_id = 3790808)
AND  ;

SELECT sp.des, sn.des,cs.cs_stat_chng, cs.* FROM contr_services cs, mpusptab sp, mpusntab sn
 WHERE co_id = 5932465
 AND cs.spcode = sp.spcode
 AND cs.sncode = sn.sncode
 ORDER BY sp.des, sn.des, cs.cs_stat_chng;
SELECT *FROM customer_all WHERE custcode = '1.6105862';
SELECT * FROM contract_history  WHERE co_id = 3940002;
SELECT * FROM contract_all  WHERE co_id = 3940002;
SELECT * FROM customer_all WHERE customer_id = 3969801;
SELECT * FROM customer_all WHERE custcode = '1.3875551';
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
SELECT * FROM MPUTMview WHERE tmcode IN(754);
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
SELECT sn.des, fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu,
mpusntab sn
WHERE tmcode = 726
AND sn.sncode = fu.pkg_id
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
--and free_unit_inter = 100
AND   fu.pkg_id = 421
;
SELECT * FROM mputmtab ;
SELECT * FROM ptcbill_free_unit;
SELECT * FROM ptcbill_pkg_group WHERE pkg_id = 421;
SELECT * FROM mpusntab WHERE sncode IN (421,1) ;
SELECT * FROM mpusptab WHERE spcode IN (208);
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907002;
SELECT * FROM sms_group  WHERE GRp_id IN (0, 8200);
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907006;
SELECT * FROM contr_volume_history WHERE co_id = 6422401 ORDER BY seq_no;
SELECT * FROM contr_volume_history WHERE ent_user NOT LIKE 'md%';
SELECT * FROM ptcbill_rtx_type_Group ;
SELECT * FROM mpdpltab WHERE plcode IN (SELECT plcode FROM ptcbill_roam_group WHERE roam_group = 15) ;
SELECT *FROM directory_number;
SELECT * FROM user_tab_columns  WHERE COLUMN_name LIKE 'IMSI';
SELECT * FROM contr_devices;
SELECT *FROM port WHERE  port_num = 454120054983764;
SELECT *FROM EQUIPMENT;
SELECT * FROM storage_medium sm, contr_devices cd
WHERE co_id = 4816974
AND cd.cd_sm_num = sm.sm_serialnum;

SELECT * FROM mputmview WHERE des LIKE '4G HK%CH 3GB%';
SELECT * FROM customer_all WHERE tmcode = 727;

SELECT pcd.cdesc, ids.*FROM ptcbill_invoice_detail_cosum ids,
ptcbpp_cfg_description pcd
WHERE
ids.des = pcd.source and custcode = '1.6204460'
AND msisdn = 56467561 ORDER BY seq;
SELECT * FROM ptcbill_text_config ;
SELECT * FROM ptcbpp_cfg_description WHERE ROWNUM <= 1;
select * from v$parameter WHERE name LIKE 'nls%';
SELECT * FROM v$database;
SELECT * FROM v$session ;
SELECT * FROM v$instance;
SELECT * FROM dba_tables WHERE table_name LIKE '%NLS';
SELECT * FROM all_tab_columns WHERE column_name = Upper('nls_language');
SELECT * FROM v$session;
SELECT * FROM mputmview WHERE DES LIKE '%21Mbps%';
SELECT * FROM mputmview WHERE tmcode = 653;
SELECT *FROM mpusntab WHERE sncode  = 525;
SELECT * FROM mpuzptab WHERE zpcode = 7364;
SELECT * FROM mpdpltab WHERE plcode = 133;
SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' and tag IN ('ITB1I','ITB1A') AND msisdn = 53031755 ORDER BY seq;
SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' and tag IN ('ITB1R','ITB1r') AND msisdn = 53031755 ORDER BY plcode, seq;
SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' AND msisdn = 51084508;

SELECT * FROM ptcbill_invoice_header WHERE custcode =    '1.6204460';
SELECT *FROM ptcbill_invoice_detail_sum WHERE custcode = '1.6204460' ORDER BY seq;
SELECT *FROM ptcbill_text_config ;
SELECT * FROM 	ptcbpp_cfg_rateplan WHERE tmcode = 653;
SELECT * FROM ptcapp_bill_country pbc, MPDPLTAB dpl
WHERE pbc.source = dpl.source ;
SELECT * FROM MPDPLTAB ;
SELECT * FROM mpulktmz WHERE zpcode = 231;
SELECT * FROM ptcbill_idd_roa_display WHERE sncode = 4;
SELECT *FROM user_tab_columns WHERE column_name LIKE '%QOS%';
SELECT *FROM mputmview WHERE des LIKE '4G Local 6GB%';
SELECT * FROM ptcbill_co_usage_summary WHERE msisdn = 92047223;
SELECT tm.des, ca.customer_id,ca.custcode,ca.billcycle,  coa.co_id, cs.tmcode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1,csactivated, csdeactivated,cs.cs_stat_chng
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca, mputmview tm
WHERE
--dn.dn_num = '92047223'
--ca.custcode = '1.6404104'
 dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
AND tm.tmcode = ca.tmcode
AND ca.custcode LIKE '2.11%'
ORDER BY tm.des, dn.dn_num;

SELECT custcode, msisdn, invoice_date,s.*  FROM ptcbill_co_usage_summary s
 WHERE tmcode = 509 AND  invoice_date = To_Date('20161120', 'yyyymmdd');
SELECT *  FROM ptcapp_usage_hist s
 WHERE air_entitle_tmcode = 509 AND  date_billed = To_Date('20161120', 'yyyymmdd');
SELECT *FROM rtx_060201 where r_p_customer_id = 6049325 AND r_p_contract_id = 6236008 AND sncode = 119 ORDER BY start_d_t ;
SELECT *FROM rtx_060201 ;

SELECT trunc(original_start_d_t) ,rtx.r_p_customer_Id,
rtx.r_p_contract_id, dn.dn_num,
Sum(CASE  rtx_type  when 'A' THEN  rounded_volume/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  rounded_volume/60 ELSE 0 END) as CHINA_DATA, Sum(rounded_volume/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
GROUP BY trunc(original_start_d_t) ,rtx.r_p_customer_Id, rtx.r_p_contract_id,  dn.dn_num;

SELECT trunc(original_start_d_t) ,rtx.r_p_customer_Id,
rtx.r_p_contract_id, dn.dn_num,
Sum(CASE  rtx_type  when 'A' THEN  rounded_volume/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  rounded_volume/60 ELSE 0 END) as CHINA_DATA, Sum(rounded_volume/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND rtx.rated_flat_amount <> 0
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
GROUP BY trunc(original_start_d_t) ,rtx.r_p_customer_Id, rtx.r_p_contract_id,  dn.dn_num;

--Ïã¸Û
SELECT l.sub_customer_id,
l.sub_co_id, dn.dn_num,
Sum(CASE  rtx_type  when 'A' THEN  rounded_volume/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  rounded_volume/60 ELSE 0 END) as CHINA_DATA, Sum(rounded_volume/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id(+) = l.sub_customer_id
AND rtx.r_p_contract_id(+) = l.sub_co_id
AND rtx.sncode(+) = 119
AND rtx.rated_flat_amount(+) <> 0
--AND ( rtx.rtx_type = 'A' OR (rtx.rtx_type= 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
AND Trunc(rtx.original_start_d_t) = To_Date('20161026', 'yyyymmdd')
GROUP BY l.sub_customer_id, l.sub_co_id,  dn.dn_num;
--´óÂ½
SELECT dn.dn_num, Sum(CASE  rtx_type  when 'A' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END) as CHINA_DATA, Sum(Nvl(rounded_volume,0)/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
 WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id(+) = l.sub_customer_id
AND rtx.r_p_contract_id(+) = l.sub_co_id
AND rtx.sncode(+) = 119
AND rtx.rated_flat_amount(+) <> 0
AND ( rtx.rtx_type(+) = 'A' )

AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
AND  original_start_d_t(+) >= To_Date('20161029', 'yyyymmdd')
AND original_start_d_t(+) <  To_Date('20161030', 'yyyymmdd')
GROUP BY dn.dn_num
ORDER BY dn.dn_num;

SELECT dn.dn_num Mobile, Sum(CASE  rtx_type  when 'A' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END) AS "HK data(KB)"
, Sum(CASE   rtx_type when 'R' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END) "China data(KB)" , Sum(Nvl(rounded_volume,0)/60) "Total(KB)"
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
 WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id(+) = l.sub_customer_id
AND rtx.r_p_contract_id(+) = l.sub_co_id
AND rtx.sncode(+) = 119
AND rtx.rated_flat_amount(+) <> 0
--AND ( rtx.rtx_type(+) = 'A' )

AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
--AND Trunc(original_start_d_t) = To_Date('20161026', 'yyyymmdd')
AND  original_start_d_t(+) >= To_Date('20161106', 'yyyymmdd')
AND original_start_d_t(+) <  To_Date('20161107', 'yyyymmdd')
GROUP BY dn.dn_num
ORDER BY dn.dn_num;


SELECT dn.dn_num, Sum(CASE  rtx_type  when 'A' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  Nvl(rounded_volume,0)/60 ELSE 0 END) as CHINA_DATA, Sum(Nvl(rounded_volume,0)/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
 WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id(+) = l.sub_customer_id
AND rtx.r_p_contract_id(+) = l.sub_co_id
AND rtx.sncode(+) = 119
AND rtx.rated_flat_amount(+) <> 0
AND ( rtx.rtx_type(+) = 'R' AND rtx.plcode(+) = 76 )

AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
AND  original_start_d_t(+) >= To_Date('20161029', 'yyyymmdd')
AND original_start_d_t(+) <  To_Date('20161030', 'yyyymmdd')
GROUP BY dn.dn_num
ORDER BY dn.dn_num;




SELECT *
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND rtx.rounded_volume = 68640
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id ;


SELECT rtx.r_p_customer_Id,
rtx.r_p_contract_id, dn.dn_num,
Sum(CASE  rtx_type  when 'A' THEN  rounded_volume/60 ELSE 0 END)
as HK_DATA, Sum(CASE   rtx_type when 'R' THEN  rounded_volume/60 ELSE 0 END) as CHINA_DATA, Sum(rounded_volume/60)
FROM rtx_060201 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6110132'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
GROUP BY rtx.r_p_customer_Id, rtx.r_p_contract_id,  dn.dn_num
ORDER BY dn.dn_num;

SELECT * FROM rtx_060201 ;
SELECT *FROM PTCBILL_MASTER_CONTROL;
SELECT *FROM mpusntab;
SELECT *FROM ;