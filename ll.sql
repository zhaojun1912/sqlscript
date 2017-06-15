SELECT * FROM directory_number   WHERE dn_id = 1534039;
SELECT * FROM directory_number   WHERE dn_num = 56283868;
Get imsi from iccid.
select zn.des,  m.* from mpulktmm m, mpuzntab zn where tmcode=490 and spcode = 37 and  sncode=119  and m.zncode = zn.zncode and zn.des like 'China%';
select IL01,IC01,IL10,IC10,typeind,zncode from mpulktmm where tmcode=653 and spcode=214 and sncode=1  and zncode=3;
SELECT IL01,IC01,IL10,IC10,type_ind FROM ptcrate_tariff_usage WHERE tariff_id = 32 AND vscode = 1 AND sncode = 1 AND digit_id=86;
SELECT IL01,IC01,IL10,IC10,type_ind FROM ptcrate_tariff_usage WHERE tariff_id = 32 and sncode = 119;
select * from user_tables where table_name like '%ZONE%';
select * from mpulktmm where tmcode=653 and spcode=37 and sncode=119 ;

select * from rtx_040401;
select * from PTCBILL_ZONE_GROUP where zncode = 869;

SELECT port_num FROM storage_medium,port WHERE SM_SERIALNUM='89852121408280038032'
    AND storage_medium.sm_id=port.sm_id
    ;
select * from ptcbill_sub_psh_fu_cat;    
select * from USER_TAB_COLUMNS where column_name like  'COUNTRY' and table_name like 'PTC%';
MPDHPLMN
select * from MPDHPLMN
 where plcode = 409 ;
select * from PTC_IDRS_ROAM_PLMN where plcode = 409;
select * from PTCDMG_DN where plcode = 409;
select * from mpusptab where spcode in(89,214);
select * from ptcbill_main_sub_lnk where  main_customer_id = 6295349 and exp_date is null order by sub_customer_id;
select * from ptcbill_main_sub_lnk where sub_customer_id = 6295350;
select * from ptcbill_main_sub_lnk where sub_co_id = 5130254;
select * from customer_all ca where ca.custcode = '1.6356272';
select * from customer_all ca where ca.customer_Id = 3792949;
select * from contr_services where dn_id = 5083885;
select * from contr_services  cs where co_id = 5130254 and substr(cs.cs_stat_chng, -1) IN ('a', 's');
select * from customer_all ca where ca.customer_id = 3946509;
select * from contract_all coa where customer_id = 6059981;
select * from contract_history where co_id = 5130254;
select * from TAPIN_RTX where calling_number = '68124860444' 
and charging_start_datetime >= to_date('20170401', 'yyyymmdd')
and charging_start_datetime <= to_date('20170402', 'yyyymmdd');
SELECT * FROM ptcbill_free_unit WHERE pkg_id = 504;
select * from ptcbill_rtx_type_group;
select * from MBSADM.PTCBILL_ROAM_GROUP where roam_group = 15;
select * from MBSADM.PTCBILL_ZONE_GROUP ;
SELECT * FROM ptcapp_usage_hist where roam_amt = 294; WHERE co_id =5801773  AND customer_id =  5635626 AND date_billed = To_Date('20170521', 'yyyymmdd');
SELECT 3/60*1024 FROM ptcapp_usage_hist WHERE co_id =6432204  AND customer_id =  6238481 AND date_billed = To_Date('20160920', 'yyyymmdd');
SELECT * FROM ptcapp_sub_usage su WHERE co_id =5801773  AND customer_id =  5635626 ;
SELECT * FROM ptcbill_co_usage_summary WHERE co_id = 5805013;
SELECT * FROM PTCCPS_CALL_TYPE;
SELECT * FROM master_occ;
SELECT *FROM other_credits WHERE tmcode =728 ;
SELECT *FROM ptcbill_sub_psh_fu_cat  WHERE  main_customer_id =4308519 ;
SELECT * FROM PTCBILL_FREE_UNIT WHERE pkg_id = 421 AND free_unit_id = 10598;
SELECT * FROM TAPIN_FILE WHERE f_filename = 'CDJPNDOHKGPP02534';
SELECT Max(f_id)  FROM "TAPIN_RTX_DMP" WHERE ROWNUM<=1;
SELECT * FROM tapin_cdr WHERE ROWNUM <= 1;
SELECT * FROM s2t_roaming_output_file  WHERE filename = 'GGSN_S2T_2016090508' ;
SELECT * FROM s2t_cdr;
SELECT * FROM GPRS_CDR_DETAIL_ROAMING_MVNO WHERE  file_name = 'GGSN_S2T_2016090508' ;
SELECT * FROM tapin_Rtx WHERE
--tapin_output_file = 'CDJPNDOHK0PP02534'
 imsi = '454120410751713'
 AND tapin_filename = 'CDJPNDOHKGPP02534'
AND msisdn = '85259335232';
SELECT tmcode,o_p_number, original_Start_d_t, sncode, call_type, actual_volume, rated_flat_amount, remark, tzcode 
FROM rtx_060301 WHERE r_p_customer_id = 5762830 AND sncode = 1 AND rtx_type = 'L';

;
select length('oracle 字符串长度') from dual;
select * from ptcbill_rtx_type_group ;
select * from ptcbill_zone_group;
select * from ptcbill_roam_group where roam_group in (5);

SELECT * FROM ptcbill_free_unit;
SELECT * FROM ptcbill_pkg_group WHERE pkg_id = 421;
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907002;
SELECT * FROM sms_group  WHERE GRp_id IN (0, 8200);
SELECT * FROM ptcbill_cat_Group WHERE cat_group = 907006;
SELECT * FROM ptcbill_rtx_type_Group ;
SELECT * FROM ptcbill_roam_group WHERE roam_group = 15;

