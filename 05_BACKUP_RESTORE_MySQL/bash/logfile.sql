# The proper term is pseudo_replica_mode, but we use this compatibility alias
# to make the statement usable on server versions 8.0.24 and older.
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#250922 16:23:12 server id 1  end_log_pos 126 CRC32 0x6f8588dc 	Start: binlog v 4, server v 8.0.43-0ubuntu0.24.04.2 created 250922 16:23:12
BINLOG '
QL7RaA8BAAAAegAAAH4AAAAAAAQAOC4wLjQzLTB1YnVudHUwLjI0LjA0LjIAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAdyIhW8=
'/*!*/;
# at 126
#250922 16:23:12 server id 1  end_log_pos 157 CRC32 0x4b3a0cff 	Previous-GTIDs
# [empty]
# at 157
#250922 16:29:04 server id 1  end_log_pos 180 CRC32 0xb8586ffd 	Stop
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
# at 4
#250922 16:31:37 server id 1  end_log_pos 126 CRC32 0x3fe3ca8a 	Start: binlog v 4, server v 8.0.43-0ubuntu0.24.04.2 created 250922 16:31:37 at startup
# Warning: this binlog is either in use or was not closed properly.
ROLLBACK/*!*/;
BINLOG '
OcDRaA8BAAAAegAAAH4AAAABAAQAOC4wLjQzLTB1YnVudHUwLjI0LjA0LjIAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAA5wNFoEwANAAgAAAAABAAEAAAAYgAEGggAAAAICAgCAAAACgoKKioAEjQA
CigAAYrK4z8=
'/*!*/;
# at 126
#250922 16:31:37 server id 1  end_log_pos 157 CRC32 0x2ca0eb39 	Previous-GTIDs
# [empty]
SET @@SESSION.GTID_NEXT= 'AUTOMATIC' /* added by mysqlbinlog */ /*!*/;
DELIMITER ;
# End of log file
/*!50003 SET COMPLETION_TYPE=@OLD_COMPLETION_TYPE*/;
/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=0*/;
