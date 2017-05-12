SELECT * FROM directory_number   WHERE dn_num = '56407060';
select * from ptcbill_main_sub_lnk where  sub_customer_id = 6457116;
select * from customer_all ca where ca.custcode = '1.6516312';
select * from customer_all ca where ca.customer_id = 3946509;
--single user information query:
SELECT ca.customer_id,ca.custcode,ca.billcycle,  coa.co_id, cs.tmcode,cs.spcode,cs.sncode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1,csactivated, csdeactivated,cs.cs_status,cs.cs_stat_chng,cs.cs_on_cbb
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca
WHERE
dn.dn_num = '60510331'
--ca.custcode = '1.6338176'
--ca.customer_id = 6187521
--coa.co_id = 5979591
--coa.co_id = 3642592
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id     --ORDER BY csactivated
AND substr(cs.cs_stat_chng, -1) IN ('a', 's');
;
select * from contr_services where co_id = 3642592;
--corporate user information query:
;
SELECT ca1.customer_id,ca1.custcode,ca1.billcycle,  coa.co_id, cs.tmcode,cs.spcode,cs.sncode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1,ca1.csactivated, ca1.csdeactivated,cs.cs_status,cs.cs_stat_chng,cs.cs_on_cbb
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca, ptcbill_main_sub_lnk l , customer_all ca1
WHERE
ca.custcode = '1.6115848'
--ca.customer_id = 6187521
--coa.co_id = 5979591
and ca.customer_id = l.main_customer_id
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = l.sub_customer_id     --ORDER BY csactivated
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
AND l.sub_customer_id = ca1.customer_id
--AND ca1.tmcode = 682
;