SELECT * FROM contr_devices;
SELECT *FROM port WHERE  port_num = 454120054983764;
SELECT *FROM EQUIPMENT;

SELECT * FROM mputmview WHERE des LIKE 'Corp %';
SELECT * FROM customer_all WHERE tmcode = 727;
SELECT custcode, msisdn, invoice_date,s.*  FROM ptcbill_co_usage_summary s
 WHERE tmcode = 509 AND  invoice_date = To_Date('20161120', 'yyyymmdd');
SELECT *  FROM ptcapp_usage_hist s
 WHERE air_entitle_tmcode = 509 AND  date_billed = To_Date('20161120', 'yyyymmdd');

SELECT pcd.cdesc, ids.*FROM ptcbill_invoice_detail_cosum ids,
ptcbpp_cfg_description pcd
WHERE
ids.des = pcd.source and custcode = '1.5991896'
AND msisdn = 98261820 ORDER BY seq;
SELECT * FROM ptcbill_text_config ;
SELECT * FROM ptcbpp_cfg_description WHERE ROWNUM <= 1;


SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' and tag IN ('ITB1I','ITB1A') AND msisdn = 53031755 ORDER BY seq;
SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' and tag IN ('ITB1R','ITB1r') AND msisdn = 53031755 ORDER BY plcode, seq;
SELECT * FROM ptcbill_invoice_detail_cdr WHERE custcode = '1.6204460' AND msisdn = 51084508;

SELECT * FROM ptcbill_invoice_header WHERE custcode =    '1.6204460';
SELECT *FROM ptcbill_invoice_detail_sum WHERE custcode = '1.5991896' ORDER BY seq;
SELECT *FROM ptcbill_text_config ;
SELECT * FROM 	ptcbpp_cfg_rateplan WHERE tmcode = 653;
SELECT * FROM ptcapp_bill_country pbc, MPDPLTAB dpl
WHERE pbc.source = dpl.source ;
SELECT * FROM mpulktmz WHERE zpcode = 231;
SELECT * FROM ptcbill_idd_roa_display WHERE sncode = 4;

-- rtx_xx0401: 若未出账单，则记录未出账月服务使用记录;若已出账单，则记录上月服务使用记录。
--single user information query( 237 assigned):
SELECT ca.customer_id,ca.custcode,ca.cscusttype,ca.billcycle,  coa.co_id, ca.tmcode, tm.des,cs.spcode,sp.des, cs.sncode, sn.des,cs.dn_id,
dn.dn_num, cs1.cs_sparam1,ca.csactivated, ca.csdeactivated,cs.cs_status,cs.cs_stat_chng,cs.cs_on_cbb
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca, mputmview tm,mpusptab sp, mpusntab sn, contr_services cs1
WHERE
dn.dn_num = '59335706'
--ca.custcode = '1.6338176'
--ca.customer_id = 6187521
--coa.co_id = 5979591
--coa.co_id = 3642592
and cs.sncode = 1
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id    
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
and ca.tmcode = tm.tmcode
and cs.spcode = sp.spcode
and cs.sncode = sn.sncode
and cs1.sncode = 237
and cs1.co_id = coa.co_id
and substr(cs1.cs_stat_chng, -1) IN ('a', 's');
;

--single user information query( 237 not assigned):
SELECT ca.customer_id,ca.custcode,ca.cscusttype,ca.billcycle,  coa.co_id, ca.tmcode, tm.des,cs.spcode,sp.des, cs.sncode, sn.des,cs.dn_id,
dn.dn_num, '--', ca.csactivated, ca.csdeactivated,cs.cs_status,cs.cs_stat_chng,cs.cs_on_cbb
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca, mputmview tm,mpusptab sp, mpusntab sn
WHERE
dn.dn_num = '59335706'
--ca.custcode = '1.6294079'
--ca.customer_id = 6187521
--coa.co_id = 5979591
and cs.sncode = 1
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = ca.customer_id    
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
and ca.tmcode = tm.tmcode
and cs.spcode = sp.spcode
and cs.sncode = sn.sncode
;
select * from contr_services where co_id = 3642592;
select * from mpusptab where spcode = 208;

--all user services for single user:
select dn.dn_num,  cs.co_id, cs.spcode,sp.des, cs.sncode, sn.des, cs.cs_stat_chng
from contr_services cs, customer_all ca, contract_all coa,mpusptab sp, mpusntab sn, directory_number dn, contr_services cs2
where cs.co_id = coa.co_id
and ca.customer_id = coa.customer_id
--and ca.custcode = '1.6294079'
and dn.dn_num = '56467939'
and substr(cs.cs_stat_chng, -1) IN ('a', 's')
and cs.spcode = sp.spcode
and cs.sncode = sn.sncode
and dn.dn_id = cs2.dn_id
and cs2.sncode = 1
and cs2.co_id = coa.co_id
and substr(cs2.cs_stat_chng, -1) IN ('a', 's')
--and sn.sncode in (525)
order by sp.spcode, sn.sncode
;

--all user services all user under corporate main  user:
select dn.dn_num, cs.co_id, cs.spcode,sp.des, cs.sncode, sn.des,cs.cs_stat_chng
from contr_services cs, customer_all ca, contract_all coa,mpusptab sp, mpusntab sn, directory_number dn, contr_services cs2, ptcbill_main_sub_lnk l
where cs.co_id = coa.co_id
and l.sub_customer_id = coa.customer_id
and l.sub_co_id = coa.co_id
and ca.custcode = '1.3763107'
and ca.customer_id = l.main_customer_id
and substr(cs.cs_stat_chng, -1) IN ('a', 's', 'd')
and cs.co_id = l.sub_co_id
and cs.spcode = sp.spcode
and cs.sncode = sn.sncode
and dn.dn_id = cs2.dn_id
and cs2.co_id = l.sub_co_id
and cs2.sncode = 1
and cs2.co_id = coa.co_id
and substr(cs2.cs_stat_chng, -1) IN ('a', 's')
--and sn.des like '%IDD%'
order by dn.dn_num, sp.spcode, sn.sncode
;

