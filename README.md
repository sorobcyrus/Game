# Game
 OLTP side of Data warehouse system.

 ### This is the first part of a two part system
 1- OLTP: This is the OLTP side. 
 2- DW: Data Warehouse side is under GameDW repository

## Manual Installation
1- Create a "Game" database.
2- Run the script in "Schema" Folder.
3- Run all the scripts in "SP" folder, and ignore the warnings (missing objects).
4- Run the script in "RebuildTables" Folder.
5- Run Script in "Populatedtables" Folder.
6- Run Script in "Views" Folder.
7- In the stored procedure "EXEC Game.CreateFKs".
8- Run the script below to add a couple of order to your order table:

EXEC game.InsertOrder @GameID = 101,
                	@RetailerID = 101,
	@OrderDate = '01/02/2021',
                	@Quantity = 200;

EXEC game.InsertOrder @GameID = 102,
	@RetailerID = 102,
	@OrderDate = '01/03/2021',
                	@Quantity = 1100;                    

## Using SSIS packages
1- Download the zip file into local (C:\GameDW\GameOLTP).
2- Change the connection to OLTP_Connection according to your environment.
3- Run BuildOLTP package to create the OLTP side.

Please Note: ImportFromCSV and ExportToCSV packages will require the CSV files to be present (included in the download).

