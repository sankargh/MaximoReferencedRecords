--########-- MS-SQL --########--

---Search by WONUM---
---Replace 'W10001' & 'SITE01' with relevant Workorder Number(s) & SiteID (OR) Any other where clause as required
select 'select * from '+objectname+' where '+attributename+' in (''W10001'') and SITEID=''SITE01'';' as Query,OBJECTNAME,ATTRIBUTENAME 
from maxattributecfg 
where attributename in ('WONUM','REFWO','RECORDKEY') and persistent=1
AND EXISTS (SELECT 1 FROM MAXRELATIONSHIP WHERE PARENT='WORKORDER' AND CHILD=maxattributecfg.OBJECTNAME and
(WHERECLAUSE LIKE '%recordkey%' OR WHERECLAUSE LIKE '%wonum=:wonum%' OR WHERECLAUSE LIKE '%refwo=:wonum%'));

---Search by WORKORDERID---
---Replace '10001' with relevant WorkorderID(s) (OR) Any other where clause as required
select 'select * from '+objectname+' where '+attributename+' in (''10001'') and OWNERTABLE=''WORKORDER'';' as Query,OBJECTNAME,ATTRIBUTENAME
from MAXATTRIBUTECFG 
where PERSISTENT=1 AND ATTRIBUTENAME in ('OWNERID')  
AND EXISTS (SELECT 1 FROM MAXATTRIBUTECFG a WHERE ATTRIBUTENAME='OWNERTABLE' AND a.OBJECTNAME=MAXATTRIBUTECFG.OBJECTNAME)
AND EXISTS (SELECT 1 FROM MAXRELATIONSHIP WHERE PARENT='WORKORDER' AND CHILD=MAXATTRIBUTECFG.OBJECTNAME and
(WHERECLAUSE LIKE '%ownerid%'));

-------------------------------------------------------------------------------------------------------------------------------

--########-- Oracle, DB2 --########--

---Search by WONUM---
--- Replace 'W10001' & 'SITE01' with relevant Workorder Number(s) & SiteID (OR) Any other where clause as required
select 'select * from '||objectname||' where '||attributename||' in (''W10001'') and SITEID=''SITE01'';' as Query,OBJECTNAME,ATTRIBUTENAME 
from maxattributecfg 
where attributename in ('WONUM','REFWO','RECORDKEY') and persistent=1
AND EXISTS (SELECT 1 FROM MAXRELATIONSHIP WHERE PARENT='WORKORDER' AND CHILD=maxattributecfg.OBJECTNAME and
(WHERECLAUSE LIKE '%recordkey%' OR WHERECLAUSE LIKE '%wonum=:wonum%' OR WHERECLAUSE LIKE '%refwo=:wonum%'));

---Search by WORKORDERID---
---Replace '10001' with relevant WorkorderID(s) (OR) Any other where clause as required
select 'select * from '||objectname||' where '||attributename||' in (''10001'') and OWNERTABLE=''WORKORDER'';' as Query,OBJECTNAME,ATTRIBUTENAME
from MAXATTRIBUTECFG 
where PERSISTENT=1 AND ATTRIBUTENAME in ('OWNERID')  
AND EXISTS (SELECT 1 FROM MAXATTRIBUTECFG a WHERE ATTRIBUTENAME='OWNERTABLE' AND a.OBJECTNAME=MAXATTRIBUTECFG.OBJECTNAME)
AND EXISTS (SELECT 1 FROM MAXRELATIONSHIP WHERE PARENT='WORKORDER' AND CHILD=MAXATTRIBUTECFG.OBJECTNAME and
(WHERECLAUSE LIKE '%ownerid%'));