--corporate user information query:   
SELECT ca.custcode,ca1.customer_id,ca1.custcode,ca1.billcycle,  coa.co_id, cs.tmcode,cs.spcode,cs.sncode, cs.spcode,cs.sncode,cs.dn_id,
dn.dn_num, cs.cs_sparam1,ca1.csactivated, ca1.csdeactivated,cs.cs_status,cs.cs_stat_chng,cs.cs_on_cbb
FROM directory_number dn, contr_services cs,contract_all coa,customer_all ca, ptcbill_main_sub_lnk l , customer_all ca1
WHERE
ca.custcode = '1.3977778'
--ca.customer_id = 6187521
--coa.co_id = 5979591
and ca.customer_id = l.main_customer_id
and cs.sncode = 1
AND dn.dn_id = cs.dn_id
AND cs.co_id = coa.co_id
AND coa.customer_id = l.sub_customer_id     --ORDER BY csactivated
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
AND l.sub_customer_id = ca1.customer_id
--AND ca1.tmcode = 682
;

--CDR summary for corportate user:
select rtx.sncode, rtx.rtx_type, sn.des, mpl.plcode, mpl.country, sum( rounded_volume)
, sum(rated_flat_amount)
from RTX_060401 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl, mpusntab sn
where cust.custcode='1.6534883' 
and cust.customer_id=lnk.main_customer_id 
and lnk.sub_co_id=conser.co_id 
and conser.sncode=1
and conser.dn_id=dir.dn_id 
and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
--and rtx.rated_flat_amount<>0
and sn.sncode = rtx.sncode
group by rtx.sncode, rtx.rtx_type, sn.des, mpl.plcode, mpl.country
order by 1,2,3
;

select  dir.dn_num, original_start_d_t,rtx.rtx_type,rtx.plcode,o_p_number,actual_volume,  rounded_volume, rated_flat_amount
from RTX_060401 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl, mpusntab sn
where cust.custcode='1.6534883' 
and cust.customer_id=lnk.main_customer_id 
and lnk.sub_co_id=conser.co_id 
and conser.sncode=1
and conser.dn_id=dir.dn_id 
and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
--and rtx.rated_flat_amount<>0
and sn.sncode = rtx.sncode
and rtx.sncode = 1
and mpl.country = 'China'
and (rtx.rtx_type in ('R')
or (rtx.rtx_type in ('r')))
and dir.dn_num = '56190220'
--and rtx.rtx_type in ('L')
--and substr(o_p_number,1,2) = '86'
order by dir.dn_num, original_start_d_t
;

