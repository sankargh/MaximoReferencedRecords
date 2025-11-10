--Generate select queries to find WO reference in all tables--

--MS-SQL--
select 'select '+cast((ROW_NUMBER() OVER(ORDER BY objectname ASC)) as varchar)+' , * from '+objectname+' (nolock) where '+attributename+'=''W00001'' and siteid=''SITE01'';', * from maxattributecfg (nolock) where attributename in ('WONUM','REFWO','RECORDKEY')
and persistent=1;


--Oracle--
select 'SELECT * FROM '||OBJECTNAME||' WHERE '||ATTRIBUTENAME||'=''W00001'' and SITEID=''SITE01'';' as Script,
OBJECTNAME,ATTRIBUTENAME  from MAXATTRIBUTECFG where ATTRIBUTENAME in ('WONUM','REFWO','RECORDKEY');