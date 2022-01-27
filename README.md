# Game
 An OLTP sample. This is a very small data model meant to provide a quick overlook on how to design an OLTP system <br />

## Manual Installation
1- Create a "Game" database. <br />
2- Run the script in "Schema" Folder. <br />
3- Run all the scripts in "SP" folder, and ignore the warnings (missing objects). <br />
4- Run the script in "RebuildTables" Folder. <br />
5- Run Script in "Populatedtables" Folder. <br />
6- Run Script in "Views" Folder. <br />
7- In the stored procedure "EXEC Game.CreateFKs". <br />
8- Run the script below to add a couple of order to your order table: <br />

EXEC game.InsertOrder @GameID = 101,
                	@RetailerID = 101,
	@OrderDate = '01/02/2021',
                	@Quantity = 200;

EXEC game.InsertOrder @GameID = 102,
	@RetailerID = 102,
	@OrderDate = '01/03/2021',
                	@Quantity = 1100;                    

## Using SSIS packages
1- Download the zip file into local (C:\GameDW\GameOLTP). <br />
2- Change the connection to OLTP_Connection according to your environment. <br />
3- Run BuildOLTP package to create the OLTP side. <br />

Please Note: ImportFromCSV and ExportToCSV packages will require the CSV files to be present (included in the download). <br />