--CDR summary for single user:
select rtx.sncode, rtx.rtx_type, sn.des, mpl.plcode, mpl.country, sum( rounded_volume)
, sum(rated_flat_amount)
from RTX_030101 rtx,customer_all ca,contr_services cs, contract_all coa, directory_number dn ,mpdpltab mpl, mpusntab sn
where 
--ca.custcode='1.6204422' 
dn.dn_num = '1.6294079'
and ca.customer_id = coa.customer_id
and cs.co_id = coa.co_id
and cs.sncode=1
and cs.dn_id=dn.dn_id 
and rtx.plcode=mpl.plcode
and rtx.r_p_customer_id=ca.customer_id
AND rtx.r_p_contract_id = coa.co_id
--and rtx.rated_flat_amount<>0
and sn.sncode = rtx.sncode
group by rtx.sncode, rtx.rtx_type, sn.des, mpl.plcode, mpl.country
order by 1,2,3
;
select * from RTX_010101;
select * from RTX_;
-- for single user:;
select dn.dn_num "MSISDN",
       original_start_d_t "Date Initiated",
       decode(rtx.sncode,1,decode(rtx.rtx_type, 'L', 'IDD Call','R', 'Roaming', 'r', 'Roaming','Voice'), 3,'SMS/MMS',4,'SMS/MMS',119,'GPRS', 237, '1CMN', 283,'IDD Call'  )"Type",
       decode(rtx.sncode, 283, '1CMN IDD Call(Out)',1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming(Out)','r','Roaming(In)','L','IDD Call(Out)'),
                         3,'SMS(In)',
                         4,decode(rtx.rtx_type, 'S', 'Inter-Operator SMS(Out)', 'L', 'International SMS(Out)','R','Roaming SMS(Out)', 'SMS(Out)'),
                         119,decode(rtx.rtx_type,'A','Local GPRS','R','Roaming GPRS'),
                         237,'1CMN'
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called NUMBER ",
       mpl.country "Country" ,
       --zp.des zone,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60, 0),237,nvl(rounded_volume/60, 0),283,nvl(rounded_volume/60, 0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',237, 'MINS', 283, 'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       rtx.rated_flat_amount "Charge"
from rtx_010101 rtx, customer_all ca, contr_services cs, contract_all coa , mpdpltab mpl, directory_number dn --, mpuzptab zp
where ca.customer_id = rtx.r_p_customer_id
and coa.co_id = rtx.r_p_contract_id
and coa.customer_id = ca.CUSTOMER_ID
and cs.co_id = coa.co_id
and cs.dn_id = dn.dn_id
--and ca.custcode = '1.6204422'
and dn.dn_num = 59335706
and cs.sncode = 1
and SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
and rtx.plcode = mpl.plcode
--and rtx.zpcode = zp.zpcode
and rtx.rated_flat_amount <>0
and rtx.sncode = 119
--and rtx.rtx_type = 'R'
order by 3,4,6,1,2;

select * from rtx_070101;

-- for corporate user;
select dir.dn_num "MSISDN",
       original_start_d_t "Date Initiated",
       decode(rtx.sncode,1,decode(rtx.rtx_type, 'L', 'IDD Call','R', 'Roaming', 'r', 'Roaming','Voice'), 3,'SMS/MMS',4,'SMS/MMS',119,'GPRS', 237, '1CMN', 283,'IDD Call'  )"Type",
       decode(rtx.sncode, 283, '1CMN IDD Call(Out)',1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming(Out)','r','Roaming(In)','L','IDD Call(Out)'),
                         3,'SMS(In)',
                         4,decode(rtx.rtx_type, 'S', 'Inter-Operator SMS(Out)', 'L', 'International SMS(Out)', 'R','Roaming SMS(Out)','SMS(Out)'),
                         119,decode(rtx.rtx_type,'A','Local GPRS','R','Roaming GPRS'),
                         237,'1CMN'
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called NUMBER ",
       mpl.country "Country" ,
       mpl.plcode,
       --zp.des zone,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60, 0),237,nvl(rounded_volume/60, 0),283,nvl(rounded_volume/60, 0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',237, 'MINS', 283, 'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       round(rtx.rated_flat_amount,2) "Charge" 
from RTX_010101 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl --, mpuzptab zp
where cust.custcode='1.6356272' 
and cust.customer_id=lnk.main_customer_id 
and lnk.sub_co_id=conser.co_id 
and conser.sncode=1
and SubStr(conser.cs_Stat_chng,-1) IN ('a','s')
and conser.dn_id=dir.dn_id 
and rtx.plcode=mpl.plcode
--and rtx.zpcode = zp.zpcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
and ( rtx.sncode = 119 )
-- mpl.country = 'China'
--and dir.dn_num = 98620868
and rtx.rated_flat_amount<>0
--and (( rtx.sncode  = 283 )  --1CMN IDD
--  or (rtx.sncode = 1 and rtx.rtx_type = 'R' and mpl.country = 'China' ) -- 1CMN Out
--  or (rtx.sncode = 1 and rtx.rtx_type = 'r' and mpl.country = 'China'  and not ( mpl.plcode =  409 and rtx.rtx_type = 'r' )) -- 1CMN In
--  or  ( rtx.sncode = 1 and rtx.rtx_type = 'L' /* and substr(o_p_number,1,2) <> '86' */) -- HK IDD
--  or ( rtx.sncode = 1 and rtx.rtx_type =  'R' and mpl.country <> 'China') -- Roaming Out
--  or ( rtx.sncode = 1 and rtx.rtx_type = 'r' and mpl.country <> 'China') -- Roaming In
--  or ( rtx.sncode = 4 and rtx.rtx_type = 'S') -- Local SMS
--  or ( rtx.sncode = 4 and rtx.rtx_type = 'L') -- IDD SMS
--  or ( rtx.sncode = 4 and rtx.rtx_type = 'R' and mpl.country= 'China') -- ICMN SMS
--  or ( rtx.sncode = 4 and rtx.rtx_type = 'R' and mpl.country<> 'China') -- Roaming SMS
--  or ( rtx.sncode = 119 )
--)
order by 3,4,6,2,1
;
select * from RTX_010101;
-- for corporate user;
select dir.dn_num "MSISDN",
       original_start_d_t "Date Initiated",rtx.sncode,
       decode(rtx.sncode,1,decode(rtx.rtx_type, 'L', 'IDD Call','R', 'Roaming', 'r', 'Roaming','Voice'), 3,'SMS/MMS',4,'SMS/MMS',119,'GPRS', 237, '1CMN', 283,'IDD Call'  )"Type",
       decode(rtx.sncode, 283, '1CMN IDD Call(Out)',1,decode(rtx.rtx_type,'A','Local Voice','R','Roaming(Out)','r','Roaming(In)','L','IDD Call(Out)'),
                         3,'SMS(In)',
                         4,decode(rtx.rtx_type, 'S', 'Inter-Operator SMS(Out)', 'L', 'International SMS(Out)', 'R','Roaming SMS(Out)','SMS(Out)'),
                         119,decode(rtx.rtx_type,'A','Local GPRS','R','Roaming GPRS'),
                         237,'1CMN'
                         )"Service",
       decode(rtx.sncode,119,'--',o_p_number) "Calling/Called NUMBER ",
       mpl.country "Country" ,
       mpl.plcode,
       --zp.des zone,
       decode(rtx.sncode,1,nvl(ceil(rounded_volume/60),0),119,nvl(rounded_volume/60, 0),237,nvl(rounded_volume/60, 0),283,nvl(rounded_volume/60, 0),rounded_volume) "Duration",
       decode(rtx.sncode,1,'MINS',237, 'MINS', 283, 'MINS',3,'[Msg]',4,'[Msg]',119,'[KB]') "Unit",
       'Normal' "Voice Type",
       round(rtx.rated_flat_amount,2) "Charge"
from RTX_010401 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl --, mpuzptab zp
where cust.custcode='1.6123385' 
and cust.customer_id=lnk.main_customer_id 
and lnk.sub_co_id=conser.co_id 
and conser.sncode=1
and conser.dn_id=dir.dn_id 
and rtx.plcode=mpl.plcode
--and rtx.zpcode = zp.zpcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
and rtx.sncode  in (1)
and mpl.country = 'China' and ((rtx.rtx_type in ( 'r') and (rtx.plcode <> 409 ))  or ( rtx.rtx_type = 'R' and substr(rtx.o_p_number,1,2) in ( '86', '85')))
--and mpl.country = 'China' and (rtx.rtx_type in ('R', 'r') and (rtx.plcode <> 409 or rtx.rtx_type <> 'r')) 
--and dir.dn_num = 56284433
and original_start_d_t  in (select original_start_d_t 
from RTX_010401 rtx,customer_all cust,ptcbill_main_sub_lnk lnk ,contr_services conser,directory_number dir ,mpdpltab mpl --, mpuzptab zp
where cust.custcode='1.6356272' 
and cust.customer_id=lnk.main_customer_id 
and lnk.sub_co_id=conser.co_id 
and conser.sncode=1
and conser.dn_id=dir.dn_id 
and rtx.plcode=mpl.plcode
--and rtx.zpcode = zp.zpcode
and rtx.r_p_customer_id=lnk.sub_customer_id
AND rtx.r_p_contract_id = lnk.sub_co_id
and rtx.sncode  in (283)
and mpl.country = 'China' and (rtx.rtx_type in ('R', 'r')) 
--and dir.dn_num = 56284433
);
--and sp_code = 89
order by rtx.sncode,dir.dn_num, rtx.rtx_type,mpl.plcode,rtx.o_p_number, original_start_d_t
;
--and rtx.rated_flat_amount<>0
and (( rtx.sncode  = 283 )  --1CMN IDD
  or (rtx.sncode = 1 and rtx.rtx_type = 'R' and mpl.country = 'China') -- 1CMN Out
  or (rtx.sncode = 1 and rtx.rtx_type = 'r' and mpl.country = 'China') -- 1CMN In
  or  ( rtx.sncode = 1 and rtx.rtx_type = 'L' /*   */) -- HK IDD
  or ( rtx.sncode = 1 and rtx.rtx_type =  'R' and mpl.country <> 'China') -- Roaming Out
  or ( rtx.sncode = 1 and rtx.rtx_type = 'r' and mpl.country <> 'China') -- Roaming In
  or ( rtx.sncode = 4 and rtx.rtx_type = 'S') -- Local SMS
  or ( rtx.sncode = 4 and rtx.rtx_type = 'L') -- IDD SMS
  or ( rtx.sncode = 4 and rtx.rtx_type = 'R' and mpl.country= 'China') -- ICMN SMS
  or ( rtx.sncode = 4 and rtx.rtx_type = 'R' and mpl.country<> 'China') -- Roaming SMS
)
and dir.dn_num = '56284433'
and rtx.rtx_type in ( 'R', 'r')
and mpl.country = 'China'
and rtx.sncode in ( 283, 1)
and (rtx.rtx_type = 'r' )
and substr(o_p_number,1,3) <>  '852'
order by rtx.sncode
;

SELECT tmcode,o_p_number, original_Start_d_t, sncode, call_type, actual_volume, rated_flat_amount, remark, tzcode 
FROM rtx_060301 WHERE r_p_customer_id = 5762830 AND sncode = 1 AND rtx_type = 'L';

SELECT sn.des,cs.* FROM contr_services cs, mpusntab sn
WHERE cs.sncode = sn.sncode
AND   cs.co_id = 5936297
And   cs.sncode = 508;

SELECT * FROM ptcbill_free_unit WHERE pkg_id = 481;

--查询sim no.
SELECT sm.sm_serialnum, cd.cd_sm_num FROM storage_medium sm, contr_devices cd
WHERE cd.cd_sm_num = sm.sm_serialnum;
select * from mputmview where tmcode = 653;
select * from contr_devices ;
--查询data only plan 用户的sim No.;
--682,740 为data only plan
SELECT dn.dn_num MSISDN,tm.des RATEPLAN,  ca.custcode, ca1.custcode,/*ca1.tmcode, l.sub_customer_id,l.sub_co_id,*/ cd.cd_sm_num SIM_NO
FROM customer_all ca ,   ptcbill_main_sub_lnk l , customer_all ca1 ,
mputmview tm, contr_devices cd , storage_medium sm, contr_services cs, directory_number dn
WHERE ca.custcode in ('1.6416812'
,'1.6469561'
,'1.6479593'
,'1.6496390'

)
and l.EXP_DATE is null
AND l.main_customer_id = ca.customer_id
AND l.sub_customer_id = ca1.customer_id
AND ca1.tmcode = tm.tmcode
AND l.sub_co_id = cd.co_id
AND cs.co_id = l.sub_co_id
AND cs.dn_id = dn.dn_id
AND cs.sncode = 1
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
--and l.sub_customer_id = 6386733
and cd.cd_sm_num = sm.sm_serialnum
and sm.sm_status in ( 'a')
--AND ca1.tmcode in ( 682, 740)
order by ca.custcode,dn.dn_num, ca1.tmcode
;

--查找所有子账号的imei(只包括有大陆号码的用户)
SELECT l.sub_co_id ,dn.dn_num HKG_MSISDN, mv.imei, cs2.cs_sparam1 CHN_MSISDN, l.sub_customer_id
FROM customer_all ca, ptcbill_main_sub_lnk l, contr_services cs, contr_services cs2, directory_number dn, DW_CONTRACT_IMEI_MVIEW mv, DW_HANDSET_MODEL
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
and cs2.sncode = 237
and cs2.co_id = cs.co_id
AND SubStr(cs2.cs_Stat_chng,-1) IN ('a','s')
ORDER BY hkg_msisdn
;

--查询sim no.
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

--br no. 查询1CMN　PRC number.
SELECT ca.custcode, ca.customer_id, coa.co_id CONTRACT_ID,dn.dn_num HKG_MSISDN, cs1.cs_sparam1 CHN_MSISDN, ca.tmcode,tm.des RATE_PLAN /*,ch.ch_validfrom CONTRACT_VALIDFROM, coo.LAST_CO_BIND_END_DATE CONTRACT_END_DATE*/
FROM customer_all ca,  contr_services cs,  contr_services cs1, directory_number dn,mputmview tm, contract_all coa, PTCAPP_CUST_CO_OFFER_SUM coo, contract_history ch 
WHERE ca.passportno = '18045383'
AND ca.customer_id = coa.customer_id
AND cs.co_id = coa.co_id
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.sncode = 1
and cs.dn_id = dn.dn_id
and tm.tmcode = ca.tmcode
and cs1.sncode = 237
and SubStr(cs1.cs_Stat_chng,-1) IN ('a','s')
and coo.co_id = coa.co_id
and cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
and ch.ch_status = 'a'
and ch.co_id = coa.co_id
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
union all
--br no. 查询1CMN不含PRC number.
SELECT ca.custcode, ca.customer_id, coa.co_id ,dn.dn_num HKG_MSISDN, 'N/A' , ca.tmcode,tm.des/*,ch.ch_validfrom, coo.LAST_CO_BIND_END_DATE*/
FROM customer_all ca,  contr_services cs,directory_number dn,mputmview tm, contract_all coa, PTCAPP_CUST_CO_OFFER_SUM coo, contract_history ch 
WHERE ca.passportno = '18045383'
AND ca.customer_id = coa.customer_id
AND cs.co_id = coa.co_id
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.sncode = 1
and cs.dn_id = dn.dn_id
and tm.tmcode = ca.tmcode
and coo.co_id = coa.co_id
and not exists( select 1 from contr_services cs2 where cs2.sncode = 237 and cs2.co_id = cs.co_id and SubStr(cs2.cs_Stat_chng,-1) IN ('a','s'))
and ch.ch_status = 'a'
and ch.co_id = coa.co_id
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
order by custcode,customer_id
;

--查询集客1CMN PRC number.
--corporate account summary :
SELECT ca.custcode MAIN_CUSTCODE, ca1.custcode CUSTCODE, l.sub_customer_id, l.sub_co_id CONTRACT_ID ,dn.dn_num HKG_MSISDN, cs.cs_sparam1 CHN_MSISDN,  ca1.tmcode TMCODE,tm.des RATE_PLAN/*,ch.CH_VALIDFROM CONTRACT_VALIDFROM, coo.LAST_CO_BIND_END_DATE CONTRACT_END_DATE*/
FROM customer_all ca, ptcbill_main_sub_lnk l, contr_services cs,  contr_services cs1, directory_number dn,mputmview tm, contract_all coa, customer_all ca1, contract_history ch 
, PTCAPP_CUST_CO_OFFER_SUM coo
WHERE ca.custcode in ('1.4086674')
AND ca.customer_id = l.main_customer_id
AND l.exp_date IS null
AND l.sub_co_id = cs.co_id
/*237 service is activated*/
AND cs.sncode = 237
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.dn_id = dn.dn_id
and tm.tmcode = ca1.tmcode
and coa.customer_id = l.sub_customer_id
and ca1.customer_id = l.sub_customer_id
and coo.co_id = l.sub_co_id
and ch.co_id = l.sub_co_id
and ch.ch_status = 'a'
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
union all
SELECT ca.custcode, ca1.custcode,l.sub_customer_id, l.sub_co_id CONTRACT_ID ,dn.dn_num HKG_MSISDN, '--' CHN_MSISDN, ca1.tmcode TMCODE,tm.des RATE_PLAN/*, ch.CH_VALIDFROM,coo.LAST_CO_BIND_END_DATE*/
FROM customer_all ca, ptcbill_main_sub_lnk l, contr_services cs,  contr_services cs1, directory_number dn,mputmview tm, contract_all coa, customer_all ca1, contract_history ch
, PTCAPP_CUST_CO_OFFER_SUM coo
WHERE ca.custcode in ('1.4086674')
AND ca.customer_id = l.main_customer_id
AND l.exp_date IS null
AND l.sub_co_id = cs.co_id
--AND cs.sncode = 237
and cs.sncode = 1
AND SubStr(cs.cs_Stat_chng,-1) IN ('a','s')
AND cs.co_id = cs1.co_id
AND cs.cs_Seqno=cs1.cs_seqno
AND cs1.dn_id = dn.dn_id
and tm.tmcode = ca1.tmcode
and coa.customer_id = l.sub_customer_id
and ca1.customer_id = l.sub_customer_id
and coo.co_id = l.sub_co_id
and ch.co_id = l.sub_co_id
and ch.ch_status = 'a'
/*237 service is deactivated and 237 is unassigned*/
and coa.co_id = ch.co_id
and ch.ch_status = 'a'
and ch.CH_SEQNO = (select max(CH_SEQNO) from contract_history where co_id = ch.co_id)
and not exists ( select 1 from contr_services cs2 where cs2.sncode = 237 and cs2.co_id = cs.co_id and SubStr(cs2.cs_Stat_chng,-1) IN ('a','s')) 
;
select * from ptcbill_co_usage_summary a where a.co_id = 6490644;
--查询流量使用明细（每号码每月一条数据） ， 每月汇总。
SELECT
tm.tmcode,
tm.des,
lnk.TM_GROUP_ID,
Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') pool_fu,
a.custcode, a.co_id,co.customer_id, a.msisdn, a.invoice_date, a.FREE_GPRS, a.GPRS_USAGE,  a.EXTRA_GPRS_VOL,  a.FREE_CHINA_GPRS,  a.CHINA_GPRS_USAGE,  a.EXTRA_CHINA_GPRS_VOL, a.CHINA_LOCAL_GPRS_USAGE, a.EXTRA_GPRS_VOL + a.EXTRA_CHINA_GPRS_VOL  EXTRA_CHINA_LOCAL_GPRS_VOL
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.6356272')
AND a.invoice_date in ( To_Date('20170601','yyyymmdd'))
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY co.customer_id,7,4,3
;
--查询分钟量使用明细（每号码每月一条数据） ， 每月汇总。
SELECT
--tm.tmcode,
--tm.des,
--lnk.TM_GROUP_ID,
--Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') pool_fu,
a.custcode, a.co_id, a.msisdn, a.invoice_date, (a.LOCAL_FREE_MINS_INTER),(a.LOCAL_FREE_MINS_INTRA),(a.CHINA_FREE_MINS),(a.INTER_VOICE_USAGE),(a.INTRA_VOICE_USAGE),(a.CHINA_USAGE)
FROM ptcbill_co_usage_summary a, contract_all co, customer_all ca, mputmview tm, ptcbill_rateplan_group_lnk lnk
WHERE a.custcode IN ('1.6356272')
--AND a.invoice_date in ( To_Date('20170316','yyyymmdd'))
and a.invoice_date >= To_Date('20170601','yyyymmdd') and a.invoice_date <= To_Date('20170920','yyyymmdd')
AND a.co_id = co.co_id
AND co.customer_id = ca.customer_id
AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
ORDER BY a.invoice_date, a.msisdn
;
select * from ptcbill_co_usage_summary a where a.invoice_date in ( To_Date('20170301','yyyymmdd')) and a.custcode IN ('1.5128767');
select * from ptcapp_usage_hist where co_id = 5196902 and date_billed = to_date('20170301','yyyymmdd');
SELECT su.customer_id, tm.tmcode,
tm.des,
lnk.TM_GROUP_ID,
--Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= to_date('20170526', 'yyyymmdd') AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > to_date('20170526', 'yyyymmdd'))), 'N') pool_fu,
ca.custcode, su.co_id,dn.dn_num,to_char(su.date_billed,'yyyymmdd'), Ceil(gprs_usg/60),/*Ceil(unb_p_roamgprs_usg/60),*/Ceil(roamgprs_chn_usg/60) 
FROM ptcapp_usage_hist su, contract_all co, customer_all ca, mputmview tm, MBSADM.PTCBILL_MAIN_SUB_LNK l,ptcbill_rateplan_group_lnk lnk, customer_all ca2,directory_number dn,contr_services cs
WHERE ca.custcode IN ('1.5128767')
AND su.co_id = l.sub_co_id
and su.date_billed in ( To_Date('20170301','yyyymmdd'))
AND l.main_customer_id = ca.customer_id
--AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
and ca2.customer_id = l.sub_customer_id
and tm.tmcode = ca2.tmcode
and co.customer_id = ca2.customer_id
and cs.sncode = 1
and substr(cs.cs_stat_chng,-1) in ('a','s','d')
and cs.dn_id = dn.dn_id
and cs.co_id = l.sub_co_id
order by su.customer_id
;

