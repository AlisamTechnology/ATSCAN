#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

my @E_MICROSOFT=("Microsoft JET Database", "ADODB.Recordset", "500 - Internal server error", "Microsoft OLE DB Provider", "Unclosed quotes", "ADODB.Command", "ADODB.Field error", "Microsoft VBScript",
                 "Microsoft OLE DB Provider for SQL Server", "Unclosed quotation mark", "Microsoft OLE DB Provider for Oracle", "Active Server Pages error", "OLE/DB provider returned message",
                 "OLE DB Provider for ODBC", "error \"800a0d5d\"", "error \"800a000d\"", "Unclosed quotation mark after the character string", "SQL Server", "Warning: odbc_");
my @E_ORACLE=("ORA-00921: unexpected end of SQL command", "ORA-01756", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended");
my @E_DB2=("DB2 ODBC", "DB2 error", "DB2 Driver");
my @E_ODBC=("ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver");
my @E_POSTGRESQL=("Warning: pg_", "PostgreSql Error:", "function.pg", "Supplied argument is not a valid PostgreSQL result", "PostgreSQL query failed: ERROR: parser: parse error", ": pg_");
my @E_SYBASE=("Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "sybase_", "ODBC Driver");
my @E_JBOSSWEB=("java.sql.SQLSyntaxErrorException: ORA-", "org.springframework.jdbc.BadSqlGrammarException:", "javax.servlet.ServletException:", "java.lang.NullPointerException");
my @E_JDBC=("Error Executing Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver");
my @E_JAVA=("java.io.IOException: InfinityDB");
my @E_PHP=("Warning: include", "Fatal error: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include",
           "Disallowed Parent Path", "function.require", "Warning: main", "Warning: session_start\(\)", "Warning: getimagesize\(\)", "Warning: array_merge\(\)", "Warning: preg_match\(\)",
           "GetArray\(\)", "FetchRow\(\)", "Warning: preg_", "Warning: ociexecute\(\)", "Warning: ocifetchstatement\(\)", "PHP Warning:");
my @E_ASP=("Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF",
           "Unclosed quotation mark", "Error converting data type varchar to numeric");
my @E_LUA=("LuaPlayer ERROR:", "CGILua message", "Lua error");
my @E_UNDEFINED=("Incorrect syntax near", "Fatal error", "Invalid Querystring", "Input string was not in a correct format", "An illegal character has been found in the statement");
my @E_MARIADB=("MariaDB server version for the right syntax");
my @E_SHELL=("c99shell<\/title\>", "C99Shell v", "<form method=\"POST\" action=\"cfexec.cfm\"\>", "<input type=text name=\".CMD\" size=45 value=", "<title\>awen asp.net webshell<\/title\>",
             "<FORM METHOD=GET ACTION=\"cmdjsp.jsp\"\>", "JSP Backdoor Reverse Shell", "Simple CGI backdoor by DK", "execute command: <input type=\"text\" name=\"c\"\>", "Execute Shell Command",
             "r57shell<\/title\>", "<title>r57Shell", "heroes1412", "MyShell", "PHP Shell", "PHPShell", "REMVIEW TOOLS", "<title>iTSecTeam<\/title>", "JSP Backdoor Reverse Shell",
             "<title\>(.*)ernealizm(.*)\/title>", "<title\>JSP Shell<\/title\>", "<title\>KNULL Shell<\/title\>", "<title\>(.*)WSO(.*)<\/title>", "<title>SST Sheller !<\/title\>",
             "<title\>SyRiAn Sh3ll", "<title\>Mini Php Shell", "<title>ASPX Shell<\/title>", "<title>ZoRBaCK Connect<\/title>", "<title>.+Ani-Shell.+<\/title>",
             "<title>Stored Procedure Execute<\/title\>", "<title\>:: www.h4ckcity.org :: Coded By 2MzRp & LocalMan ::<\/title\>", "<title\>PhpShell 2.0<\/title\>",
             "<title\>(.*)NTDaddy(.*)<\/title\>", "<title\>PHP-Terminal");

## MENU
sub get_validate_microsoft { return @E_MICROSOFT; }
sub get_validate_oracle { return @E_ORACLE; }
sub get_validate_db2 { return @E_DB2; }
sub get_validate_odbc { return @E_ODBC; }
sub get_validate_postgresql { return @E_POSTGRESQL; }
sub get_validate_sysbase { return @E_SYBASE; }
sub get_validate_jbossweb { return @E_JBOSSWEB; }
sub get_validate_jdbc { return @E_JDBC; }
sub get_validate_java { return @E_JAVA; }
sub get_validate_php { return @E_PHP; }
sub get_validate_asp { return @E_ASP; }
sub get_validate_lua { return @E_LUA; }
sub get_validate_undefined { return @E_UNDEFINED; }
sub get_validate_mariadb { return @E_MARIADB; }
sub get_validate_shell { return @E_SHELL; }

1;
