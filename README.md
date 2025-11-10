SQL Script to generate Record(WO) References
	•	Maximo objects are linked to one another in different ways. A work order will have references in WorkLog, WOStatus, InvoiceCost, PRLines, LongDescription etc for example.
	•	In scenarios, where we need to delete a record, its reference in other objects would not allow so, or cause problems in future.
	•	As a best practice, we must find the related records in other tables as well and delete/update.

Here’s a SQL script to help in such situations.

For example, work order will have reference
	⁃	 as WONUM in WOStatus 
	⁃	 as REFWO in PRLine, InvoiceCost
	⁃	 as RECORDKEY in WorkLog

	•	This script will generate SQL queries to find related records in all related tables.
	•	We can also slightly	update to generate ‘Deletion Scripts’.
