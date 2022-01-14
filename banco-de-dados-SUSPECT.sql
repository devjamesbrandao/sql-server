SQL SERVER em mod suspect, o que fazer?

-- Passo a passo:
ALTER DATABASE LojaOnline set emergency

DBCC CHECKDB (LojaOnline)

ALTER DATABASE LojaOnline SET SINGLE_USER WITH ROLLBACK IMMEDIATE

DBCC CHECKDB (LojaOnline, repair_allow_data_loss) WITH NO_INFOMSGS, WITH PHYSICAL_ONLY

ALTER DATABASE (LojaOnline) SET MULTI_USER