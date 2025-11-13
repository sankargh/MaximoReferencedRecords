--Generate select queries to find WO reference in all tables--

--#####--MS-SQL--#####----

--Search by WONUM,SITEID--
select 'select * from '+objectname+' (nolock) where '+attributename+'=''W00001'' and siteid=''SITE01'';' as Query, * 
from maxattributecfg (nolock) 
where attributename in ('WONUM','REFWO','RECORDKEY')
and persistent=1;

--Search by WORKORDERID--
declare @workorderid varchar(20); set @workorderid='100001';
declare @ownertable varchar(20); set @ownertable='WORKORDER';

select 'select * from '+objectname+' (nolock) where '+attributename+'='''+@workorderid+''' and ownertable='''+@ownertable+''';' as Query, * 
from maxattributecfg (nolock) 
where attributename in ('OWNERID') objectname in ('COMMLOG','ESCCOMMLOG','DOCLINKS','WFTRANSACTION','WFINSTANCE')
and persistent=1;

--#####--Oracle--#####----

--Search by WONUM,SITEID--
select 'SELECT * FROM '||OBJECTNAME||' WHERE '||ATTRIBUTENAME||'=''W00001'' and SITEID=''SITE01'';' as Query,OBJECTNAME,ATTRIBUTENAME 
from MAXATTRIBUTECFG 
where ATTRIBUTENAME in ('WONUM','REFWO','RECORDKEY')
and persistent=1;

--Search by WORKORDERID--
select 'SELECT * FROM '||OBJECTNAME||' WHERE '||ATTRIBUTENAME||'=''100001'' and OWNERTABLE=''WORKORDER'';' as Query,OBJECTNAME,ATTRIBUTENAME 
from MAXATTRIBUTECFG 
where ATTRIBUTENAME in ('OWNERID') OBJECTNAME in ('COMMLOG','ESCCOMMLOG','DOCLINKS','WFTRANSACTION','WFINSTANCE')
and persistent=1;