SELECT tm.tmcode,
tm.des,
--lnk.TM_GROUP_ID,
--Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= to_date('20170526', 'yyyymmdd') AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > to_date('20170526', 'yyyymmdd'))), 'N') pool_fu,
ca.custcode, su.co_id,dn.dn_num, 'UNBILLED',unb_p_roamnor_usg, unb_p_roamnor_amt, Ceil(unb_p_air_usg_inter/60),Ceil(unb_p_air_usg_intra/60),  Ceil(unb_p_gprs_usg/60),/*Ceil(unb_p_roamgprs_usg/60),*/Ceil(unb_p_chn_roamgprs_usg/60) 
FROM ptcapp_sub_usage su, contract_all co, customer_all ca, mputmview tm, MBSADM.PTCBILL_MAIN_SUB_LNK l,ptcbill_rateplan_group_lnk lnk, customer_all ca2,directory_number dn,contr_services cs
WHERE ca.custcode IN ('1.3977778')
AND su.co_id = l.sub_co_id
AND l.main_customer_id = ca.customer_id
--AND ca.tmcode = tm.tmcode
--AND Nvl((SELECT 'Y' FROM ptcbill_sub_psh_fu_cat WHERE sub_customer_id = ca.customer_id AND free_unit_cat_id = 16 AND EFF_BILL_DATE <= a.invoice_date AND (EXP_BILL_DATE IS NULL OR EXP_BILL_DATE > a.invoice_date)), 'N') = 'Y'
AND tm.tmcode = lnk.tmcode
and ca2.customer_id = l.sub_customer_id
and tm.tmcode = ca2.tmcode
and co.customer_id = ca2.customer_id
and cs.sncode = 1
and substr(cs.cs_stat_chng,-1) in ('a','s')
and cs.dn_id = dn.dn_id
and cs.co_id = l.sub_co_id
order by 7, 4,3
;
select * from contr_volume_history where co_id = 6422402;
--查询主账号下所有子账号的流量限制
SELECT dn.dn_num, volume/1024 "volume(GB)", l.sub_customer_id,  cvh.co_id /*,  seq_no, cvh.ent_date, cs.tmcode, cs.spcode, cs.sncode */ FROM contr_volume_history cvh,
ptcbill_main_sub_lnk l ,contr_services cs, directory_number dn , customer_all ca
WHERE l.sub_co_id = cvh.co_id
AND l.main_customer_id = ca.customer_id
AND ca.custcode = '1.6221883'
AND seq_no = (SELECT Max(seq_no) FROM contr_volume_history hh WHERE hh.co_id = cvh.co_id)
AND  cs.co_id = l.sub_co_id
AND substr(cs.cs_stat_chng, -1) IN ('a', 's')
--AND cs.dn_id IS NOT NULL
and cs.dn_id = dn.dn_id
ORDER BY dn_num;


