<?php

// this script will copy the files to our server via my remote ssh mount.

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

define('ProjectRoot','..');
define('StockDir', '/avorion-0.11.0.7844/data/scripts');
define('ModDir', '/avorion-mothballing/data/scripts');
define('RemoteDir','Z:\home\avorion\steamcmd\avorion\data\scripts');
define('LocalDir','D:\Games\Steam\steamapps\common\Avorion\data\scripts');

define('Files',[
	'/commands/mothballs.lua'           => '/patch-commands-mothballs.diff',
	'/lib/dcc-mothballs/enable.lua'     => '/patch-lib-dcc-mothballs-enable.diff',
	'/lib/dcc-mothballs/disable.lua'    => '/patch-lib-dcc-mothballs-disable.diff',
	'/lib/dcc-mothballs/mothballed.lua' => '/patch-lib-dcc-mothballs-mothballed.diff'
]);

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

function
Pathify(String $Filepath):
String {
/*//
generate proper file paths for the os given that we are writing the code for
forward slashes in mind. seems to be needed for some windows commands.
//*/

	$Filepath = str_replace('%VERSION%','Version',$Filepath);

	return str_replace('/',DIRECTORY_SEPARATOR,$Filepath);
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

$File;
$Patch;
$Command;

foreach(Files as $File => $Patch) {
	$Command = sprintf(
		'xcopy /R /Y %s %s',
		escapeshellarg(Pathify(ProjectRoot.ModDir.$File)),
		escapeshellarg(Pathify(RemoteDir.$File))
	);

	//echo $Command, PHP_EOL;
	system($Command);

	$Command = sprintf(
		'xcopy /R /Y %s %s',
		escapeshellarg(Pathify(ProjectRoot.ModDir.$File)),
		escapeshellarg(Pathify(LocalDir.$File))
	);

	//echo $Command, PHP_EOL;
	system($Command);
}