select dir.dn_num "MSISDN",
       original_start_d_t "Date Initiated",
       decode(rtx.sncode,1,decode(rtx.rtx_type, 'L', 'IDD Call','R', 'Roaming', 'r', 'Roaming','Voice'), 3,'SMS/MMS',4,'SMS/MMS',119,'GPRS', 237, '1CMN', 283,'IDD Call'  )"Type",
       decode(rtx.sncode, 283, '1CMN IDD Call(Out)',1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming(Out)','r','Roaming(In)','L','IDD Call(Out)'),
                         3,'SMS(In)',
                         4,decode(rtx.rtx_type, 'S', 'Inter-Operator SMS(Out)', 'L', 'International SMS(Out)', 'SMS(Out)'),
                         119,decode(rtx.rtx_type,'A','Local Data','R','Roaming Data', 'L', 'International '),
                         237,'1CMN'
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called NUMBER ",
       mpl.country "Country" ,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60, 0),237,nvl(rounded_volume/60, 0),283,nvl(rounded_volume/60, 0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',237, 'MINS', 283, 'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       round(rtx.rated_flat_amount,2) "Charge"
from RTX_050301 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl
where cust.custcode='1.6115848' and cust.customer_id=lnk.main_customer_id and lnk.sub_co_id=conser.co_id and conser.sncode=1
and conser.dn_id=dir.dn_id and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
--and to_char(original_start_d_t,'YYYYMMDD')>='20170301' and  to_char(original_start_d_t,'YYYYMMDD')<'20170401'
--and rtx.sncode in (4)
--and mpl.country = 'Hong Kong'
--and rtx.rtx_type = 'A'
--and rtx.rtx_type = 'S'
--and rtx.plcode <> 409
and rtx.rated_flat_amount<>0
and (( rtx.sncode  = 283 )  --1CMN IDD
  or  ( rtx.sncode = 1 and rtx.rtx_type = 'L') -- IDD
  or ( rtx.sncode = 1 and rtx.rtx_type =  'R' and rtx.plcode <> 409) -- Roaming Out
  or ( rtx.sncode = 1 and rtx.rtx_type = 'r') -- Roaming In
  or ( rtx.sncode = 4 and rtx.rtx_type = 'S') -- Local SMS
  or ( rtx.sncode = 4 and rtx.rtx_type = 'L') -- IDD SMS
)

order by 3,4,2,1
;

-- for single user:;
select dn.dn_num "MSISDN",
       original_start_d_t "Date Initiated",
       decode(rtx.sncode,1,decode(rtx.rtx_type, 'L', 'IDD Call','R', 'Roaming', 'r', 'Roaming','Voice'), 3,'SMS/MMS',4,'SMS/MMS',119,'GPRS', 237, '1CMN', 283,'IDD Call'  )"Type",
       decode(rtx.sncode, 283, '1CMN IDD Call(Out)',1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming(Out)','r','Roaming(In)','L','IDD Call(Out)'),
                         3,'SMS(In)',
                         4,decode(rtx.rtx_type, 'S', 'Inter-Operator SMS(Out)', 'L', 'International SMS(Out)', 'SMS(Out)'),
                         119,decode(rtx.rtx_type,'A','Local Data','R','Roaming Data', 'L', 'International '),
                         237,'1CMN'
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called NUMBER ",
       mpl.country "Country" ,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60, 0),237,nvl(rounded_volume/60, 0),283,nvl(rounded_volume/60, 0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',237, 'MINS', 283, 'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       rtx.rated_flat_amount "Charge"
from rtx_040401 rtx, customer_all ca, contr_services cs, contract_all coa , mpdpltab mpl, directory_number dn
where ca.customer_id = rtx.r_p_customer_id
and coa.co_id = rtx.r_p_contract_id
and coa.customer_id = ca.CUSTOMER_ID
and cs.co_id = coa.co_id
and cs.dn_id = dn.dn_id
and ca.custcode = '1.6304282'
and cs.sncode = 1
and rtx.plcode = mpl.plcode
--and rtx.rated_flat_amount <>0
order by 3,4,1,2;

select * from customer_all;
select * from contr_services;
select * from contract_all;
select * from rtx_060301;
select * from rtx_040301;
select * from RTX_050301 where sncode = 4 and rtx_type = 'R';
select * from RTX_050301 where sncode = 4 and plcode = 409;
select * from RTX_050301 where sncode = 3 and rtx_type = 'r';
select * from RTX_050301 where sncode = 3 and plcode = 409;
select * from mpdpltab where plcode = 409;
select * from ptcbill_rtx_type_group;
select sum(rated_flat_amount) from RTX_050301 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl
where cust.custcode='1.6115848' and cust.customer_id=lnk.main_customer_id and lnk.sub_co_id=conser.co_id and conser.sncode=1
and conser.dn_id=dir.dn_id and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
--and to_char(original_start_d_t,'YYYYMMDD')>='20170301' and  to_char(original_start_d_t,'YYYYMMDD')<'20170401'
and rtx.sncode in (283)
--and mpl.cc = 852 and mpl.country = 'China'
--and rtx_type = 'L'
--and rtx.plcode <> 409
and rtx.rated_flat_amount<>0
--order by 1,2
;
select distinct rtx.sncode, rtx.rtx_type, sn.des, mpl.plcode, mpl.country
from RTX_050301 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl, mpusntab sn
where cust.custcode='1.6115848' and cust.customer_id=lnk.main_customer_id and lnk.sub_co_id=conser.co_id and conser.sncode=1
and conser.dn_id=dir.dn_id and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
--and to_char(original_start_d_t,'YYYYMMDD')>='20170301' and  to_char(original_start_d_t,'YYYYMMDD')<'20170401'
--and rtx.sncode in (1,3,4,119)
and rtx.rated_flat_amount<>0
and sn.sncode = rtx.sncode
--order by 1,2
;
select *from RTX_050301;
select * from mpusntab where des like '%SMS%';
select * from mpdpltab where plcode in (1, 19, 63, 75, 100, 409);
select * from mpdpltab where plcode = 1;
select * from customer_all ca where custcode = '1.6115848';
select * from mpusptab where spcode = 208;
select * from mputmview where tmcode = 727;
SELECT * FROM contr_services WHERE co_id = 6140788 AND sncode  = 1;
select * from contract_all coa,  customer_all ca, ptcbill_main_sub_lnk l
where coa.customer_id = l.sub_customer_id
and ca.customer_id = l.main_customer_id
and ca.custcode = '1.6021493';

SELECT * FROM ptcapp_usage_hist WHERE co_id =5805013  AND customer_id =  5638718 AND date_billed = To_Date('20160401', 'yyyymmdd');
SELECT * FROM ptcbill_co_usage_summary WHERE co_id = 5805013;
select * from rtx_010402;
SELECT * FROM contr_volume_history WHERE customer_id = 6242444 ORDER BY ent_date;
SELECT * FROM customer_all ca WHERE custcode  = '1.3998670';
select * from customer_all ca where customer_id = 5744027;
select * from contract_all where customer_id = 5744027;
select * from MBSADM.ptcbill_main_sub_lnk l where main_customer_id = 3914124;
SELECT * FROM ptcbill_main_sub_lnk WHERE sub_customer_id  =   5638718;
SELECT * FROM ptcbill_main_sub_lnk WHERE main_customer_id = 3843789 AND sub_co_id IN (6488826,
6488827,
6488829,
6488830,
6488825,
6526465,
6488828
) ORDER BY eff_date;

--查询data only plan 用户的sim No.;
--682,740 为data only plan
SELECT ca.custcode, dn.dn_num, ca1.tmcode, tm.des, l.sub_customer_id,l.sub_co_id, cd.cd_sm_num
FROM customer_all ca ,   ptcbill_main_sub_lnk l , customer_all ca1 ,
mputmview tm, contr_devices cd , contr_services cs, directory_number dn
WHERE ca.custcode in ( '1.6021493', '1.6452593')
AND l.main_customer_id = ca.customer_id
AND l.sub_customer_id = ca1.customer_id
AND ca1.tmcode = tm.tmcode
AND l.sub_co_id = cd.co_id
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_id
AND cs.sncode = 1
AND ca1.tmcode in ( 682, 740)
order by ca1.tmcode, dn.dn_num
;

select dn.dn_num, ca1.tmcode, tm.des,coa.co_id, coa.customer_id, cd.cd_sm_num from customer_all ca1 ,
mputmview tm, contr_devices cd , contr_services cs, directory_number dn, contract_all coa
where dn.dn_num in(51224959
,51224962
,51225654
,53784114
,53984114
,60964539
,60964714
,61559047)
and ca1.tmcode = tm.tmcode
and cs.co_id = coa.co_id
and cs.dn_id = dn.dn_id
and cs.sncode = 1
and cd.co_id = coa.co_id
and coa.customer_id = ca1.customer_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
;

select * from contract_all where customer_id = 51224959;
select * from directory_number;
-- Jing Li sql:;
select dir.dn_num "MSISDN",
       to_char(original_start_d_t,'dd/mm/yyyy HH24:Mi:SS') "Date Initiated",
       decode(rtx.sncode,1,'Voice',3,'SMS/MMS',4,'SMS/MMS',119,'GPRS') "Type",
       decode(rtx.sncode,1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming Voice','r','Roaming Voice','L','IDD'),
                         3,'SMS(In)',
                         4,'SMS(Out)',
                         119,decode(rtx.rtx_type,'A','Local Data','R','Roaming Data')
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called Number",
       mpl.country "Country" ,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60,0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       rtx.rated_flat_amount "Charge"
from RTX_010301 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl
where cust.custcode='1.6189344' and cust.customer_id=lnk.main_customer_id and lnk.sub_co_id=conser.co_id and conser.sncode=1
and conser.dn_id=dir.dn_id and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
--and to_char(original_start_d_t,'YYYYMMDD')>='20170301' and  to_char(original_start_d_t,'YYYYMMDD')<'20170401'
and rtx.sncode in (1,3,4,119)
and rtx.rated_flat_amount<>0
order by 1,2
;

SELECT *FROM equipment WHERE customer_id = 5747798;
SELECT Sum(rounded_volume/60) FROM rtx_010401 WHERE r_p_customer_id = 6293607 AND r_p_contract_id  =6488825  ;
SELECT plcode, Sum(rounded_volume/60) FROM rtx_040401 WHERE r_p_customer_id = 6350025 AND r_p_contract_id  =6548123  AND rated_flat_amount <>0 GROUP BY plcode ;
SELECT 11224882 - 1024*1024*6 FROM dual;
SELECT * FROM rtx_070101 WHERE r_p_customer_id = 6238481 AND r_p_contract_id  =6432204  AND sncode = ;
SELECT Sum(rated_flat_amount)  FROM rtx_050401 WHERE r_p_customer_id = 4510973 AND r_p_contract_id  =4630949  AND sncode = 119 ;

SELECT * FROM customer_all ca WHERE custcode  = '1.5607861';
SELECT * FROM ptcbill_main_sub_lnk WHERE sub_customer_id  =   6350025;

SELECT *FROM equipment WHERE customer_id = 5747798;
SELECT * FROM rtx_050301 WHERE r_p_customer_id = 5803836 AND r_p_contract_id  =5979591  ;
SELECT plcode, Sum(rounded_volume/60) FROM rtx_040401 WHERE r_p_customer_id = 6350025 AND r_p_contract_id  =6548123  AND rated_flat_amount <>0 GROUP BY plcode ;
SELECT 11224882 - 1024*1024*6 FROM dual;
SELECT * FROM rtx_070101 WHERE r_p_customer_id = 6238481 AND r_p_contract_id  =6432204  AND sncode = ;


--查找所有子账号的imei
SELECT l.sub_co_id ,dn.dn_num HKG_MSISDN, mv.imei, cs.cs_sparam1 CHN_MSISDN, l.sub_customer_id
FROM customer_all ca, ptcbill_main_sub_lnk l, contr_services cs,  directory_number dn, DW_CONTRACT_IMEI_MVIEW mv, DW_HANDSET_MODEL
hd
WHERE custcode = '1.5483165'
AND ca.customer_id = l.main_customer_id
AND l.exp_date IS null
AND l.sub_co_id = cs.co_id
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.sncode = 1
AND cs.dn_id = dn.dn_id
AND mv.co_id = l.sub_co_id
AND mv.create_date = (SELECT Max(create_date) FROM  DW_CONTRACT_IMEI_MVIEW WHERE co_id= l.sub_co_id)
AND mv.model_id = hd.model_id
ORDER BY hkg_msisdn
;

SELECT * FROM contr_services WHERE co_id = 5979591;

--查找大陆副号
SELECT ca.custcode,/* l.sub_customer_id, l.sub_co_id ,*/dn.dn_num HKG_MSISDN, cs.cs_sparam1 CHN_MSISDN, ca1.tmcode,tm.des, coa.co_signed
FROM customer_all ca, ptcbill_main_sub_lnk l, contr_services cs,  contr_services cs1, directory_number dn,mputmview tm, contract_all coa, customer_all ca1
WHERE ca.custcode = '1.3248527'
AND ca.customer_id = l.main_customer_id
AND l.exp_date IS null
AND l.sub_co_id = cs.co_id
AND cs.sncode = 237
--AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.dn_id = dn.dn_id
and tm.tmcode = ca1.tmcode
and coa.customer_id = l.sub_customer_id
and ca1.customer_id = l.sub_customer_id
;
select ca.custcode,/*l.sub_co_id,*/ dn.dn_num,'--', ch.ch_status, /*l.eff_date,*/ ch.CH_VALIDFROM, ca2.tmcode,  tm.des
from customer_all ca, ptcbill_main_sub_lnk l,contract_history ch, contr_services cs, directory_number dn, customer_all ca2, mputmview tm
where ca.custcode = '1.3248527'
and ca.customer_id = l.main_customer_id
and l.sub_co_id = ch.co_id
and ch.ch_seqno = (select max(ch_seqno) from contract_history ch2 where ch2.co_id = l.sub_co_id)
and cs.co_id = l.sub_co_id
and cs.sncode = 1
and cs.dn_id = dn.dn_id
and l.sub_customer_id = ca2.customer_id
and ca2.tmcode = tm.tmcode
union
select ca.custcode,/*l.sub_co_id,*/ dn.dn_num, cs2.cs_sparam1, ch.ch_status, /*l.eff_date,*/ ch.CH_VALIDFROM, ca2.tmcode,  tm.des
from customer_all ca, ptcbill_main_sub_lnk l,contract_history ch, contr_services cs, contr_services cs2, directory_number dn, customer_all ca2, mputmview tm
where ca.custcode = '1.3248527'
and ca.customer_id = l.main_customer_id
and l.sub_co_id = ch.co_id
and ch.ch_seqno = (select max(ch_seqno) from contract_history ch2 where ch2.co_id = l.sub_co_id)
and cs.co_id = l.sub_co_id
and cs.sncode = 1
and cs.dn_id = dn.dn_id
and l.sub_customer_id = ca2.customer_id
and ca2.tmcode = tm.tmcode
and cs2.sncode = 237
and cs2.cs_Seqno = cs.cs_Seqno
and cs2.cs_seqno = (select max(cs2.cs_seqno) from contr_services cs2 where cs2.sncode = 237 and cs2.co_id = l.sub_co_id)
and cs2.co_Id = l.sub_co_id
--order by ch.ch_status, l.sub_co_id
;

select * from contr_services where co_id =5541932 and sncode = 237;
--corporate account summary :
select ca.custcode,ca2.customer_id, l.sub_co_id, dn.dn_num HKG_MSISDN , decode(cs2.cs_sparam1, null, '--', cs2.cs_sparam1) CHN_MSISDN, 
case  ch.ch_status 
when 'a' then 'Active'
when 'd' then 'Deactive'
when 's' then 'Suspend'
end STATUS
, /*l.eff_date, ch.CH_VALIDFROM, */ coo.last_co_bind_end_date, ca2.tmcode,  tm.des
from customer_all ca, ptcbill_main_sub_lnk l,contract_history ch, contr_services cs, directory_number dn, customer_all ca2, mputmview tm, contr_services cs2,
PTCAPP_CUST_CO_OFFER_SUM coo
where ca.custcode in( '1.4030997','1.6394653','1.4656007')
and ca.customer_id = l.main_customer_id
and l.sub_co_id = ch.co_id
and ch.ch_seqno = (select max(ch_seqno) from contract_history ch2 where ch2.co_id = l.sub_co_id)
and cs.co_id = l.sub_co_id
and cs.sncode = 1
and cs.dn_id = dn.dn_id
and l.sub_customer_id = ca2.customer_id
and ca2.tmcode = tm.tmcode
and cs2.sncode(+)= 237
and cs2.co_id(+) = l.sub_co_id
and ch.ch_status = 'a'
and l.sub_customer_id = coo.customer_id
and cs2.cs_seqno = (select max(cs2.cs_seqno) from contr_services cs2 where cs2.co_id = l.sub_co_id and sncode = 237)
order by ca.custcode, tm.tmcode,ch.ch_status, dn.dn_num;

select * from all_TAB_COLUMNS where column_name like '%MTHFEE%' and owner = 'MBSADM';
select * from PTCREP_BR_CUST_DATA;
select * from PTCAPP_CUST_CO_OFFER_SUM where customer_id  = 5622287;
select * from CORP_PLAN_DATA;
select * from contract_history where co_id = 3642592 order by ch_seqno;
select * from mputmview where tmcode = 742;
select * from mpusptab ;
select * from contract_all;
select * from contract_history;
select * from ptcbill_main_sub_lnk;

--查询分钟量及流量使用明细（每号码每月一条数据） ， 每月汇总。
SELECT
tm.tmcode,
tm.des,
lnk.TM_GROUP_ID,
Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') pool_fu,
a.custcode, a.co_id, a.msisdn, a.invoice_date, a.inter_voice_usage +a.intra_voice_usage, a.china_usage, Ceil(a.GPRS_USAGE/1024),Ceil(a.CHINA_GPRS_USAGE/1024)
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.6375924')
AND a.invoice_date = To_Date('20170101','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY msisdn
;
SELECT * FROM contr_services WHERE co_id =   6379001;
SELECT *FROM contract_history WHERE co_id =   6379001;
SELECT *FROM USER_tab_columns WHERE column_name = 'MODEL_ID';
SELECT * FROM PTCBILL_FREE_UNIT WHERE pkg_id = 421 AND free_unit_id = 10598;


SELECT * FROM master_occ;
SELECT *FROM other_credits WHERE tmcode =728 ;
SELECT *FROM ptcbill_sub_psh_fu_cat  WHERE  main_customer_id =4308519 ;
SELECT *FROM customer_all WHERE custcode = '1.4392172';  --6333805
SELECT * FROM mputmtab WHERE tmcode = 739;
SELECT * FROM customer_all WHERE custcode = '1.6051560';
--查询主账号下所有子账号的流量限制
SELECT dn.dn_num, volume/1024 "volume(GB)", l.sub_customer_id,  cvh.co_id, seq_no, cvh.ent_date, cs.tmcode, cs.spcode, cs.sncode FROM contr_volume_history cvh,
ptcbill_main_sub_lnk l ,contr_services cs, directory_number dn
WHERE l.sub_co_id = cvh.co_id
AND l.main_customer_id = 5987560
AND seq_no = (SELECT Max(seq_no) FROM contr_volume_history hh WHERE hh.co_id = cvh.co_id)
AND  cs.co_id = l.sub_co_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
--AND cs.dn_id IS NOT NULL
and cs.dn_id = dn.dn_id
ORDER BY dn_num;

--查询主账号下所有子账号的流量限制
SELECT dn.dn_num, volume/1024 "volume(GB)", l.sub_customer_id,  cvh.co_id /*,  seq_no, cvh.ent_date, cs.tmcode, cs.spcode, cs.sncode */ FROM contr_volume_history cvh,
ptcbill_main_sub_lnk l ,contr_services cs, directory_number dn , customer_all ca
WHERE l.sub_co_id = cvh.co_id
AND l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6051560'
AND seq_no = (SELECT Max(seq_no) FROM contr_volume_history hh WHERE hh.co_id = cvh.co_id)
AND  cs.co_id = l.sub_co_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
--AND cs.dn_id IS NOT NULL
and cs.dn_id = dn.dn_id
ORDER BY dn_num;



SELECT * FROM contr_volume_history WHERE co_id IN (6488826
) ;

SELECT *FROM rtx_060401 WHERE r_p_customer_id =  6293607 AND r_p_contract_id =  6488825 AND sncode = 119 AND ;
SELECT plcode FROM mpdpltab WHERE country = 'Russia';

SELECT distinct trunc(original_start_d_t)   FROM rtx_040401
 WHERE r_p_customer_id =  5860160 AND r_p_contract_id =  6038992 AND sncode = 119
 AND  plcode IN (SELECT plcode FROM mpdpltab WHERE country = 'Russia') ;
SELECT *  FROM rtx_040401
 WHERE r_p_customer_id =  5860160 AND r_p_contract_id =  6038992 AND sncode = 119
 AND  plcode = 157 AND original_start_d_t >= To_Date('20170104', 'yyyymmdd');

 SELECT * FROM mpusntab WHERE des LIKE '%Corp%';
SELECT *  FROM rtx_040401
 WHERE r_p_customer_id =  5860160 AND r_p_contract_id =  6038992 AND sncode = 525 ORDER BY start_d_t;



SELECT  rtx.r_p_customer_id, Sum(rounded_volume)/60/1024/1024 FROM  rtx_010401 rtx, ptcbill_main_sub_lnk l
WHERE rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND l.main_customer_id =  3843789
AND rtx.rtx_type IN ('A')
AND rtx.sncode = 119
GROUP BY rtx.r_p_customer_id;
--66931872
SELECT Sum(unb_p_gprs_usg)/60 FROM ptcapp_sub_usage psu, ptcbill_main_sub_lnk l
WHERE psu.co_id = l.sub_co_id
AND l.main_customer_id = 3843789;
--66931872

SELECT *FROM   contr_volume_history cvh,  ptcbill_main_sub_lnk l ,contr_services cs
WHERE l.sub_co_id = cvh.co_id
AND l.main_customer_id = 3843789
AND  cs.co_id = l.sub_co_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
AND cs.dn_id IS NOT null
ORDER BY cs.co_id, cvh.seq_no desc;


SELECT *FROM customer_all WHERE custcode = '1.4392172';
SELECT *FROM contract_all WHERE customer_id = 3843789;
SELECT *FROM
SELECT *FROM contr_volume_history WHERE co_id = 6422401;
SELECT * FROM ptcbill_main_sub_lnk WHERE sub_co_id = 6379001;
SELECT sub_co_id FROM ptcbill_main_sub_lnk WHERE main_customer_id = 5559330 ORDER BY sub_co_id
minus
SELECT co_id FROM (
SELECT cvh.co_id, seq_no, volume, cvh.ent_date FROM contr_volume_history cvh,   ptcbill_main_sub_lnk l
WHERE l.sub_co_id = cvh.co_id
AND l.main_customer_id = 5559330
AND seq_no = (SELECT Max(seq_no) FROM contr_volume_history hh WHERE hh.co_id = cvh.co_id) ORDER BY co_id )
;
SELECT * FROM ptcbill_main_sub_lnk WHERE main_customer_id = 3843789;
SELECT * FROM contract_history WHERE co_id = 5048296;
SELECT * FROM ptcbill_main_sub_lnk WHERE main_customer_id = 3843789;
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
 WHERE co_id = 6379001
 AND cs.spcode = sp.spcode
 AND cs.sncode = sn.sncode
 ORDER BY sp.des, sn.des, cs.cs_stat_chng;
SELECT *FROM customer_all WHERE custcode = '1.5626549';
SELECT * FROM contract_history  WHERE co_id = 3940002;
SELECT * FROM contract_all  WHERE co_id = 3940002;SELECT * FROM customer_all WHERE customer_id = 3969801;
SELECT * FROM customer_all WHERE custcode = '1.3875551';SELECT
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
WHERE a.custcode IN ('1.6051560')
AND a.invoice_date = To_Date('20170216','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY 4,3
;

SELECT * FROM ptcapp_usage_hist WHERE co_id IN (6488826,
6488827,
6488829,
6488830,
6488825,
6526465,
6488828
) AND date_billed = To_Date('20170101', 'yyyymmdd');


SELECT * FROM customer_all WHERE custcode LIKE '2.11%';
SELECT * FROM customer_all WHERE custcode = '1.4815717';
SELECT * FROM mpusntab WHERE sncode IN (1, 441, 399);
SELECT * FROM mpusptab WHERE spcode IN(361);
SELECT * FROM MPUTMview WHERE tmcode IN(754);
SELECT * FROM mputmview WHERE tmcode IN    (736);
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


SELECT * FROM ptcapp_sub_usage WHERE customer_id = 6238481 AND co_id = 6432204;
SELECT Ceil(unb_p_gprs_usg/60),Ceil(unb_p_roamgprs_usg/60),Ceil(unb_p_chn_roamgprs_usg/60)
FROM ptcapp_sub_usage WHERE customer_id = 6227103 AND co_id = 6422401;
SELECT sn.des, fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu,
mpusntab sn
WHERE tmcode = 727
AND sn.sncode = fu.pkg_id
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
--and free_unit_inter = 100
AND   fu.pkg_id = 421
;

SELECT sn.des, fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu,
mpusntab sn
WHERE tmcode = 739
AND sn.sncode = fu.pkg_id
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
--and free_unit_inter = 100
AND   fu.pkg_id IN (
SELECT sn.sncode FROM contr_services cs, mpusptab sp, mpusntab sn
 WHERE co_id = 6379001
 AND cs.spcode = sp.spcode
 AND cs.sncode = sn.sncode
 AND SubStr(cs.cs_stat_chng, -1) IN ('a', 's')
 )
;

SELECT sn.des, fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu,
mpusntab sn
WHERE tmcode = 751
AND sn.sncode = fu.pkg_id
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
AND fu.pkg_id IN (
SELECT sncode FROM contr_services cs
WHERE cs.co_id = 6488825
AND SubStr(cs.cs_stat_chng, -1) IN ('a', 's')
AND cs.cs_seqno = (SELECT Max(cs2.cs_seqno) FROM contr_services cs2
WHERE cs2.co_id = cs.co_id
AND cs2.tmcode = cs.tmcode
AND cs2.spcode = cs.spcode
AND cs2.sncode = cs.sncode)
);

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
SELECT * FROM ptcbill_roam_group WHERE roam_group = 15;
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
ids.des = pcd.source and custcode = '1.5991896'
AND msisdn = 98261820 ORDER BY seq;
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
SELECT *FROM ptcbill_invoice_detail_sum WHERE custcode = '1.5991896' ORDER BY seq;
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
SELECT sncode, call_type, rtx.* FROM rtx_070401 rtx where r_p_customer_id = 6238481 AND r_p_contract_id = 6432204 AND sncode  IN (4) AND rated_flat_amount <>0 ORDER BY start_d_t ;

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

--香港
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
--大陆
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
FROM rtx_010101 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.4392172'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
AND rtx.rated_flat_amount <> 0
GROUP BY rtx.r_p_customer_Id, rtx.r_p_contract_id,  dn.dn_num
ORDER BY dn.dn_num;

SELECT  dn.dn_num, original_start_d_t,  Decode (rtx_type, 'A', 'HK', 'R', 'China') , rounded_volume/60 FROM rtx_010101 rtx ,
 ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, directory_number dn
WHERE l.main_customer_id = ca.customer_id
AND ca.custcode = '1.4392172'
AND rtx.r_p_customer_id = l.sub_customer_id
AND rtx.r_p_contract_id = l.sub_co_id
AND rtx.sncode = 119
AND dn.dn_num = 53988328
AND ( rtx_type = 'A' OR (rtx_type = 'R' AND rtx.plcode IN (76, 115, 254, 417)))
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_Id
AND rtx.rated_flat_amount <> 0
ORDER BY original_start_d_t;

SELECT * FROM rtx_060201 ;
SELECT *FROM PTCBILL_MASTER_CONTROL;
SELECT *FROM mpusntab;
SELECT *FROM ;

SELECT *FROM ccontact ;
SELECT *FROM customer_all;
SELECT * FROM user_tab_columns WHERE column_name LIKE '%ADDR%';
SELECT *FROM MIAP_SUBSCRIPTION
 WHERE email = 'zhaojun1912@yeah.net';
 SELECT *FROM PTCBILL_CHECK_PARTY;

 SELECT
Sum(LOCAL_FREE_MINS_INTER),Sum(LOCAL_FREE_MINS_INTRA),Sum(CHINA_FREE_MINS),Sum(INTER_VOICE_USAGE),Sum(INTRA_VOICE_USAGE),Sum(CHINA_USAGE)
-- a.*
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.5607861')
AND a.invoice_date = To_Date('20161106','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
AND lnk.TM_GROUP_ID=1
ORDER BY 2
;

SELECT
tm.tmcode,
tm.des,
--lnk.TM_GROUP_ID,
--Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') pool_fu,
a.custcode, a.co_id, a.msisdn,  a.GPRS_USAGE,a.CHINA_GPRS_USAGE, a.GPRS_USAGE+ a.CHINA_GPRS_USAGE total FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.5607861')
AND a.invoice_date = To_Date('20170106','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY msisdn
;
SELECT * FROM ptcbill_co_usage_summary WHERE invoice_date = To_Date('20170116', 'yyyymmdd') AND msisdn = 67572883;
SELECT * FROM ptcbill_co_usage_summary WHERE invoice_date = To_Date('20160120', 'yyyymmdd') AND custcode = '2.11.52.64.100109';


SELECT * FROM mpusntab WHERE des LIKE '%Data Roaming Zone%' ORDER BY sncode;
SELECT * FROM  mpusntab WHERE sncode = 17;


SELECT * FROM customer_all WHERE custcode = '1.6231089';
SELECT * FROM  ptcbill_main_sub_lnk l, contr_services cs
WHERE main_customer_id = 6168377
AND l.sub_co_id = cs.co_id
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.sncode = 1;

/*查询公司账号下各现生效用户是否开通某服务*/
WITH t AS
( SELECT ca.custcode, dn.dn_num, co.co_id FROM ptcbill_main_sub_lnk l, customer_all ca, contr_services cs, contract_all co,directory_number dn, mpusntab sn
 WHERE main_customer_id = ca.customer_id
 AND ca.custcode = '1.4665750'
 AND cs.co_id = co.co_id
 AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
 --AND cs.sncode = 1
-- AND cs.sncode IN ( 423,85, 68,69,284,71)
 AND cs.dn_id = dn.dn_id
 AND l.sub_co_id = cs.co_id
 AND cs.sncode = sn.sncode
 )

 SELECT t.custcode, t.dn_num, t.co_id,/* sn.des,*/ ' Data Roaming Zone (Corporate)' des,  cs.cs_Stat_chng,
 Nvl2(cs.cs_Stat_chng, 'Activated', 'Unactivated') service_status
  FROM t,  contr_services cs --, mpusntab sn
 WHERE
 --cs.sncode IN ( 24,31,175,423,85, 68,69,284,71)
 --cs.sncode IN ( 85, 68,69,284,71)
 cs.sncode(+) = 525
 AND t.co_id = cs.co_id   (+)
-- AND cs.sncode = sn.sncode
 --AND  SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
 ORDER BY  SubStr(cs.cs_Stat_chng,-1)
;



SELECT * FROM contr_services WHERE co_id = 6432204 AND sncode IN ( 24,31,175,423);
SELECT *FROM mpusntab;

--sim (serial no.)
--select * from CONTR_DEVICES;

SELECT oh.customer_id, oh.ohrefdate, ot.otname, ot.otmerch, CASE when ot.otname LIKE '%.R.R.%' THEN otmerch
                                                                 when ot.otname LIKE '%.r.r.%' THEN otmerch
                                                                 ELSE 0
                                                            END roam_charge,
                                                            CASE when ot.otname LIKE '%.U.I.%' THEN otmerch
                                                                 ELSE 0
                                                            END idd_charge
FROM orderhdr_all oh, ordertrailer ot
WHERE oh.customer_id = 6042274
AND   oh.ohxact = ot.otxact
and   (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')
AND   oh.ohrefdate = To_Date('20161226','YYYYMMDD')  ;

SELECT oh.customer_id, oh.ohrefdate, Sum(CASE when ot.otname LIKE '%.R.R.%' THEN otmerch
                                              when ot.otname LIKE '%.r.r.%' THEN otmerch
                                              ELSE 0
                                              END )roam_charge,
                                     Sum(CASE when ot.otname LIKE '%.U.I.%' THEN otmerch
                                         ELSE 0
                                         END) idd_charge
FROM orderhdr_all oh, ordertrailer ot
WHERE oh.customer_id = 6042274
AND   oh.ohxact = ot.otxact
and   (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')
AND   oh.ohinvtype = 5
GROUP BY oh.customer_id, oh.ohrefdate
ORDER BY oh.ohrefdate
;
SELECT * FROM orderhdr_all oh, ordertrailer ot
WHERE oh.customer_id =  5870290
AND oh.ohxact = ot.otxact
AND oh.ohinvtype = 5
AND oh.ohentdate = To_Date('20160726', 'yyyymmdd')
--AND  (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')

;

  select a.*
  from ptcbpp_inv_vipp_detail a, ptcbpp_inv_vipp_header b
  where b.customer_code = 1.5935054
  and b.invoice_date =  To_Date('20161226', 'yyyymmdd')
  and a.custcode = b.customer_code
  and a.invoice_date = b.invoice_date
  order by seq_no;

SELECT * FROM orderhdr_all oh, ordertrailer ot
WHERE oh.customer_id =  6003053
AND oh.ohxact = ot.otxact
AND oh.ohinvtype = 5
AND oh.ohentdate = To_Date('20170101', 'yyyymmdd')
--AND  (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')

;

  select a.*
  from ptcbpp_inv_vipp_detail a, ptcbpp_inv_vipp_header b
  where b.customer_code = 1.6066926
  and b.invoice_date =  To_Date('20170101', 'yyyymmdd')
  and a.custcode = b.customer_code
  and a.invoice_date = b.invoice_date
  order by seq_no;

SELECT ca.custcode, oh.ohrefdate, Sum(ot.otmerch) monthly_charge,
                                     Sum(CASE when ot.otname LIKE '%.U.I.%' THEN otmerch
                                         ELSE 0
                                         END) idd_charge ,

                                     Sum(CASE when ot.otname LIKE '%.R.R.%' THEN otmerch
                                              when ot.otname LIKE '%.r.r.%' THEN otmerch
                                              ELSE 0
                                              END )roam_charge,
                                     Sum(CASE when ot.otname LIKE '%.%.%.119%' THEN otmerch
                                              ELSE 0
                                              END )data_charge,
                                     Sum(CASE when ot.otname LIKE '%119.U.R.R.%' THEN otmerch
                                              when ot.otname LIKE '%119.U.r.r.%' THEN otmerch
                                              ELSE 0
                                              END )roam_data_charge
FROM orderhdr_all oh, ordertrailer ot, customer_all ca
WHERE oh.customer_id = ca.customer_id
AND    ca.custcode = '1.6235072'
AND   oh.ohxact = ot.otxact
--and   (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')
AND   oh.ohinvtype = 5
AND oh.ohrefdate >= To_Date('20160101', 'yyyymmdd')
AND oh.ohrefdate  <= To_Date('20161231', 'yyyymmdd')

GROUP BY oh.customer_id, oh.ohrefdate, ca.custcode
ORDER BY oh.ohrefdate
;
SELECT l.session_id sid,
       s.serial#,
       l.locked_mode,
       l.oracle_username,
       l.os_user_name,
       s.machine,
       s.terminal,
       o.object_name,
       s.logon_time
  FROM v$locked_object l, all_objects o, v$session s
 WHERE l.object_id = o.object_id
   AND l.session_id = s.sid
   AND object_name = 'MB_CDR'
 ORDER BY sid, s.serial#;

 select
call_type call_type,
IMSI IMSI,
calling_number calling_number,
to_char(start_date_time, 'YYYYMMDDHH24MISS') start_date_time,
ceil(GPRSUP+GPRSDOWN) volume_byte
from mb_cdr
where  call_type in (19, 70)
and    teleservicecode = 'D0'
and    imsi LIKE '454120330%'
 and    imsi not in ('454120330000000',
                     '454120330000001',
                     '454120330000002',
                     '454120330000003',
                     '454120330000004',
                     '454120330000005',
                     '454120330000006',
                     '454120330000007',
                     '454120330000008',
                     '454120330000009',
                     '454120330000010',
                     '454120330000011',
                     '454120330000012',
                     '454120330000013',
                     '454120330000021',
                     '454120330000026',
                     '454120330000014')
and    cdr_status = 'N'
--for update
order by start_date_time

 ALTER SYSTEM KILL SESSION '31663,45853';

 SELECT * FROM IT_P2938.nico_hw_ims_cdr WHERE apnni LIKE '%gncpcscf01.1ba.2ca.20170214095750%';
 SELECT * FROM v$database;
UPDATE IT_P2938.nico_hw_ims_cdr SET test_tag = 'T09-0101'  WHERE apnni LIKE '%gncpcscf01.1ab.62b.20170306064530%'  AND test_tag IS null ;


 SELECT * FROM v$database;
 SELECT * FROM IT_P2938.nico_hw_ims_cdr where test_tag IS NOT NULL ORDER BY start_date_time;

--54983805  基本套餐之外的流量包查询
select ca.co_id,cust.customer_id,cust.custcode,cust.billcycle,cust.prgcode from directory_number dirnum,contr_services conser,contract_all ca,customer_all cust
where ca.customer_id=cust.customer_id and conser.co_id=ca.co_id
 and substr(conser.cs_stat_chng,-1,1) in ('a','s') and dirnum.dn_id=conser.dn_id and   dirnum.dn_num='54983805';

 select sn.des, cs.* from contr_services cs, mpusntab sn where co_id=6594956 and cs.sncode = sn.sncode order by cs.sncode;
select * from mpusntab where sncode = 374;
select * from mpusntab order by 1 desc;

 select * from ptcbill_free_unit where pkg_id = 692;
--通过tmcode唯一确定free数据流量
select tm.des, tfu.* from ptcbill_tm_free_unit tfu, mputmview tm
 where free_unit_id in (10691, 10692, 10693)
and tfu.tmcode = tm.tmcode;


对于ptcbill_free_unit，一般有三条记录，HK ，  HK&China  ，大中华，但是只能用其中一条

----共享QoS

        select pool_type, decode(pool_type, 4, 2, 3, 0, 2, 1)
        from CORP_SUB_PSH_QOS_HISTORY h
        where h.main_customer_id = 6394884
        and   h.sub_customer_id = 6395177
        and   h.STATUS = 'a'
        and   h.VALIDFROM = (select max(h1.VALIDFROM) from CORP_SUB_PSH_QOS_HISTORY h1
                             where h1.main_customer_id = h.main_customer_id
                             and   h1.sub_customer_id = h.sub_customer_id);

QoS = 2, NOT POOL SHARE QOS and NOT POOL DATA.
QoS = 1 POOL QOS and POOL DATA.
QoS = 0 NOT POOL QOS but POOL SHARE DATA.
;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('2/13/2017 11:11:59 AM','mm/dd/yyyy HH:mi:ss am') ;
 SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('3/9/2017 3:51:38 PM','mm/dd/yyyy HH:mi:ss am') ;
  SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('2/24/2017 3:51:38 PM','mm/dd/yyyy HH:mi:ss am') ;
  SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('5-Apr-17  	11:38:55','dd-Mon-yy HH24:mi:ss') ;
  UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '23-T03-0103', test_page='23 E2E-Roaming(MIT)' WHERE  To_Date('3/17/2017 4:21:26 PM', 'mm/dd/yyyy HH:mi:ss am') = start_date_time ;

 --SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE file_name LIKE '%CMHK-GMSC-01-20170309172141-001578.dat%';
 --SELECT DISTINCT file_name FROM     IT_P2938.nico_hw_cs_cdr  ORDER BY file_name;
-- SELECT * FROM   IT_P2938.nico_hw_cs_cdr    where
 --file_name LIKE 'CMHK-VMSC-02-20170309170621-001115.dat%' AND msisdn = '67572227721';
 -- AND test_tag IS NULL;

SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE file_name LIKE '%CMHK-VMSC-02-20170407123058-001523.dat%' ORDER BY START_date_time;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('22.02.2017 15:38:24','dd.mm.yyyy HH24:mi:ss') ;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('4/7/2017 12:22:29 PM','mm/dd/yyyy HH:mi:ss am') ;


  UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '20-T02-0113', test_page='20 E2E-SIMN Service(MIT)' WHERE  To_Date('2/24/2017 5:16:32 PM', 'mm/dd/yyyy HH:mi:ss am') = start_date_time ;
   UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '20-T01-0207', test_page='20 E2E-SIMN Service(MIT)' WHERE   file_name LIKE '%CMHK-VMSC-02-20170217145614-000759.dat%' AND duration =9 AND ton = 0 ;




   SELECT To_Char(start_date_time, 'HH:mi:ss am') FROM IT_P2938.nico_hw_cs_cdr;

   --    msisdn = '85256407209' AND othermsisdn='56407249';
 --

 select to_date('2005-01-01 13:14:20','yyyy-MM-dd HH24:mm:ss') from dual;
 --FILE_name = 'CMHK-VMSC-01-20170203101753-001421.dat';

 select trunc(sysdate ,'year') from dual;
UPDATE IT_P2938.nico_hw_cs_cdr SET test_tag = 'T09-0101'  WHERE apnni LIKE '%gncpcscf01.1ab.62b.20170306064530%'  AND test_tag IS null ;
 WITH t   AS ( SELECT customer_id FROM customer_all WHERE passportno = '05711286')


SELECT ca.customer_id, coa.co_id, dn.dn_num HKG_MSISDN,  cs.cs_sparam1 CHN_MSISDN FROM customer_all ca, contr_services cs, contr_services cs1, directory_number dn,    contract_all coa,  t
WHERE ca.customer_id = t.customer_id
AND cs.co_id = coa.co_id
AND SubStr(cs.cs_stat_chng, -1) IN ('a', 's')
AND coa.customer_id = ca.customer_id
AND cs.sncode = 237
AND cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.dn_id = dn.dn_id
ORDER BY hkg_msisdn;

SELECT * FROM PTCCPS_CALL_TYPE;
--rtx_0X0401 当期未出账rtx
select * from rtx_060401;

select distinct(trunc(start_d_t)) from rtx_060301 ;