SELECT sn.des, fu.* FROM mbsadm.ptcbill_tm_free_unit tfu, ptcbill_free_unit fu,
mpusntab sn
WHERE tmcode = 684
AND sn.sncode = fu.pkg_id
AND   tfu.expiry_date IS null
AND   tfu.free_unit_id = fu.free_unit_id
--and free_unit_inter = 300
AND   fu.pkg_id = 481
--AND   fu.pkg_id in (1)
;
select * from mpulktm2 where tmcode = 486 and sncode = 119 ;

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

--从历次账单数据中查询分类月费用
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
  where b.customer_code = 1.6394653
  and b.invoice_date =  To_Date('20170426', 'yyyymmdd')
  and a.custcode = b.customer_code
  and a.invoice_date = b.invoice_date
  order by seq_no;
select * from mputmtab where tmcode = 740;

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
AND    ca.custcode = '1.3877686'
AND   oh.ohxact = ot.otxact
--and   (ot.otname LIKE '%.R.%' OR ot.otname LIKE '%.r.%' OR ot.otname LIKE '%U.I.F%')
AND   oh.ohinvtype = 5
AND oh.ohrefdate >= To_Date('20161016', 'yyyymmdd')
AND oh.ohrefdate  <= To_Date('20170316', 'yyyymmdd')

