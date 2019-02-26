#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

our @E_MICROSOFT=("Microsoft JET Database", "ADODB.Recordset", "500 - Internal server error", "Microsoft OLE DB Provider", "Unclosed quotes", "ADODB.Command", "ADODB.Field error", "Microsoft VBScript",
                 "Microsoft OLE DB Provider for SQL Server", "Unclosed quotation mark", "Microsoft OLE DB Provider for Oracle", "Active Server Pages error", "OLE/DB provider returned message",
                 "OLE DB Provider for ODBC", "error \"800a0d5d\"", "error \"800a000d\"", "Unclosed quotation mark after the character string", "SQL Server", "Warning: odbc_");
our @E_ORACLE=("ORA-00921: unexpected end of SQL command", "ORA-01756", "ORA-", "Oracle ODBC", "Oracle Error", "Oracle Driver", "Oracle DB2", "error ORA-", "SQL command not properly ended");
our @E_DB2=("DB2 ODBC", "DB2 error", "DB2 Driver");
our @E_ODBC=("ODBC SQL", "ODBC DB2", "ODBC Driver", "ODBC Error", "ODBC Microsoft Access", "ODBC Oracle", "ODBC Microsoft Access Driver");
our @E_POSTGRESQL=("Warning: pg_", "PostgreSql Error:", "function.pg", "Supplied argument is not a valid PostgreSQL result", "PostgreSQL query failed: ERROR: parser: parse error", ": pg_");
our @E_SYBASE=("Warning: sybase_", "function.sybase", "Sybase result index", "Sybase Error:", "Sybase: Server message:", "sybase_", "ODBC Driver");
our @E_JBOSSWEB=("java.sql.SQLSyntaxErrorException: ORA-", "org.springframework.jdbc.BadSqlGrammarException:", "javax.servlet.ServletException:", "java.lang.NullPointerException");
our @E_JDBC=("Error Executing Database Query", "SQLServer JDBC Driver", "JDBC SQL", "JDBC Oracle", "JDBC MySQL", "JDBC error", "JDBC Driver");
our @E_JAVA=("java.io.IOException: InfinityDB");
our @E_PHP=("Warning: include", "Fatal error: include", "Warning: require", "Fatal error: require", "ADODB_Exception", "Warning: include", "Warning: require_once", "function.include",
           "Disallowed Parent Path", "function.require", "Warning: main", "Warning: session_start\(\)", "Warning: getimagesize\(\)", "Warning: array_merge\(\)", "Warning: preg_match\(\)",
           "GetArray\(\)", "FetchRow\(\)", "Warning: preg_", "Warning: ociexecute\(\)", "Warning: ocifetchstatement\(\)", "PHP Warning:");
our @E_ASP=("Version Information: Microsoft .NET Framework", "Server.Execute Error", "ASP.NET_SessionId", "ASP.NET is configured to show verbose error messages", "BOF or EOF",
           "Unclosed quotation mark", "Error converting data type varchar to numeric");
our @E_LUA=("LuaPlayer ERROR:", "CGILua message", "Lua error");
our @E_UNDEFINED=("Incorrect syntax near", "Fatal error", "Invalid Querystring", "Input string was not in a correct format", "An illegal character has been found in the statement");
our @E_MARIADB=("MariaDB server version for the right syntax");
our @E_SHELL=("c99shell<\/title\>", "C99Shell v", "<form method=\"POST\" action=\"cfexec.cfm\"\>", "<input type=text name=\".CMD\" size=45 value=", "<title\>awen asp.net webshell<\/title\>",
             "<FORM METHOD=GET ACTION=\"cmdjsp.jsp\"\>", "JSP Backdoor Reverse Shell", "Simple CGI backdoor by DK", "execute command: <input type=\"text\" name=\"c\"\>", "Execute Shell Command",
             "r57shell<\/title\>", "<title>r57Shell", "heroes1412", "MyShell", "PHP Shell", "PHPShell", "REMVIEW TOOLS", "<title>iTSecTeam<\/title>", "JSP Backdoor Reverse Shell",
             "<title\>(.*)ernealizm(.*)\/title>", "<title\>JSP Shell<\/title\>", "<title\>KNULL Shell<\/title\>", "<title\>(.*)WSO(.*)<\/title>", "<title>SST Sheller !<\/title\>",
             "<title\>SyRiAn Sh3ll", "<title\>Mini Php Shell", "<title>ASPX Shell<\/title>", "<title>ZoRBaCK Connect<\/title>", "<title>.+Ani-Shell.+<\/title>",
             "<title>Stored Procedure Execute<\/title\>", "<title\>:: www.h4ckcity.org :: Coded By 2MzRp & LocalMan ::<\/title\>", "<title\>PhpShell 2.0<\/title\>",
             "<title\>(.*)NTDaddy(.*)<\/title\>", "<title\>PHP-Terminal");


1;