GROUP BY oh.customer_id, oh.ohrefdate, ca.custcode
ORDER BY oh.ohrefdate
;



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
;

--54983805  基本套餐之外的流量包查询
select ca.co_id,cust.customer_id,cust.custcode,cust.billcycle,cust.prgcode from directory_number dirnum,contr_services conser,contract_all ca,customer_all cust
where ca.customer_id=cust.customer_id and conser.co_id=ca.co_id
 and substr(conser.cs_stat_chng,-1,1) in ('a','s') and dirnum.dn_id=conser.dn_id and   dirnum.dn_num='54983805';

 select sn.des, cs.* from contr_services cs, mpusntab sn where co_id=6594956 and cs.sncode = sn.sncode order by cs.sncode;

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

--CDR CHECK TEST
SELECT * FROM IT_P2938.nico_hw_ims_cdr WHERE apnni LIKE '%gncpcscf01.1ba.2ca.20170214095750%';
UPDATE IT_P2938.nico_hw_ims_cdr SET test_tag = 'T09-0101'  WHERE apnni LIKE '%gncpcscf01.1ab.62b.20170306064530%'  AND test_tag IS null ;
SELECT * FROM IT_P2938.nico_hw_ims_cdr where test_tag IS NOT NULL ORDER BY start_date_time;

SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('2/13/2017 11:11:59 AM','mm/dd/yyyy HH:mi:ss am') ;
 SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('3/9/2017 3:51:38 PM','mm/dd/yyyy HH:mi:ss am') ;
  SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('2/24/2017 3:51:38 PM','mm/dd/yyyy HH:mi:ss am') ;
  SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('5-Apr-17  	11:38:55','dd-Mon-yy HH24:mi:ss') ;
  UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '23-T03-0103', test_page='23 E2E-Roaming(MIT)' WHERE  To_Date('3/17/2017 4:21:26 PM', 'mm/dd/yyyy HH:mi:ss am') = start_date_time ;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE file_name LIKE '%CMHK-VMSC-02-20170407123058-001523.dat%' ORDER BY START_date_time;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('22.02.2017 15:38:24','dd.mm.yyyy HH24:mi:ss') ;
SELECT * FROM IT_P2938.nico_hw_cs_cdr WHERE   start_date_time = To_Date('4/7/2017 12:22:29 PM','mm/dd/yyyy HH:mi:ss am') ;
  UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '20-T02-0113', test_page='20 E2E-SIMN Service(MIT)' WHERE  To_Date('2/24/2017 5:16:32 PM', 'mm/dd/yyyy HH:mi:ss am') = start_date_time ;
   UPDATE IT_P2938.nico_hw_cs_cdr
SET test_tag = '20-T01-0207', test_page='20 E2E-SIMN Service(MIT)' WHERE   file_name LIKE '%CMHK-VMSC-02-20170217145614-000759.dat%' AND duration =9 AND ton = 0 ;
SELECT To_Char(start_date_time, 'HH:mi:ss am') FROM IT_P2938.nico_hw_cs_cdr;
select to_date('2005-01-01 13:14:20','yyyy-MM-dd HH24:mm:ss') from dual;
SELECT * FROM customer_all WHERE passportno = '18045383' and cstype = 'a';
select trunc(sysdate ,'year') from dual;
UPDATE IT_P2938.nico_hw_cs_cdr SET test_tag = 'T09-0101'  WHERE apnni LIKE '%gncpcscf01.1ab.62b.20170306064530%'  AND test_tag IS null ;

select * from v$parameter WHERE name LIKE 'nls%';
SELECT * FROM v$database;
SELECT * FROM v$instance;

--查询锁表状态
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
 
--查询大查询状态
SELECT s.sid, s.serial#,  sa.sql_id, sql_text, s.logon_time, s.sql_exec_start, s.machine, s.osuser, s.module FROM v$session s, v$sqlarea sa 
where s.machine like 'DESKTOP-EOUAPMT' 
and s.module = 'SQL Developer'
and s.sql_id = sa.sql_id
--and s.osuer = ''
--and sa.sql_text like '%%'
;
SELECT s.sid, s.serial#,  sa.sql_id, sql_text, s.logon_time, s.sql_exec_start, s.machine, s.osuser, s.module FROM v$session s, v$sqlarea sa 
where s.machine like 'IT-SZ09' 
and s.module = 'SQL Developer'
and s.sql_id = sa.sql_id
--and s.osuer = ''
--and sa.sql_text like '%%'
;
SELECT * FROM v$session order by logon_time desc;

alter system kill session 'sid,serial#'; 
alter system kill session '518,19';
select * from all_tables where table_name like 'RTX_%';
select  * from rtx_010201;